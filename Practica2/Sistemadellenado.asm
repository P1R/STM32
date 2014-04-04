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
;Sistemadellenado.c,23 :: 		Proceso2();
BL	_Proceso2+0
;Sistemadellenado.c,21 :: 		for(i=0; i<1000; i++)
LDRSH	R0, [SP, #0]
ADDS	R0, R0, #1
STRH	R0, [SP, #0]
;Sistemadellenado.c,24 :: 		}
IT	AL
BAL	L_main2
L_main3:
;Sistemadellenado.c,25 :: 		onda=~onda; //COMPLEMENTA EL BIT
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;Sistemadellenado.c,26 :: 		}
IT	AL
BAL	L_main0
;Sistemadellenado.c,27 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Config_ptos:
;Sistemadellenado.c,29 :: 		void Config_ptos(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Sistemadellenado.c,31 :: 		GPIO_Digital_Input(&GPIOB_BASE,_GPIO_PINMASK_0|_GPIO_PINMASK_1|_GPIO_PINMASK_2);
MOVS	R1, #7
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;Sistemadellenado.c,32 :: 		GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_0|_GPIO_PINMASK_1);
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;Sistemadellenado.c,33 :: 		GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_2|_GPIO_PINMASK_3);
MOVS	R1, #12
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;Sistemadellenado.c,34 :: 		GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_4|_GPIO_PINMASK_5);
MOVS	R1, #48
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;Sistemadellenado.c,35 :: 		GPIO_Digital_Output(&GPIOA_BASE,_GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;Sistemadellenado.c,36 :: 		GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_7|_GPIO_PINMASK_6);
MOVS	R1, #192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;Sistemadellenado.c,37 :: 		GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_8);
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;Sistemadellenado.c,38 :: 		}
L_end_Config_ptos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Config_ptos
_Init:
;Sistemadellenado.c,40 :: 		void Init(void){
;Sistemadellenado.c,41 :: 		BOMBA1=BOMBA2=0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R2, [R0, #0]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,42 :: 		onda=0;
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R2, [R0, #0]
;Sistemadellenado.c,43 :: 		}
L_end_Init:
BX	LR
; end of _Init
_Proceso2:
;Sistemadellenado.c,45 :: 		void Proceso2(void)
;Sistemadellenado.c,47 :: 		if(GPIOB_IDR.B2 && GPIOB_IDR.B1 && GPIOB_IDR.B0)//(NIVEL == 0x07)
MOVW	R1, #lo_addr(GPIOB_IDR+0)
MOVT	R1, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__Proceso231
MOVW	R1, #lo_addr(GPIOB_IDR+0)
MOVT	R1, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__Proceso230
MOVW	R1, #lo_addr(GPIOB_IDR+0)
MOVT	R1, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L__Proceso229
L__Proceso228:
;Sistemadellenado.c,49 :: 		BOMBA1=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,50 :: 		BOMBA2=0;
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,51 :: 		DISPLAY = 0xB0;
MOVS	R1, #176
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,52 :: 		}
IT	AL
BAL	L_Proceso28
;Sistemadellenado.c,47 :: 		if(GPIOB_IDR.B2 && GPIOB_IDR.B1 && GPIOB_IDR.B0)//(NIVEL == 0x07)
L__Proceso231:
L__Proceso230:
L__Proceso229:
;Sistemadellenado.c,53 :: 		else if(GPIOB_IDR.B1 && GPIOB_IDR.B0)//(NIVEL == 0x03)
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
L__Proceso227:
;Sistemadellenado.c,55 :: 		BOMBA1=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,56 :: 		BOMBA2=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,57 :: 		DISPLAY = 0xA4;
MOVS	R1, #164
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,58 :: 		}
IT	AL
BAL	L_Proceso212
;Sistemadellenado.c,53 :: 		else if(GPIOB_IDR.B1 && GPIOB_IDR.B0)//(NIVEL == 0x03)
L__Proceso233:
L__Proceso232:
;Sistemadellenado.c,59 :: 		else if(GPIOB_IDR.B0)//(NIVEL == 0x01)
MOVW	R1, #lo_addr(GPIOB_IDR+0)
MOVT	R1, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_Proceso213
;Sistemadellenado.c,61 :: 		BOMBA1=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,62 :: 		BOMBA2=1;
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,63 :: 		DISPLAY=0xF9;
MOVS	R1, #249
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,64 :: 		}
IT	AL
BAL	L_Proceso214
L_Proceso213:
;Sistemadellenado.c,65 :: 		else if(GPIOB_IDR.B2 == 0 && GPIOB_IDR.B1 == 0 && GPIOB_IDR.B0 == 0)//(NIVEL == 0x00)
MOVW	R1, #lo_addr(GPIOB_IDR+0)
MOVT	R1, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__Proceso236
MOVW	R1, #lo_addr(GPIOB_IDR+0)
MOVT	R1, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__Proceso235
MOVW	R1, #lo_addr(GPIOB_IDR+0)
MOVT	R1, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L__Proceso234
L__Proceso226:
;Sistemadellenado.c,67 :: 		BOMBA1=BOMBA2=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,68 :: 		DISPLAY=0xC0;
MOVS	R1, #192
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,69 :: 		}
IT	AL
BAL	L_Proceso218
;Sistemadellenado.c,65 :: 		else if(GPIOB_IDR.B2 == 0 && GPIOB_IDR.B1 == 0 && GPIOB_IDR.B0 == 0)//(NIVEL == 0x00)
L__Proceso236:
L__Proceso235:
L__Proceso234:
;Sistemadellenado.c,72 :: 		DISPLAY = 0x86;
MOVS	R1, #134
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,73 :: 		BOMBA1=BOMBA2=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,74 :: 		}
L_Proceso218:
L_Proceso214:
L_Proceso212:
L_Proceso28:
;Sistemadellenado.c,75 :: 		}
L_end_Proceso2:
BX	LR
; end of _Proceso2
_Proceso1:
;Sistemadellenado.c,77 :: 		void Proceso1(void)
;Sistemadellenado.c,80 :: 		Nivel = NIVEL&0x07;
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
LDR	R0, [R0, #0]
AND	R0, R0, #7
SXTH	R0, R0
;Sistemadellenado.c,81 :: 		switch(Nivel){
IT	AL
BAL	L_Proceso119
;Sistemadellenado.c,82 :: 		case 0x07:
L_Proceso121:
;Sistemadellenado.c,83 :: 		BOMBA1=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,84 :: 		BOMBA2=0;
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,85 :: 		DISPLAY = 0xB0;
MOVS	R1, #176
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,86 :: 		break;
IT	AL
BAL	L_Proceso120
;Sistemadellenado.c,87 :: 		case 0x03:
L_Proceso122:
;Sistemadellenado.c,88 :: 		BOMBA1=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,89 :: 		BOMBA2=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,90 :: 		DISPLAY = 0xA4;
MOVS	R1, #164
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,91 :: 		break;
IT	AL
BAL	L_Proceso120
;Sistemadellenado.c,92 :: 		case 0x01:
L_Proceso123:
;Sistemadellenado.c,93 :: 		BOMBA1=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,94 :: 		BOMBA2=1;
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,95 :: 		DISPLAY=0xF9;
MOVS	R1, #249
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,96 :: 		break;
IT	AL
BAL	L_Proceso120
;Sistemadellenado.c,97 :: 		case 0x00:
L_Proceso124:
;Sistemadellenado.c,98 :: 		BOMBA1=BOMBA2=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,99 :: 		DISPLAY=0xC0;
MOVS	R1, #192
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,100 :: 		break;
IT	AL
BAL	L_Proceso120
;Sistemadellenado.c,101 :: 		default:
L_Proceso125:
;Sistemadellenado.c,102 :: 		DISPLAY = 0x086;
MOVS	R1, #134
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,103 :: 		BOMBA1=BOMBA2=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOD_ODRbits+0)
MOVT	R0, #hi_addr(GPIOD_ODRbits+0)
STR	R1, [R0, #0]
;Sistemadellenado.c,104 :: 		break;
IT	AL
BAL	L_Proceso120
;Sistemadellenado.c,105 :: 		}
L_Proceso119:
CMP	R0, #7
IT	EQ
BEQ	L_Proceso121
CMP	R0, #3
IT	EQ
BEQ	L_Proceso122
CMP	R0, #1
IT	EQ
BEQ	L_Proceso123
CMP	R0, #0
IT	EQ
BEQ	L_Proceso124
IT	AL
BAL	L_Proceso125
L_Proceso120:
;Sistemadellenado.c,106 :: 		}
L_end_Proceso1:
BX	LR
; end of _Proceso1
