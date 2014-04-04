/*Práctica 2 Sistema de control de llenado de un tanque */

#define DISPLAY GPIOA_ODR
#define NIVEL GPIOB_IDR

//Definición de un bit
sbit BOMBA1 at GPIOD_ODRbits.B6;
sbit BOMBA2 at GPIOD_ODRbits.B7;
sbit onda at GPIOC_ODRbits.B8;
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
         Proceso2();
    }
    onda=~onda; //COMPLEMENTA EL BIT
   }
}

void Config_ptos(void)
{
 GPIO_Digital_Input(&GPIOB_BASE,_GPIO_PINMASK_0|_GPIO_PINMASK_1|_GPIO_PINMASK_2);
 GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_0|_GPIO_PINMASK_1);
 GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_2|_GPIO_PINMASK_3);
 GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_4|_GPIO_PINMASK_5);
 GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_6);
 GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_7|_GPIO_PINMASK_6);
 GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_8);
}

void Init(void){
 BOMBA1=BOMBA2=0;
 onda=0;
}

void Proceso2(void)
{
    if(GPIOB_IDR.B2 && GPIOB_IDR.B1 && GPIOB_IDR.B0)//(NIVEL == 0x07)
    {
     BOMBA1=0;
     BOMBA2=0;
     DISPLAY = 0xB0;
     }
    else if(GPIOB_IDR.B1 && GPIOB_IDR.B0)//(NIVEL == 0x03)
    {
     BOMBA1=1;
     BOMBA2=0;
     DISPLAY = 0xA4;
    }
    else if(GPIOB_IDR.B0)//(NIVEL == 0x01)
    {
     BOMBA1=1;
     BOMBA2=1;
     DISPLAY=0xF9;
    }
    else if(GPIOB_IDR.B2 == 0 && GPIOB_IDR.B1 == 0 && GPIOB_IDR.B0 == 0)//(NIVEL == 0x00)
    {
     BOMBA1=BOMBA2=1;
     DISPLAY=0xC0;
    }
    else
    {
     DISPLAY = 0x86;
     BOMBA1=BOMBA2=0;
    }
}

void Proceso1(void)
{
   int Nivel;
   Nivel = NIVEL&0x07;
     switch(Nivel){
      case 0x07:
           BOMBA1=0;
           BOMBA2=0;
           DISPLAY = 0xB0;
      break;
      case 0x03:
           BOMBA1=1;
           BOMBA2=0;
           DISPLAY = 0xA4;
      break;
      case 0x01:
           BOMBA1=1;
           BOMBA2=1;
           DISPLAY=0xF9;
      break;
      case 0x00:
           BOMBA1=BOMBA2=1;
           DISPLAY=0xC0;
      break;
      default:
           DISPLAY = 0x086;
           BOMBA1=BOMBA2=0;
      break;
      }
}