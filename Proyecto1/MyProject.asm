_main:
;MyProject.c,8 :: 		void main() {
SUB	SP, SP, #4
;MyProject.c,9 :: 		Config_ptos();
BL	_Config_ptos+0
;MyProject.c,10 :: 		while(1){
L_main0:
;MyProject.c,11 :: 		if(GPIOA_IDR.B0)
MOVW	R1, #lo_addr(GPIOA_IDR+0)
MOVT	R1, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main2
;MyProject.c,13 :: 		LED=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;MyProject.c,14 :: 		LED1=0;
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;MyProject.c,15 :: 		}
IT	AL
BAL	L_main3
L_main2:
;MyProject.c,18 :: 		LED=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;MyProject.c,19 :: 		LED1=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R0, [SP, #0]
STR	R1, [R0, #0]
;MyProject.c,20 :: 		delay(0xFFFFF);
MOVW	R0, #65535
MOVT	R0, #15
BL	_delay+0
;MyProject.c,21 :: 		LED=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;MyProject.c,22 :: 		LED1=1;
MOVS	R1, #1
SXTB	R1, R1
LDR	R0, [SP, #0]
STR	R1, [R0, #0]
;MyProject.c,23 :: 		delay(0xFFFFF);
MOVW	R0, #65535
MOVT	R0, #15
BL	_delay+0
;MyProject.c,24 :: 		}
L_main3:
;MyProject.c,26 :: 		}
IT	AL
BAL	L_main0
;MyProject.c,27 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Config_ptos:
;MyProject.c,29 :: 		void Config_ptos(void) //Función para configurar los puertos E/S
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject.c,31 :: 		GPIO_Digital_Input(&GPIOA_BASE,_GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
;MyProject.c,32 :: 		GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_8|_GPIO_PINMASK_9);
MOVW	R1, #768
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;MyProject.c,33 :: 		LED=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;MyProject.c,34 :: 		LED1=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;MyProject.c,35 :: 		}
L_end_Config_ptos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Config_ptos
_delay:
;MyProject.c,37 :: 		void delay(unsigned long contador) // Función para generar retardo
;MyProject.c,39 :: 		while(--contador);
L_delay4:
SUBS	R1, R0, #1
MOV	R0, R1
CMP	R1, #0
IT	EQ
BEQ	L_delay5
IT	AL
BAL	L_delay4
L_delay5:
;MyProject.c,40 :: 		}
L_end_delay:
BX	LR
; end of _delay
