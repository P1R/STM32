#line 1 "C:/Users/JorgeAlejandro/Documents/Sistemas de tiempo real/STM32-master/Temporizador/Temporizador.c"
#line 17 "C:/Users/JorgeAlejandro/Documents/Sistemas de tiempo real/STM32-master/Temporizador/Temporizador.c"
sbit SALIDA at GPIOC_ODRbits.B8;
const int nivel[]={ 1911.125 ,  1803.88 ,  1702.62 ,  1607.045 ,  1516.861 ,  1431.73 ,  1351.388 ,  1275.526 ,  1203.949 ,  1136.363 ,  1072.6 ,  1012.385 ,  0 };

void Conf_puertos(void);
void Conf_temp2(void);
void Proceso(void);
void Config_UART1(void);
char uart_rd;




void ISR_temp() iv IVT_INT_TIM2 ics ICS_AUTO {
 TIM2_SR.UIF=0;
 SALIDA=~SALIDA;
}

void main() {
 int tm2;
 Conf_puertos();
 Conf_temp2();
 Config_UART1();
 tm2 = nivel[0];
 TIM2_ARR = tm2;
 Delay_ms(100000);
 tm2 = nivel[12];
 TIM2_ARR = tm2;
 Delay_ms(100000);
 tm2 = nivel[5];
 TIM2_ARR = tm2;
 Delay_ms(100000);
 tm2 = nivel[12];
 TIM2_ARR = tm2;
 Delay_ms(100000);
 while(1){
 Proceso();
 }
}


void Conf_puertos(void)
{
 GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_8);
 SALIDA=0;
}

void Conf_temp2(void)
{
 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN=0;
 TIM2_PSC=7;
 TIM2_ARR=0;
 NVIC_IntEnable(IVT_INT_TIM2);
 TIM2_DIER.UIE=1;
 TIM2_CR1.CEN=1;
 EnableInterrupts();
}

void Config_UART1(void){
 UART1_Init(9600);
 Delay_ms(100);
 UART1_Write_Text("Inicio");
 UART1_Write(13);
 UART1_Write(10);
}

void Proceso(void){
 int tm;
 int tm1;
 if (UART1_Data_Ready())
 {
 uart_rd = UART1_Read();
 tm = uart_rd - 48;
 tm1 = nivel[0];
 TIM2_ARR = tm1;
 }
}
