_main:
;Practica3.c,20 :: 		void main() {
;Practica3.c,21 :: 		Conf_ptos();
BL	_Conf_ptos+0
;Practica3.c,22 :: 		Inicializa();
BL	_Inicializa+0
;Practica3.c,23 :: 		while(1)
L_main0:
;Practica3.c,25 :: 		for(i=0; i<1000; i++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main2:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1000
IT	GE
BGE	L_main3
;Practica3.c,27 :: 		Proceso();
BL	_Proceso+0
;Practica3.c,25 :: 		for(i=0; i<1000; i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Practica3.c,28 :: 		}
IT	AL
BAL	L_main2
L_main3:
;Practica3.c,29 :: 		onda=~onda; //COMPLEMENTA EL BIT
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;Practica3.c,30 :: 		}
IT	AL
BAL	L_main0
;Practica3.c,31 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Conf_ptos:
;Practica3.c,33 :: 		void Conf_ptos(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Practica3.c,35 :: 		GPIO_Digital_Input(&GPIOB_BASE,_GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2);
MOVS	R1, #7
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;Practica3.c,36 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 | _GPIO_PINMASK_4 | _GPIO_PINMASK_5 | _GPIO_PINMASK_6);
MOVS	R1, #127
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;Practica3.c,37 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;Practica3.c,38 :: 		}
L_end_Conf_ptos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Conf_ptos
_Inicializa:
;Practica3.c,40 :: 		void  Inicializa(void)
;Practica3.c,42 :: 		SALIDAS = APAGADO;
MOVS	R1, #255
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Practica3.c,43 :: 		onda=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Practica3.c,44 :: 		}
L_end_Inicializa:
BX	LR
; end of _Inicializa
_Proceso:
;Practica3.c,46 :: 		void Proceso(void)
;Practica3.c,48 :: 		SALIDAS = nivel[ENTRADAS&0x07];
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R0, #0]
AND	R1, R0, #7
MOVW	R0, #lo_addr(_nivel+0)
MOVT	R0, #hi_addr(_nivel+0)
ADDS	R0, R0, R1
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Practica3.c,49 :: 		}
L_end_Proceso:
BX	LR
; end of _Proceso
