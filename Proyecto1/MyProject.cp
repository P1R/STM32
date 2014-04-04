#line 1 "C:/Users/Jorge_000/Documents/Sistemas de tiempo real/STR_STM32/Laboratorio/Proyecto1/MyProject.c"
#line 3 "C:/Users/Jorge_000/Documents/Sistemas de tiempo real/STR_STM32/Laboratorio/Proyecto1/MyProject.c"
sbit LED at GPIOC_ODRbits.B8;
sbit LED1 at GPIOC_ODRbits.B9;

void Config_ptos(void);
void delay(unsigned long contador);
void main() {
Config_ptos();
 while(1){
 if(GPIOA_IDR.B0)
 {
 LED=0;
 LED1=0;
 }
 else
 {
 LED=1;
 LED1=0;
 delay(0xFFFFF);
 LED=0;
 LED1=1;
 delay(0xFFFFF);
 }

 }
}

void Config_ptos(void)
{
 GPIO_Digital_Input(&GPIOA_BASE,_GPIO_PINMASK_0);
 GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_8|_GPIO_PINMASK_9);
 LED=0;
 LED1=1;
}

void delay(unsigned long contador)
{
 while(--contador);
}
