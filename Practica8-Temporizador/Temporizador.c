/*Generción de ua onda de 400*/

#define LA3 1136
#define fusa 62
#define semicorchea 125
#define corchea 250
#define negra 500
#define blanca  60
#define redonda  120               // sEMI-PERIODO  DE LA NOTA EN MICRO SEGUNDOS
#define SALIDAS GPIOC_ODR

void Conf_puertos(void);
void Conf_temp2(void);
void Proceso(void);
void Proceso2(void);
void Config_UART1(void);
char uart_rd;


// ISR DEL TIMER2 CREADA MEDIANTE EL ASISTENTE DEL MICRO C

void ISR_temp() iv IVT_INT_TIM2 ics ICS_AUTO {
 TIM2_SR.UIF=0;     // LIMPIA LA BANDERA DE INTERRUPCION.
 SALIDAS=~SALIDAS;  // COMPLETA ESTDO DEL PUERTO
}

void main() {
Conf_puertos();
Conf_temp2();
Config_UART1();
while(1){
//Proceso();
Proceso2();
};
}

void Proceso(void){
   TIM2_ARR=fusa;
   delay_ms(5000);
   TIM2_ARR=corchea;
   delay_ms(5000);
}

void Conf_puertos(void)
{
 GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_ALL);
 SALIDAS=0;
}

void Conf_temp2(void)
{
 RCC_APB1ENR.TIM2EN = 1; // Habilita el timer 2 para usar el relog de APB1 (8 Mhz)
 TIM2_CR1.CEN=0;        // Deshabilita el contador del timer 2
 TIM2_PSC=7;            // Factor de división del preescalador: Freloj= Fapb1/(PSC + 1)= 1Mh
 //TIM2_ARR=LA3;          // Define el valor de desborde y reinicio del contador
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

void Proceso2(void){
 int tm;
if (UART1_Data_Ready()) {
 uart_rd = UART1_Read();
 UART1_Write(uart_rd);
 tm = (int)uart_rd;
 TIM2_ARR = tm;
}
}
