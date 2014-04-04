#define Level GPIOA_IDR

sbit Motor at GPIOC_ODRbits.B9;
sbit Debug at GPIOC_ODRbits.B8;
void config_ptos(void);
void Init(void);
int state; //define si esta llenando o vaciando
void main() {
  config_ptos();
  Init();
      while(1){
       if(state==0 && GPIOA_IDR.B0==1 && GPIOA_IDR.B1==1){
           Motor=0;
           state=1;
       }
       else if(state=1 && GPIOA_IDR.B0==0)
           Motor=1;
           state=0;
      }
}
void config_ptos(void){
 GPIO_Digital_Input(&GPIOA_BASE,_GPIO_PINMASK_0|_GPIO_PINMASK_1);
 GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_8|_GPIO_PINMASK_9);
}

void Init(){
    Motor = 1;
    state = 0;
}