_main:
;Practica3.c,8 :: 		void main() {
;Practica3.c,9 :: 		config_ptos();
BL	_config_ptos+0
;Practica3.c,10 :: 		Init();
BL	_Init+0
;Practica3.c,11 :: 		while(1){
L_main0:
;Practica3.c,12 :: 		if(state==0 && GPIOA_IDR.B0==1 && GPIOA_IDR.B1==1){
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__main12
MOVW	R1, #lo_addr(GPIOA_IDR+0)
MOVT	R1, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main11
MOVW	R1, #lo_addr(GPIOA_IDR+0)
MOVT	R1, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main10
L__main9:
;Practica3.c,13 :: 		Motor=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Practica3.c,14 :: 		state=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
STRH	R1, [R0, #0]
;Practica3.c,15 :: 		}
IT	AL
BAL	L_main5
;Practica3.c,12 :: 		if(state==0 && GPIOA_IDR.B0==1 && GPIOA_IDR.B1==1){
L__main12:
L__main11:
L__main10:
;Practica3.c,16 :: 		else if(state=1 && GPIOA_IDR.B0==0)
MOVW	R1, #lo_addr(GPIOA_IDR+0)
MOVT	R1, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_main7
MOVS	R1, #1
IT	AL
BAL	L_main6
L_main7:
MOVS	R1, #0
L_main6:
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
STRH	R1, [R0, #0]
LDRSH	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main8
;Practica3.c,17 :: 		Motor=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
L_main8:
L_main5:
;Practica3.c,18 :: 		state=0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
STRH	R1, [R0, #0]
;Practica3.c,19 :: 		}
IT	AL
BAL	L_main0
;Practica3.c,20 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_config_ptos:
;Practica3.c,21 :: 		void config_ptos(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Practica3.c,22 :: 		GPIO_Digital_Input(&GPIOA_BASE,_GPIO_PINMASK_0|_GPIO_PINMASK_1);
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
;Practica3.c,23 :: 		GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_8|_GPIO_PINMASK_9);
MOVW	R1, #768
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;Practica3.c,24 :: 		}
L_end_config_ptos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _config_ptos
_Init:
;Practica3.c,26 :: 		void Init(){
;Practica3.c,27 :: 		Motor = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Practica3.c,28 :: 		state = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
STRH	R1, [R0, #0]
;Practica3.c,29 :: 		}
L_end_Init:
BX	LR
; end of _Init
