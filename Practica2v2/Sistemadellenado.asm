_main:
;Sistemadellenado.c,15 :: 		void main(){
SUB	SP, SP, #4
;Sistemadellenado.c,17 :: 		Config_ptos();
BL	_Config_ptos+0
;Sistemadellenado.c,18 :: 		Init();
BL	_Init+0
;Sistemadellenado.c,19 :: 		while(1)
L_main0:
;Sistemadellenado.c,21 :: 		for(i=0; i<1000; i++)
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #0]
L_main2:
LDRSH	R0, [SP, #0]
CMP	R0, #1000
IT	GE
BGE	L_main3
;Sistemadellenado.c,23 :: 		if(GPIOC_IDR.B5==1)
MOVW	R1, #lo_addr(GPIOC_IDR+0)
MOVT	R1, #hi_addr(GPIOC_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main5
;Sistemadellenado.c,24 :: 		Proceso2();
BL	_Proceso2+0
IT	AL
BAL	L_main6
L_main5:
;Sistemadellenado.c,26 :: 		Proceso1();
BL	_Proceso1+0
L_main6:
;Sistemadellenado.c,21 :: 		for(i=0; i<1000; i++)
LDRSH	R0, [SP, #0]
ADDS	R0, R0, #1
STRH	R0, [SP, #0]
;Sistemadellenado.c,27 :: 		}
IT	AL
BAL	L_main2
L_main3:
;Sistemadellenado.c,28 :: 		onda=~onda; //COMPLEMENTA EL BIT
MOVW	R1, #lo_addr(GPIOD_ODRbits+0)
MOVT	R1, #hi_addr(GPIOD_ODRbits+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;Sistemadellenado.c,29 :: 		}
IT	AL
BAL	L_main0
;Sistemadellenado.c,30 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Config_ptos:
;Sistemadellenado.c,32 :: 		void Config_ptos(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Sistemadellenado.c,34 :: 		GPIO_Digital_Input(&GPIOB_BASE,_GPIO_PINMASK_0|_GPIO_PINMASK_1|_GPIO_PINMASK_2);
MOVS	R1, #7
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;Sistemadellenado.c,35 :: 		GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_0|_GPIO_PINMASK_1);
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;Sistemadellenado.c,36 :: 		GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_2|_GPIO_PINMASK_3);
MOVS	R1, #12
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;Sistemadellenado.c,37 :: 		GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_4|_GPIO_PINMASK_5);
MOVS	R1, #48
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;Sistemadellenado.c,38 :: 		GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;Sistemadellenado.c,39 :: 		GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_7|_GPIO_PINMASK_8);
MOVW	R1, #384
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;Sistemadellenado.c,40 :: 		GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_9);
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;Sistemadellenado.c,41 :: 		GPIO_Digital_Input(&GPIOC_BASE,_GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;Sistemadellenado.c,42 :: 		GPIO_Digital_Output(&GPIOD_BASE,_GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;Sistemadellenado.c,43 :: 		}
L_end_Config_ptos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Config_ptos
_Init:
;Sistemadellenado.c,45 :: 		void Init(void){
;Sistemadellenado.c,46 :: 		BOMBA1=BOMBA2=0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R2, [R0, #0]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,47 :: 		onda=0;
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R2, [R0, #0]
;Sistemadellenado.c,48 :: 		}
L_end_Init:
BX	LR
; end of _Init
_Proceso2:
;Sistemadellenado.c,50 :: 		void Proceso2(void)
;Sistemadellenado.c,52 :: 		if(GPIOB_IDR.B2 && GPIOB_IDR.B1 && GPIOB_IDR.B0)//(NIVEL == 0x07)
MOVW	R1, #lo_addr(GPIOB_IDR+0)
MOVT	R1, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__Proceso233
MOVW	R1, #lo_addr(GPIOB_IDR+0)
MOVT	R1, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__Proceso232
MOVW	R1, #lo_addr(GPIOB_IDR+0)
MOVT	R1, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__Proceso231
L__Proceso230:
;Sistemadellenado.c,54 :: 		BOMBA1=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,55 :: 		BOMBA2=0;
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,56 :: 		DISPLAY = 0xB0;
MOVS	R1, #176
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,57 :: 		}
IT	AL
BAL	L_Proceso210
;Sistemadellenado.c,52 :: 		if(GPIOB_IDR.B2 && GPIOB_IDR.B1 && GPIOB_IDR.B0)//(NIVEL == 0x07)
L__Proceso233:
L__Proceso232:
L__Proceso231:
;Sistemadellenado.c,58 :: 		else if(GPIOB_IDR.B1 && GPIOB_IDR.B0)//(NIVEL == 0x03)
MOVW	R1, #lo_addr(GPIOB_IDR+0)
MOVT	R1, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__Proceso235
MOVW	R1, #lo_addr(GPIOB_IDR+0)
MOVT	R1, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__Proceso234
L__Proceso229:
;Sistemadellenado.c,60 :: 		BOMBA1=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,61 :: 		BOMBA2=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,62 :: 		DISPLAY = 0xA4;
MOVS	R1, #164
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,63 :: 		}
IT	AL
BAL	L_Proceso214
;Sistemadellenado.c,58 :: 		else if(GPIOB_IDR.B1 && GPIOB_IDR.B0)//(NIVEL == 0x03)
L__Proceso235:
L__Proceso234:
;Sistemadellenado.c,64 :: 		else if(GPIOB_IDR.B0)//(NIVEL == 0x01)
MOVW	R1, #lo_addr(GPIOB_IDR+0)
MOVT	R1, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Proceso215
;Sistemadellenado.c,66 :: 		BOMBA1=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,67 :: 		BOMBA2=1;
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,68 :: 		DISPLAY=0xF9;
MOVS	R1, #249
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,69 :: 		}
IT	AL
BAL	L_Proceso216
L_Proceso215:
;Sistemadellenado.c,70 :: 		else if(GPIOB_IDR.B2 == 0 && GPIOB_IDR.B1 == 0 && GPIOB_IDR.B0 == 0)//(NIVEL == 0x00)
MOVW	R1, #lo_addr(GPIOB_IDR+0)
MOVT	R1, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__Proceso238
MOVW	R1, #lo_addr(GPIOB_IDR+0)
MOVT	R1, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__Proceso237
MOVW	R1, #lo_addr(GPIOB_IDR+0)
MOVT	R1, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__Proceso236
L__Proceso228:
;Sistemadellenado.c,72 :: 		BOMBA1=BOMBA2=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,73 :: 		DISPLAY=0xC0;
MOVS	R1, #192
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,74 :: 		}
IT	AL
BAL	L_Proceso220
;Sistemadellenado.c,70 :: 		else if(GPIOB_IDR.B2 == 0 && GPIOB_IDR.B1 == 0 && GPIOB_IDR.B0 == 0)//(NIVEL == 0x00)
L__Proceso238:
L__Proceso237:
L__Proceso236:
;Sistemadellenado.c,77 :: 		DISPLAY = 0x86;
MOVS	R1, #134
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,78 :: 		BOMBA1=BOMBA2=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,79 :: 		}
L_Proceso220:
L_Proceso216:
L_Proceso214:
L_Proceso210:
;Sistemadellenado.c,80 :: 		}
L_end_Proceso2:
BX	LR
; end of _Proceso2
_Proceso1:
;Sistemadellenado.c,82 :: 		void Proceso1(void)
;Sistemadellenado.c,85 :: 		Nivel = NIVEL&0x07;
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #7
SXTH	R0, R0
;Sistemadellenado.c,86 :: 		switch(Nivel){
IT	AL
BAL	L_Proceso121
;Sistemadellenado.c,87 :: 		case 0x07:
L_Proceso123:
;Sistemadellenado.c,88 :: 		BOMBA1=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,89 :: 		BOMBA2=0;
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,90 :: 		DISPLAY = 0xB0;
MOVS	R1, #176
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,91 :: 		break;
IT	AL
BAL	L_Proceso122
;Sistemadellenado.c,92 :: 		case 0x03:
L_Proceso124:
;Sistemadellenado.c,93 :: 		BOMBA1=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,94 :: 		BOMBA2=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,95 :: 		DISPLAY = 0xA4;
MOVS	R1, #164
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,96 :: 		break;
IT	AL
BAL	L_Proceso122
;Sistemadellenado.c,97 :: 		case 0x01:
L_Proceso125:
;Sistemadellenado.c,98 :: 		BOMBA1=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,99 :: 		BOMBA2=1;
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,100 :: 		DISPLAY=0xF9;
MOVS	R1, #249
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,101 :: 		break;
IT	AL
BAL	L_Proceso122
;Sistemadellenado.c,102 :: 		case 0x00:
L_Proceso126:
;Sistemadellenado.c,103 :: 		BOMBA1=BOMBA2=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,104 :: 		DISPLAY=0xC0;
MOVS	R1, #192
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,105 :: 		break;
IT	AL
BAL	L_Proceso122
;Sistemadellenado.c,106 :: 		default:
L_Proceso127:
;Sistemadellenado.c,107 :: 		DISPLAY = 0x086;
MOVS	R1, #134
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,108 :: 		BOMBA1=BOMBA2=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,109 :: 		break;
IT	AL
BAL	L_Proceso122
;Sistemadellenado.c,110 :: 		}
L_Proceso121:
CMP	R0, #7
IT	EQ
BEQ	L_Proceso123
CMP	R0, #3
IT	EQ
BEQ	L_Proceso124
CMP	R0, #1
IT	EQ
BEQ	L_Proceso125
CMP	R0, #0
IT	EQ
BEQ	L_Proceso126
IT	AL
BAL	L_Proceso127
L_Proceso122:
;Sistemadellenado.c,111 :: 		}
L_end_Proceso1:
BX	LR
; end of _Proceso1
