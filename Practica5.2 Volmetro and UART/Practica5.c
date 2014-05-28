#include <Math.h>
sbit LCD_RS at GPIOB_ODR.B10;
sbit LCD_EN at GPIOB_ODR.B11;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;

void delay(unsigned long contador);
void Config_ptos(void);
void Config_adc(void);
void Config_UART1(void);
void Proceso(void);
void Lcd_Init();
void Lcd_Cmd();
void Lcd_Out();

unsigned int adc_value;
const float R=722.8327228e-6;

void main() {
    Lcd_Init();
    Config_ptos();
    Config_adc();
    Config_UART1();
    Lcd_Cmd(_LCD_CLEAR);               // Clear display
    Lcd_Out(1, 1, "9CM11-Volmetro");
    delay_ms(2000);
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_CURSOR_OFF);

    Lcd_Out(1, 1, "Voltaje:");
 while(1){
        Proceso();
    }
}

void Config_ptos(void){
    GPIO_Digital_Output(&GPIOB_BASE,_GPIO_PINMASK_10|_GPIO_PINMASK_11|_GPIO_PINMASK_12);
    GPIO_Digital_Output(&GPIOB_BASE,_GPIO_PINMASK_13|_GPIO_PINMASK_14|_GPIO_PINMASK_15);
    GPIO_Analog_input(&GPIOC_BASE,_GPIO_PINMASK_0); //PC0 = Canal 10 del ADC1
}
void Config_adc(void){
    ADC_Set_Input_Channel(_ADC_CHANNEL_10); // Seleciona el canal 10 como entrada de
    ADC1_Init();
}

void Config_UART1(void){
  UART1_Init(9600);              // Initialize UART module at 56000 bps
  Delay_ms(100);                  // Wait for UART module to stabilize
  UART1_Write_Text("Inicio");
  UART1_Write(13);
  UART1_Write(10);
  Lcd_Out(1, 1, "Inicia UART1");
  delay_ms(2000);
}

void Proceso(void){
    char val[5];
    float val1;
    float volts;
    adc_value = ADC1_Get_Sample(10);//valores para lectura directa en leds con anodo común
    volts = R*adc_value;
    FloatToStr(volts,val);
    //IntToStr(adc_value,val);
    Lcd_Out(1, 1, "Voltaje:");
    Lcd_Out(2, 3, val);
    delay(0xFFFFF);
    Lcd_Cmd(_LCD_CLEAR);
    UART1_Write_Text(val);       // and send data via UART
    UART1_Write(13);
    UART1_Write(10);
}

void delay(unsigned long contador) // Función para generar retardo
{
 while(--contador);
}