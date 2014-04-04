#line 1 "C:/Users/p1r0/Desktop/Sistemas de tiempo real/Laboratorio/Practica5/Practica5.c"
sbit LCD_RS at GPIOB_ODR.B10;
sbit LCD_EN at GPIOB_ODR.B11;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;

void delay(unsigned long contador);
void Config_ptos(void);
void Config_adc(void);
void Proceso(void);
void Lcd_Init();
void Lcd_Cmd();
void Lcd_Out();

unsigned int adc_value;
const float R=805.8608059e-6;

void main(){
 Lcd_Init();
 Config_ptos();
 Config_adc();
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
 GPIO_Analog_input(&GPIOC_BASE,_GPIO_PINMASK_0);
}
void Config_adc(void){
 ADC_Set_Input_Channel(_ADC_CHANNEL_10);
 ADC1_Init();
}

void Proceso(void){
 char val[5];
 float volts;
 adc_value = ADC1_Get_Sample(10);
 volts = R*adc_value;
 FloatToStr(volts,val);

 Lcd_Out(1, 1, "Voltaje:");
 Lcd_Out(2, 3, val);
 delay(0xFFFFF);
 Lcd_Cmd(_LCD_CLEAR);
}

void delay(unsigned long contador)
{
 while(--contador);
}
