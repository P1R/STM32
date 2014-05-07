#line 1 "C:/Users/JorgeAlejandro/Documents/Sistemas de tiempo real/STM32-master/Temporizador/Temporizador.c"
#line 12 "C:/Users/JorgeAlejandro/Documents/Sistemas de tiempo real/STM32-master/Temporizador/Temporizador.c"
void Conf_puertos(void);
void Conf_temp2(void);
void Proceso(void);
void Proceso2(void);
void Config_UART1(void);
char uart_rd;




void ISR_temp() iv IVT_INT_TIM2 ics ICS_AUTO {
 TIM2_SR.UIF=0;
  GPIOC_ODR =~ GPIOC_ODR ;
}

void main() {
Conf_puertos();
Conf_temp2();
Config_UART1();
while(1){

Proceso2();
};
}

void Proceso(void){
 TIM2_ARR= 62 ;
 delay_ms(5000);
 TIM2_ARR= 250 ;
 delay_ms(5000);
}

void Conf_puertos(void)
{
 GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_ALL);
  GPIOC_ODR =0;
}

void Conf_temp2(void)
{
 RCC_APB1ENR.TIM2EN = 1;
 TIM2_CR1.CEN=0;
 TIM2_PSC=7;

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

void Proceso2(void){
 int tm;
if (UART1_Data_Ready()) {
 uart_rd = UART1_Read();
 UART1_Write(uart_rd);
 tm = (int)uart_rd;
 TIM2_ARR = tm;
}
}
