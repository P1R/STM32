#line 1 "C:/Users/JorgeAlejandro/Documents/Sistemas de tiempo real/STM32-master/FuncionSenoidal/FuncionSenoidal.c"

const unsigned int vector[]={ 2048, 2831, 3495, 3939, 4095, 3939, 3495, 2831, 2048, 1265, 601, 157, 1, 157, 601, 1265};

unsigned short int dato_actual;
unsigned int val;
int frecuencia;

void Caden() iv IVT_INT_TIM3 ics ICS_AUTO {
 TIM3_SR.UIF=0;
 dato_actual++;

 if(dato_actual==16) dato_actual=0;

 val=vector[dato_actual];
 DAC_DHR12R1=val;
 DAC_SWTRIGRbits.SWTRIG1=1;
}

void main() {
 dato_actual=0;

 RCC_APB1ENR.TIM3EN=1;
 TIM3_CR1.CEN=0;
 frecuencia = 0;
 TIM3_PSC=7;
 TIM3_ARR=142;
 NVIC_IntEnable(IVT_INT_TIM3);
 TIM3_DIER.UIE=1;
 TIM3_CR1.CEN=1;

 GPIO_Analog_Input(&GPIOA_BASE, _GPIO_PINMASK_4);
 RCC_APB1ENR.B29=1;
 DAC_CRbits.EN1=1;
 DAC_CRbits.BOFF1=1;
 DAC_CR+=0x36;
 DAC_CRbits.TEN1=1;
 while(1){
 if(frecuencia%2==0){
 TIM3_ARR = 63;
 }
 else{
 TIM3_ARR = 142;
 }
 if(GPIOA_IDR.B0){
 frecuencia++;
 }
Delay_ms(200);
}
}
