sbit LCD_RS at GPIOB_ODR.B10;
sbit LCD_EN at GPIOB_ODR.B11;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;

sbit LAMPARA at GPIOC_ODRbits.B8;
sbit VENTILADOR at GPIOC_ODRbits.B9;

void delay(unsigned long contador);
void Config_ptos(void);
void Config_adc(void);
void Config_UART1(void);
void Proceso(void);
void Lcd_Init();
void Lcd_Cmd();
void Lcd_Out();

unsigned int adc_value;
// VRef =  5
const float R= 1221.00122e-6;
const float cuentas= 58.5709; // valor se debe calcular dependiendo tu amplificador y su ganancia y las
char uart_rd;                // resistencias 10k y 33k

void main() {
 Lcd_Init();
 Config_ptos();
 Config_adc();
 Config_UART1();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "9CM11-Termometro");
 delay_ms(2000);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 while(1){
  Proceso();
 }
}

void Config_ptos(void){
 GPIO_Digital_Output(&GPIOB_BASE,_GPIO_PINMASK_10|_GPIO_PINMASK_11|_GPIO_PINMASK_12);
 GPIO_Digital_Output(&GPIOB_BASE,_GPIO_PINMASK_13|_GPIO_PINMASK_14|_GPIO_PINMASK_15);
 GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_8|_GPIO_PINMASK_9);
 GPIO_Analog_input(&GPIOC_BASE,_GPIO_PINMASK_0);
 VENTILADOR = 0;
 LAMPARA = 0;
}
void Config_adc(void){
 ADC_Set_Input_Channel(_ADC_CHANNEL_10);
 ADC1_Init();
}
void Config_UART1(void){
 UART1_Init(9600);
 Delay_ms(100);
 /*UART1_Write_Text("Inicio");
 UART1_Write(13);
 UART1_Write(10);*/
 Lcd_Out(1, 1, "Inicia UART1");
 delay_ms(2000);
}


void Proceso(void){
 // Lectura del Voutput del sensor LM35
 // Mostrando Voutput y su conversion a �C
 char val[15];
 float volts;
 float grados;
 char centigrados[15];
 
 adc_value = ADC1_Get_Sample(10);
 grados = adc_value/cuentas;
 FloatToStr(grados,centigrados);
 UART1_Write_Text(centigrados);
 UART1_Write(13);
 UART1_Write(10);
 Lcd_Out(1, 1, centigrados);
 Lcd_Out(1, 8, "\xDFc");
 
 volts = adc_value;
 FloatToStr(volts,val);
 Lcd_Out(2, 15, "V");
 Lcd_Out(2, 1, val);
 delay(0xFFFFF);
 Lcd_Cmd(_LCD_CLEAR);
 
if (UART1_Data_Ready()) {     // If data is received
 uart_rd = UART1_Read();     // read the received data
 if (uart_rd == '1'){
  LAMPARA = ~LAMPARA;
 }
 else if (uart_rd == '2')
 {
  VENTILADOR = ~VENTILADOR;
 }
}
}


void delay(unsigned long contador)
{
 while(--contador);
}