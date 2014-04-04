#line 1 "C:/Users/p1r0/Desktop/Sistemas de tiempo real/Laboratorio/Practica2v2/Sistemadellenado.c"






sbit BOMBA1 at GPIOC_ODRbits.B8;
sbit BOMBA2 at GPIOC_ODRbits.B9;
sbit onda at GPIOD_ODRbits.B2;
void Config_ptos(void);
void Init(void);
void Proceso1(void);
void Proceso2(void);

void main(){
int i;
Config_ptos();
Init();
 while(1)
 {
 for(i=0; i<1000; i++)
 {
 if(GPIOC_IDR.B5==1)
 Proceso2();
 else
 Proceso1();
 }
 onda=~onda;
 }
}

void Config_ptos(void)
{
 GPIO_Digital_Input(&GPIOB_BASE,_GPIO_PINMASK_0|_GPIO_PINMASK_1|_GPIO_PINMASK_2);
 GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_0|_GPIO_PINMASK_1);
 GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_2|_GPIO_PINMASK_3);
 GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_4|_GPIO_PINMASK_5);
 GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_6);
 GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_7|_GPIO_PINMASK_8);
 GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_9);
 GPIO_Digital_Input(&GPIOC_BASE,_GPIO_PINMASK_5);
 GPIO_Digital_Output(&GPIOD_BASE,_GPIO_PINMASK_2);
}

void Init(void){
 BOMBA1=BOMBA2=0;
 onda=0;
}

void Proceso2(void)
{
 if(GPIOB_IDR.B2 && GPIOB_IDR.B1 && GPIOB_IDR.B0)
 {
 BOMBA1=0;
 BOMBA2=0;
  GPIOA_ODR  = 0xB0;
 }
 else if(GPIOB_IDR.B1 && GPIOB_IDR.B0)
 {
 BOMBA1=1;
 BOMBA2=0;
  GPIOA_ODR  = 0xA4;
 }
 else if(GPIOB_IDR.B0)
 {
 BOMBA1=1;
 BOMBA2=1;
  GPIOA_ODR =0xF9;
 }
 else if(GPIOB_IDR.B2 == 0 && GPIOB_IDR.B1 == 0 && GPIOB_IDR.B0 == 0)
 {
 BOMBA1=BOMBA2=1;
  GPIOA_ODR =0xC0;
 }
 else
 {
  GPIOA_ODR  = 0x86;
 BOMBA1=BOMBA2=0;
 }
}

void Proceso1(void)
{
 int Nivel;
 Nivel =  GPIOB_IDR &0x07;
 switch(Nivel){
 case 0x07:
 BOMBA1=0;
 BOMBA2=0;
  GPIOA_ODR  = 0xB0;
 break;
 case 0x03:
 BOMBA1=1;
 BOMBA2=0;
  GPIOA_ODR  = 0xA4;
 break;
 case 0x01:
 BOMBA1=1;
 BOMBA2=1;
  GPIOA_ODR =0xF9;
 break;
 case 0x00:
 BOMBA1=BOMBA2=1;
  GPIOA_ODR =0xC0;
 break;
 default:
  GPIOA_ODR  = 0x086;
 BOMBA1=BOMBA2=0;
 break;
 }
}
