_ISR_temp:
;Temporizador.c,22 :: 		void ISR_temp() iv IVT_INT_TIM2 ics ICS_AUTO {
;Temporizador.c,23 :: 		TIM2_SR.UIF=0;     // LIMPIA LA BANDERA DE INTERRUPCION.
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;Temporizador.c,24 :: 		SALIDAS=~SALIDAS;  // COMPLETA ESTDO DEL PUERTO
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
MVN	R1, R0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;Temporizador.c,25 :: 		}
L_end_ISR_temp:
BX	LR
; end of _ISR_temp
_main:
;Temporizador.c,27 :: 		void main() {
;Temporizador.c,28 :: 		Conf_puertos();
BL	_Conf_puertos+0
;Temporizador.c,29 :: 		Conf_temp2();
BL	_Conf_temp2+0
;Temporizador.c,30 :: 		Config_UART1();
BL	_Config_UART1+0
;Temporizador.c,31 :: 		while(1){
L_main0:
;Temporizador.c,33 :: 		Proceso2();
BL	_Proceso2+0
;Temporizador.c,34 :: 		};
IT	AL
BAL	L_main0
;Temporizador.c,35 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Proceso:
;Temporizador.c,37 :: 		void Proceso(void){
;Temporizador.c,38 :: 		TIM2_ARR=fusa;
MOVS	R1, #62
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Temporizador.c,39 :: 		delay_ms(5000);
MOVW	R7, #29523
MOVT	R7, #203
NOP
NOP
L_Proceso2:
SUBS	R7, R7, #1
BNE	L_Proceso2
NOP
NOP
NOP
NOP
;Temporizador.c,40 :: 		TIM2_ARR=corchea;
MOVS	R1, #250
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Temporizador.c,41 :: 		delay_ms(5000);
MOVW	R7, #29523
MOVT	R7, #203
NOP
NOP
L_Proceso4:
SUBS	R7, R7, #1
BNE	L_Proceso4
NOP
NOP
NOP
NOP
;Temporizador.c,42 :: 		}
L_end_Proceso:
BX	LR
; end of _Proceso
_Conf_puertos:
;Temporizador.c,44 :: 		void Conf_puertos(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Temporizador.c,46 :: 		GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;Temporizador.c,47 :: 		SALIDAS=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;Temporizador.c,48 :: 		}
L_end_Conf_puertos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Conf_puertos
_Conf_temp2:
;Temporizador.c,50 :: 		void Conf_temp2(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Temporizador.c,52 :: 		RCC_APB1ENR.TIM2EN = 1; // Habilita el timer 2 para usar el relog de APB1 (8 Mhz)
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;Temporizador.c,53 :: 		TIM2_CR1.CEN=0;        // Deshabilita el contador del timer 2
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Temporizador.c,54 :: 		TIM2_PSC=7;            // Factor de división del preescalador: Freloj= Fapb1/(PSC + 1)= 1Mh
MOVS	R1, #7
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;Temporizador.c,56 :: 		NVIC_IntEnable(IVT_INT_TIM2); // Enmascaramiento de la interrupción del timer 2
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;Temporizador.c,57 :: 		TIM2_DIER.UIE=1;              // Habilita la generación de interrupción del timer 2
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;Temporizador.c,58 :: 		TIM2_CR1.CEN=1;               // Habilita el contador (inicio de conteo)
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;Temporizador.c,59 :: 		EnableInterrupts();           // Habilita las interrupciones
BL	_EnableInterrupts+0
;Temporizador.c,60 :: 		}
L_end_Conf_temp2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Conf_temp2
_Config_UART1:
;Temporizador.c,62 :: 		void Config_UART1(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Temporizador.c,63 :: 		UART1_Init(9600);
MOVW	R0, #9600
BL	_UART1_Init+0
;Temporizador.c,64 :: 		Delay_ms(100);
MOVW	R7, #4521
MOVT	R7, #4
NOP
NOP
L_Config_UART16:
SUBS	R7, R7, #1
BNE	L_Config_UART16
NOP
NOP
;Temporizador.c,65 :: 		UART1_Write_Text("Inicio");
MOVW	R0, #lo_addr(?lstr1_Temporizador+0)
MOVT	R0, #hi_addr(?lstr1_Temporizador+0)
BL	_UART1_Write_Text+0
;Temporizador.c,66 :: 		UART1_Write(13);
MOVS	R0, #13
BL	_UART1_Write+0
;Temporizador.c,67 :: 		UART1_Write(10);
MOVS	R0, #10
BL	_UART1_Write+0
;Temporizador.c,68 :: 		}
L_end_Config_UART1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Config_UART1
_Proceso2:
;Temporizador.c,70 :: 		void Proceso2(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Temporizador.c,72 :: 		if (UART1_Data_Ready()) {
BL	_UART1_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_Proceso28
;Temporizador.c,73 :: 		uart_rd = UART1_Read();
BL	_UART1_Read+0
MOVW	R1, #lo_addr(_uart_rd+0)
MOVT	R1, #hi_addr(_uart_rd+0)
STRB	R0, [R1, #0]
;Temporizador.c,74 :: 		UART1_Write(uart_rd);
UXTB	R0, R0
BL	_UART1_Write+0
;Temporizador.c,75 :: 		tm = (int)uart_rd;
MOVW	R0, #lo_addr(_uart_rd+0)
MOVT	R0, #hi_addr(_uart_rd+0)
LDRB	R1, [R0, #0]
;Temporizador.c,76 :: 		TIM2_ARR = tm;
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;Temporizador.c,77 :: 		}
L_Proceso28:
;Temporizador.c,78 :: 		}
L_end_Proceso2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Proceso2
