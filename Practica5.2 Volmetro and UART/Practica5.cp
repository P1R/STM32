#line 1 "C:/Users/JorgeAlejandro/Documents/Sistemas de tiempo real/STM32-master/Practica5.2 Volmetro and UART/Practica5.c"
#line 1 "c:/mikroc pro for arm/include/math.h"





double fabs(double d);
double floor(double x);
double ceil(double x);
double frexp(double value, int * eptr);
double ldexp(double value, int newexp);
double modf(double val, double * iptr);
double sqrt(double x);
double atan(double f);
double asin(double x);
double acos(double x);
double atan2(double y,double x);
double sin(double f);
double cos(double f);
double tan(double x);
double exp(double x);
double log(double x);
double log10(double x);
double pow(double x, double y);
double sinh(double x);
double cosh(double x);
double tanh(double x);
#line 2 "C:/Users/JorgeAlejandro/Documents/Sistemas de tiempo real/STM32-master/Practica5.2 Volmetro and UART/Practica5.c"
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
 Lcd_Cmd(_LCD_CLEAR);
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
 GPIO_Analog_input(&GPIOC_BASE,_GPIO_PINMASK_0);
}
void Config_adc(void){
 ADC_Set_Input_Channel(_ADC_CHANNEL_10);
 ADC1_Init();
}

void Config_UART1(void){
 UART1_Init(9600);
 Delay_ms(100);
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
 adc_value = ADC1_Get_Sample(10);
 volts = R*adc_value;
 FloatToStr(volts,val);

 Lcd_Out(1, 1, "Voltaje:");
 Lcd_Out(2, 3, val);
 delay(0xFFFFF);
 Lcd_Cmd(_LCD_CLEAR);
 UART1_Write_Text(val);
 UART1_Write(13);
 UART1_Write(10);
}

void delay(unsigned long contador)
{
 while(--contador);
}
