/*sistema de medicion de 3 niveles en un tanque.
Puerto C = entradas (PC0 = N1, PC1=N2  y PC2=N3)
Puerto A = salidas (Display de anodo comun: PA0 = a, PA1=b, ...Delay_us PA6=*/
#define ENTRADAS GPIOB_IDR
#define SALIDAS GPIOA_ODR
#define APAGADO 0xff
#define CERO 0xC0
#define UNO 0xF9
#define DOS 0xA4
#define TRES 0xB0
#define ERROR 0x86

sbit onda at GPIOC_ODRbits.B0; //onda para medir tiempo de respuesta
int i;
const unsigned short int nivel[]={CERO,UNO,ERROR,DOS,ERROR,ERROR,ERROR,TRES};

void Conf_ptos(void);
void Inicializa(void);
void Proceso(void);
void main() {
Conf_ptos();
Inicializa();
 while(1)
 {
  for(i=0; i<1000; i++)
  {
   Proceso();
  }
  onda=~onda; //COMPLEMENTA EL BIT
 }
}

void Conf_ptos(void)
{
 GPIO_Digital_Input(&GPIOB_BASE,_GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2);
 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6);
 GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_0);
}

void  Inicializa(void)
{
 SALIDAS = APAGADO;
 onda=0;
}

void Proceso(void)
{
 SALIDAS = nivel[ENTRADAS&0x07];
}