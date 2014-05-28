//Vector que contiene los valores calculados de la funcion a generar en el DAC
const unsigned int vector[]={ 2048, 2831, 3495, 3939, 4095, 3939, 3495, 2831, 2048, 1265, 601, 157, 1, 157, 601, 1265};

unsigned short int dato_actual;
unsigned int val;
int frecuencia;

void Caden() iv IVT_INT_TIM3 ics ICS_AUTO {
 TIM3_SR.UIF=0;
 dato_actual++;
 
 if(dato_actual==16) dato_actual=0;
 
 val=vector[dato_actual];
 DAC_DHR12R1=val;          //Escribe dat en el buffer del DAC
 DAC_SWTRIGRbits.SWTRIG1=1; //Dispara el proceso de conversion
}

void main() {
 dato_actual=0;
 //TIMER 3
 RCC_APB1ENR.TIM3EN=1;
 TIM3_CR1.CEN=0;
 frecuencia = 0;
 TIM3_PSC=7;
 TIM3_ARR=142;
 NVIC_IntEnable(IVT_INT_TIM3);
 TIM3_DIER.UIE=1;
 TIM3_CR1.CEN=1;
 //Configurar DAC
 GPIO_Analog_Input(&GPIOA_BASE, _GPIO_PINMASK_4); //PA4 terminal analógica
 RCC_APB1ENR.B29=1;             //Habilita reloh de APB1 para el DAC
 DAC_CRbits.EN1=1;              //Enciende módulo DAC1
 DAC_CRbits.BOFF1=1;            //Enciende buffer del DAC1
 DAC_CR+=0x36;                  //Selecciona disparo mediante software
 DAC_CRbits.TEN1=1;             //Habilita la conversión del DAC
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