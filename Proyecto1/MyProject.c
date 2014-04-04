/*Práctica 1.- manejo de puertos de E/S, sentencia condicional if - else
               y retardo por sowftware */
sbit LED at GPIOC_ODRbits.B8; //Definición de un bit
sbit LED1 at GPIOC_ODRbits.B9;

void Config_ptos(void);      //Prototipos de funciones usuario
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

void Config_ptos(void) //Función para configurar los puertos E/S
{
 GPIO_Digital_Input(&GPIOA_BASE,_GPIO_PINMASK_0);
 GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_8|_GPIO_PINMASK_9);
 LED=0;
 LED1=1;
}

void delay(unsigned long contador) // Función para generar retardo
{
 while(--contador);
}