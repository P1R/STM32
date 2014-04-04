_main:
;Proyecto4.c,9 :: 		void main(){
;Proyecto4.c,10 :: 		Config_ptos();
BL	_Config_ptos+0
;Proyecto4.c,11 :: 		Config_adc();
BL	_Config_adc+0
;Proyecto4.c,12 :: 		while(1){
L_main0:
;Proyecto4.c,13 :: 		Proceso();
BL	_Proceso+0
;Proyecto4.c,14 :: 		}
IT	AL
BAL	L_main0
;Proyecto4.c,15 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Config_ptos:
;Proyecto4.c,17 :: 		void Config_ptos(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Proyecto4.c,18 :: 		GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;Proyecto4.c,19 :: 		SALIDAS = 0xfff;
MOVW	R1, #4095
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Proyecto4.c,20 :: 		GPIO_Analog_input(&GPIOC_BASE,_GPIO_PINMASK_0); //PC0 = Canal 10 del ADC1
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Analog_Input+0
;Proyecto4.c,21 :: 		}
L_end_Config_ptos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Config_ptos
_Config_adc:
;Proyecto4.c,22 :: 		void Config_adc(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Proyecto4.c,23 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_10); // Señeciona el canal 10 como entrada de
MOVW	R0, #1024
BL	_ADC_Set_Input_Channel+0
;Proyecto4.c,24 :: 		ADC1_Init();
BL	_ADC1_Init+0
;Proyecto4.c,25 :: 		}
L_end_Config_adc:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Config_adc
_Proceso:
;Proyecto4.c,27 :: 		void Proceso(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Proyecto4.c,28 :: 		adc_value = ADC1_Get_Sample(10);//valores para lectura directa en leds con anodo común
MOVS	R0, #10
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_adc_value+0)
MOVT	R1, #hi_addr(_adc_value+0)
STRH	R0, [R1, #0]
;Proyecto4.c,29 :: 		SALIDAS=~ADC_Value;  // el resultado aparecera de PA0 a PA11 (12 bits del ADC)
MVN	R1, R0
UXTH	R1, R1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Proyecto4.c,30 :: 		}
L_end_Proceso:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Proceso
