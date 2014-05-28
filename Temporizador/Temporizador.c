/*Generción de ua onda de 400*/

#define N1 1911.125 //DO4
#define N2 1803.88 //DOS
#define N3 1702.62  //RE4
#define N4 1607.045 //RES
#define N5 1516.861 //MI
#define N6 1431.73 //FA
#define N7 1351.388 //FAS               // sEMI-PERIODO  DE LA NOTA EN MICRO SEGUNDO
#define N8 1275.526 //SOL4
#define N9 1203.949 //SOLS
#define N10 1136.363 //LA4
#define N11  1072.6 //LAS
#define N12 1012.385 //SI4
#define N13 0 //DO4

sbit SALIDA at GPIOC_ODRbits.B8;
const int nivel[]={N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13};

void Conf_puertos(void);
void Conf_temp2(void);
void Proceso(void);
void Config_UART1(void);
char uart_rd;


// ISR DEL TIMER2 CREADA MEDIANTE EL ASISTENTE DEL MICRO C

void ISR_temp() iv IVT_INT_TIM2 ics ICS_AUTO {
 TIM2_SR.UIF=0;     // LIMPIA LA BANDERA DE INTERRUPCION.
 SALIDA=~SALIDA;  // COMPLETA ESTDO DEL PUERTO
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
 RCC_APB1ENR.TIM2EN = 1; // Habilita el timer 2 para usar el relog de APB1 (8 Mhz)
 TIM2_CR1.CEN=0;        // Deshabilita el contador del timer 2
 TIM2_PSC=7;            // Factor de división del preescalador: Freloj= Fapb1/(PSC + 1)= 1Mh
 TIM2_ARR=0;          // Define el valor de desborde y reinicio del contador
 NVIC_IntEnable(IVT_INT_TIM2); // Enmascaramiento de la interrupción del timer 2
 TIM2_DIER.UIE=1;              // Habilita la generación de interrupción del timer 2
 TIM2_CR1.CEN=1;               // Habilita el contador (inicio de conteo)
 EnableInterrupts();           // Habilita las interrupciones
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