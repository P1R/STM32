//Vector que contiene los valores calculados de la función a generar en el DAC
const unsigned int vector[] ={2048, 2304, 2560, 2816, 3072, 3328, 3584, 3840, 4096, 256, 512, 768, 1024, 1280, 1536, 1792};

//{2047, 2339, 2631, 2923, 3215, 3507, 3799, 4091, 292, 584, 876, 1168, 1460, 1752, 1899, 2049};
//{1280,1536,1792,2048,2304,2560,2816,3072,3328,3548,3840,4096,256,512,768,1024};
unsigned short int dato_actual;
unsigned int val;
int frecuencia;

void Caden() iv IVT_INT_TIM3 ics ICS_AUTO {
TIM3_SR.UIF = 0;
dato_actual++;

if(dato_actual == 16) dato_actual = 0;

val = vector[dato_actual];
DAC_DHR12R1 = val;   //Escribe dato en el buffer del DAC
DAC_SWTRIGRbits.SWTRIG1 = 1;    //Dispara el proceso de conversión
}

void main() {
dato_actual = 0;
//Timer 3
RCC_APB1ENR.TIM3EN = 1;
TIM3_CR1.CEN = 0;
TIM3_PSC = 7;
TIM3_ARR = 142;
NVIC_IntEnable(IVT_INT_TIM3);
TIM3_DIER.UIE = 1;
TIM3_CR1.CEN = 1;
//Configurar DAC
GPIO_Analog_Input(&GPIOA_BASE, _GPIO_PINMASK_4);    //PA4 terminal analógica digital
RCC_APB1ENR.B29 = 1;   //Habilita reloj del APB1 para el DAC
DAC_CRbits.EN1 = 1;    //Enciende módulo DAC1
DAC_CRbits.BOFF1 = 1;  //Enciende buffer del DAC1
DAC_CR+= 0X38;         //Selecciona disparo mediante software
DAC_CRbits.TEN1 = 1;   //Habilita la conversión del DAC
frecuencia = 0;

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