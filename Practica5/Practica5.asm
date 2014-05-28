_main:
;Practica5.c,19 :: 		void main(){
;Practica5.c,20 :: 		Lcd_Init();
BL	_Lcd_Init+0
;Practica5.c,21 :: 		Config_ptos();
BL	_Config_ptos+0
;Practica5.c,22 :: 		Config_adc();
BL	_Config_adc+0
;Practica5.c,23 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
MOVS	R0, #1
BL	_Lcd_Cmd+0
;Practica5.c,24 :: 		Lcd_Out(1, 1, "9CM11-Volmetro");
MOVW	R0, #lo_addr(?lstr1_Practica5+0)
MOVT	R0, #hi_addr(?lstr1_Practica5+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;Practica5.c,25 :: 		delay_ms(2000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
NOP
;Practica5.c,26 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;Practica5.c,27 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;Practica5.c,29 :: 		Lcd_Out(1, 1, "Voltaje:");
MOVW	R0, #lo_addr(?lstr2_Practica5+0)
MOVT	R0, #hi_addr(?lstr2_Practica5+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;Practica5.c,30 :: 		while(1){
L_main2:
;Practica5.c,31 :: 		Proceso();
BL	_Proceso+0
;Practica5.c,32 :: 		}
IT	AL
BAL	L_main2
;Practica5.c,33 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Config_ptos:
;Practica5.c,35 :: 		void Config_ptos(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Practica5.c,36 :: 		GPIO_Digital_Output(&GPIOB_BASE,_GPIO_PINMASK_10|_GPIO_PINMASK_11|_GPIO_PINMASK_12);
MOVW	R1, #7168
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Practica5.c,37 :: 		GPIO_Digital_Output(&GPIOB_BASE,_GPIO_PINMASK_13|_GPIO_PINMASK_14|_GPIO_PINMASK_15);
MOVW	R1, #57344
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;Practica5.c,38 :: 		GPIO_Analog_input(&GPIOC_BASE,_GPIO_PINMASK_0); //PC0 = Canal 10 del ADC1
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Analog_Input+0
;Practica5.c,39 :: 		}
L_end_Config_ptos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Config_ptos
_Config_adc:
;Practica5.c,40 :: 		void Config_adc(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Practica5.c,41 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_10); // Seleciona el canal 10 como entrada de
MOVW	R0, #1024
BL	_ADC_Set_Input_Channel+0
;Practica5.c,42 :: 		ADC1_Init();
BL	_ADC1_Init+0
;Practica5.c,43 :: 		}
L_end_Config_adc:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Config_adc
_Proceso:
;Practica5.c,45 :: 		void Proceso(void){
SUB	SP, SP, #12
STR	LR, [SP, #0]
;Practica5.c,48 :: 		adc_value = ADC1_Get_Sample(10);//valores para lectura directa en leds con anodo común
MOVS	R0, #10
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_adc_value+0)
MOVT	R1, #hi_addr(_adc_value+0)
STRH	R0, [R1, #0]
;Practica5.c,49 :: 		volts = R*adc_value;
BL	__UnsignedIntegralToFloat+0
MOVW	R2, #31868
MOVT	R2, #14909
BL	__Mul_FP+0
;Practica5.c,50 :: 		FloatToStr(volts,val);
ADD	R1, SP, #4
BL	_FloatToStr+0
;Practica5.c,52 :: 		Lcd_Out(1, 1, "Voltaje:");
MOVW	R0, #lo_addr(?lstr3_Practica5+0)
MOVT	R0, #hi_addr(?lstr3_Practica5+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;Practica5.c,53 :: 		Lcd_Out(2, 3, val);
ADD	R0, SP, #4
MOV	R2, R0
MOVS	R1, #3
MOVS	R0, #2
BL	_Lcd_Out+0
;Practica5.c,54 :: 		delay(0xFFFFF);
MOVW	R0, #65535
MOVT	R0, #15
BL	_delay+0
;Practica5.c,55 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;Practica5.c,56 :: 		}
L_end_Proceso:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Proceso
_delay:
;Practica5.c,58 :: 		void delay(unsigned long contador) // Función para generar retardo
;Practica5.c,60 :: 		while(--contador);
L_delay4:
SUBS	R1, R0, #1
MOV	R0, R1
CMP	R1, #0
IT	EQ
BEQ	L_delay5
IT	AL
BAL	L_delay4
L_delay5:
;Practica5.c,61 :: 		}
L_end_delay:
BX	LR
; end of _delay
