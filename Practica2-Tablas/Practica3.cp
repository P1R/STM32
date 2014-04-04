#line 1 "C:/Users/Jorge_000/Documents/Sistemas de tiempo real/STR_STM32/Laboratorio/Practica3/Practica3.c"
#line 13 "C:/Users/Jorge_000/Documents/Sistemas de tiempo real/STR_STM32/Laboratorio/Practica3/Practica3.c"
sbit onda at GPIOC_ODRbits.B0;
int i;
const unsigned short int nivel[]={ 0xC0 , 0xF9 , 0x86 , 0xA4 , 0x86 , 0x86 , 0x86 , 0xB0 };

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
 onda=~onda;
 }
}

void Conf_ptos(void)
{
 GPIO_Digital_Input(&GPIOB_BASE,_GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2);
 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6);
 GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_0);
}

void Inicializa(void)
{
  GPIOA_ODR  =  0xff ;
 onda=0;
}

void Proceso(void)
{
  GPIOA_ODR  = nivel[ GPIOB_IDR &0x07];
}
