_ISR_temp:
;Temporizador.c,29 :: 		void ISR_temp() iv IVT_INT_TIM2 ics ICS_AUTO {
;Temporizador.c,30 :: 		TIM2_SR.UIF=0;     // LIMPIA LA BANDERA DE INTERRUPCION.
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Temporizador.c,31 :: 		SALIDA=~SALIDA;  // COMPLETA ESTDO DEL PUERTO
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;Temporizador.c,32 :: 		}
L_end_ISR_temp:
BX	LR
; end of _ISR_temp
_main:
;Temporizador.c,34 :: 		void main() {
;Temporizador.c,36 :: 		Conf_puertos();
BL	_Conf_puertos+0
;Temporizador.c,37 :: 		Conf_temp2();
BL	_Conf_temp2+0
;Temporizador.c,38 :: 		Config_UART1();
BL	_Config_UART1+0
;Temporizador.c,40 :: 		TIM2_ARR = tm2;
MOVW	R1, #1911
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Temporizador.c,41 :: 		Delay_ms(100000);
MOVW	R7, #681
MOVT	R7, #4069
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
;Temporizador.c,43 :: 		TIM2_ARR = tm2;
MOVW	R1, #0
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Temporizador.c,44 :: 		Delay_ms(100000);
MOVW	R7, #681
MOVT	R7, #4069
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
;Temporizador.c,46 :: 		TIM2_ARR = tm2;
MOVW	R1, #1431
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Temporizador.c,47 :: 		Delay_ms(100000);
MOVW	R7, #681
MOVT	R7, #4069
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
;Temporizador.c,49 :: 		TIM2_ARR = tm2;
MOVW	R1, #0
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Temporizador.c,50 :: 		Delay_ms(100000);
MOVW	R7, #681
MOVT	R7, #4069
NOP
NOP
L_main6:
SUBS	R7, R7, #1
BNE	L_main6
NOP
NOP
;Temporizador.c,51 :: 		while(1){
L_main8:
;Temporizador.c,52 :: 		Proceso();
BL	_Proceso+0
;Temporizador.c,53 :: 		}
IT	AL
BAL	L_main8
;Temporizador.c,54 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Conf_puertos:
;Temporizador.c,57 :: 		void Conf_puertos(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Temporizador.c,59 :: 		GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_8);
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;Temporizador.c,60 :: 		SALIDA=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Temporizador.c,61 :: 		}
L_end_Conf_puertos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Conf_puertos
_Conf_temp2:
;Temporizador.c,63 :: 		void Conf_temp2(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Temporizador.c,65 :: 		RCC_APB1ENR.TIM2EN = 1; // Habilita el timer 2 para usar el relog de APB1 (8 Mhz)
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Temporizador.c,66 :: 		TIM2_CR1.CEN=0;        // Deshabilita el contador del timer 2
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Temporizador.c,67 :: 		TIM2_PSC=7;            // Factor de división del preescalador: Freloj= Fapb1/(PSC + 1)= 1Mh
MOVS	R1, #7
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Temporizador.c,68 :: 		TIM2_ARR=0;          // Define el valor de desborde y reinicio del contador
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Temporizador.c,69 :: 		NVIC_IntEnable(IVT_INT_TIM2); // Enmascaramiento de la interrupción del timer 2
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Temporizador.c,70 :: 		TIM2_DIER.UIE=1;              // Habilita la generación de interrupción del timer 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Temporizador.c,71 :: 		TIM2_CR1.CEN=1;               // Habilita el contador (inicio de conteo)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Temporizador.c,72 :: 		EnableInterrupts();           // Habilita las interrupciones
BL	_EnableInterrupts+0
;Temporizador.c,73 :: 		}
L_end_Conf_temp2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Conf_temp2
_Config_UART1:
;Temporizador.c,75 :: 		void Config_UART1(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Temporizador.c,76 :: 		UART1_Init(9600);
MOVW	R0, #9600
BL	_UART1_Init+0
;Temporizador.c,77 :: 		Delay_ms(100);
MOVW	R7, #4521
MOVT	R7, #4
NOP
NOP
L_Config_UART110:
SUBS	R7, R7, #1
BNE	L_Config_UART110
NOP
NOP
;Temporizador.c,78 :: 		UART1_Write_Text("Inicio");
MOVW	R0, #lo_addr(?lstr1_Temporizador+0)
MOVT	R0, #hi_addr(?lstr1_Temporizador+0)
BL	_UART1_Write_Text+0
;Temporizador.c,79 :: 		UART1_Write(13);
MOVS	R0, #13
BL	_UART1_Write+0
;Temporizador.c,80 :: 		UART1_Write(10);
MOVS	R0, #10
BL	_UART1_Write+0
;Temporizador.c,81 :: 		}
L_end_Config_UART1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Config_UART1
_Proceso:
;Temporizador.c,83 :: 		void Proceso(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Temporizador.c,86 :: 		if (UART1_Data_Ready())
BL	_UART1_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_Proceso12
;Temporizador.c,88 :: 		uart_rd = UART1_Read();
BL	_UART1_Read+0
MOVW	R1, #lo_addr(_uart_rd+0)
MOVT	R1, #hi_addr(_uart_rd+0)
STRB	R0, [R1, #0]
;Temporizador.c,91 :: 		TIM2_ARR = tm1;
MOVW	R1, #1911
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Temporizador.c,92 :: 		}
L_Proceso12:
;Temporizador.c,93 :: 		}
L_end_Proceso:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Proceso
