#define SALIDAS GPIOA_ODR

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
    SALIDAS = 0xfff;
    GPIO_Analog_input(&GPIOC_BASE,_GPIO_PINMASK_0); //PC0 = Canal 10 del ADC1
}
void Config_adc(void){
    ADC_Set_Input_Channel(_ADC_CHANNEL_10); // Señeciona el canal 10 como entrada de
    ADC1_Init();
}

void Proceso(void){
    adc_value = ADC1_Get_Sample(10);//valores para lectura directa en leds con anodo común
    SALIDAS=~ADC_Value;  // el resultado aparecera de PA0 a PA11 (12 bits del ADC)
}