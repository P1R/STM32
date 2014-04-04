#line 1 "C:/Users/p1r0/Desktop/Sistemas de tiempo real/Laboratorio/Proyecto4.c"


void Config_ptos(void);
void Config_adc(void);
void Proceso(void);

unsigned int adc_value;

void main(){
 Config_ptos();
 Config_adc();
 while(1){
 Proceso();
 }
}

void Config_ptos(void){
 GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_ALL);
  GPIOA_ODR  = 0xfff;
 GPIO_Analog_input(&GPIOC_BASE,_GPIO_PINMASK_0);
}
void Config_adc(void){
 ADC_Set_Input_Channel(_ADC_CHANNEL_10);
 ADC1_Init();
}

void Proceso(void){
 adc_value = ADC1_Get_Sample(10);
  GPIOA_ODR =~ADC_Value;
}
