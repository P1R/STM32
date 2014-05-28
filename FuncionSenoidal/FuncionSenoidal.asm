_Caden:
;FuncionSenoidal.c,8 :: 		void Caden() iv IVT_INT_TIM3 ics ICS_AUTO {
;FuncionSenoidal.c,9 :: 		TIM3_SR.UIF=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_SR+0)
MOVT	R0, #hi_addr(TIM3_SR+0)
STR	R1, [R0, #0]
;FuncionSenoidal.c,10 :: 		dato_actual++;
MOVW	R1, #lo_addr(_dato_actual+0)
MOVT	R1, #hi_addr(_dato_actual+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [R1, #0]
;FuncionSenoidal.c,12 :: 		if(dato_actual==16) dato_actual=0;
CMP	R0, #16
IT	NE
BNE	L_Caden0
MOVS	R1, #0
MOVW	R0, #lo_addr(_dato_actual+0)
MOVT	R0, #hi_addr(_dato_actual+0)
STRB	R1, [R0, #0]
L_Caden0:
;FuncionSenoidal.c,14 :: 		val=vector[dato_actual];
MOVW	R0, #lo_addr(_dato_actual+0)
MOVT	R0, #hi_addr(_dato_actual+0)
LDRB	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_vector+0)
MOVT	R0, #hi_addr(_vector+0)
ADDS	R0, R0, R1
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_val+0)
MOVT	R0, #hi_addr(_val+0)
STRH	R1, [R0, #0]
;FuncionSenoidal.c,15 :: 		DAC_DHR12R1=val;          //Escribe dat en el buffer del DAC
MOVW	R0, #lo_addr(DAC_DHR12R1+0)
MOVT	R0, #hi_addr(DAC_DHR12R1+0)
STR	R1, [R0, #0]
;FuncionSenoidal.c,16 :: 		DAC_SWTRIGRbits.SWTRIG1=1; //Dispara el proceso de conversion
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(DAC_SWTRIGRbits+0)
MOVT	R0, #hi_addr(DAC_SWTRIGRbits+0)
STR	R1, [R0, #0]
;FuncionSenoidal.c,17 :: 		}
L_end_Caden:
BX	LR
; end of _Caden
_main:
;FuncionSenoidal.c,19 :: 		void main() {
;FuncionSenoidal.c,20 :: 		dato_actual=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_dato_actual+0)
MOVT	R0, #hi_addr(_dato_actual+0)
STRB	R1, [R0, #0]
;FuncionSenoidal.c,22 :: 		RCC_APB1ENR.TIM3EN=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;FuncionSenoidal.c,23 :: 		TIM3_CR1.CEN=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;FuncionSenoidal.c,24 :: 		frecuencia = 0;
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_frecuencia+0)
MOVT	R0, #hi_addr(_frecuencia+0)
STRH	R1, [R0, #0]
;FuncionSenoidal.c,25 :: 		TIM3_PSC=7;
MOVS	R1, #7
MOVW	R0, #lo_addr(TIM3_PSC+0)
MOVT	R0, #hi_addr(TIM3_PSC+0)
STR	R1, [R0, #0]
;FuncionSenoidal.c,26 :: 		TIM3_ARR=142;
MOVS	R1, #142
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;FuncionSenoidal.c,27 :: 		NVIC_IntEnable(IVT_INT_TIM3);
MOVW	R0, #45
BL	_NVIC_IntEnable+0
;FuncionSenoidal.c,28 :: 		TIM3_DIER.UIE=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM3_DIER+0)
MOVT	R0, #hi_addr(TIM3_DIER+0)
STR	R1, [R0, #0]
;FuncionSenoidal.c,29 :: 		TIM3_CR1.CEN=1;
MOVW	R0, #lo_addr(TIM3_CR1+0)
MOVT	R0, #hi_addr(TIM3_CR1+0)
STR	R1, [R0, #0]
;FuncionSenoidal.c,31 :: 		GPIO_Analog_Input(&GPIOA_BASE, _GPIO_PINMASK_4); //PA4 terminal analógica
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Analog_Input+0
;FuncionSenoidal.c,32 :: 		RCC_APB1ENR.B29=1;             //Habilita reloh de APB1 para el DAC
MOVS	R2, #1
SXTB	R2, R2
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R2, [R0, #0]
;FuncionSenoidal.c,33 :: 		DAC_CRbits.EN1=1;              //Enciende módulo DAC1
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R2, [R0, #0]
;FuncionSenoidal.c,34 :: 		DAC_CRbits.BOFF1=1;            //Enciende buffer del DAC1
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R2, [R0, #0]
;FuncionSenoidal.c,35 :: 		DAC_CR+=0x36;                  //Selecciona disparo mediante software
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #54
MOVW	R0, #lo_addr(DAC_CR+0)
MOVT	R0, #hi_addr(DAC_CR+0)
STR	R1, [R0, #0]
;FuncionSenoidal.c,36 :: 		DAC_CRbits.TEN1=1;             //Habilita la conversión del DAC
MOVW	R0, #lo_addr(DAC_CRbits+0)
MOVT	R0, #hi_addr(DAC_CRbits+0)
STR	R2, [R0, #0]
;FuncionSenoidal.c,37 :: 		while(1){
L_main1:
;FuncionSenoidal.c,38 :: 		if(frecuencia%2==0){
MOVW	R0, #lo_addr(_frecuencia+0)
MOVT	R0, #hi_addr(_frecuencia+0)
LDRSH	R2, [R0, #0]
MOVS	R1, #2
SXTH	R1, R1
SDIV	R0, R2, R1
MLS	R0, R1, R0, R2
SXTH	R0, R0
CMP	R0, #0
IT	NE
BNE	L_main3
;FuncionSenoidal.c,39 :: 		TIM3_ARR = 63;
MOVS	R1, #63
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;FuncionSenoidal.c,40 :: 		}
IT	AL
BAL	L_main4
L_main3:
;FuncionSenoidal.c,42 :: 		TIM3_ARR = 142;
MOVS	R1, #142
MOVW	R0, #lo_addr(TIM3_ARR+0)
MOVT	R0, #hi_addr(TIM3_ARR+0)
STR	R1, [R0, #0]
;FuncionSenoidal.c,43 :: 		}
L_main4:
;FuncionSenoidal.c,44 :: 		if(GPIOA_IDR.B0){
MOVW	R1, #lo_addr(GPIOA_IDR+0)
MOVT	R1, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main5
;FuncionSenoidal.c,45 :: 		frecuencia++;
MOVW	R1, #lo_addr(_frecuencia+0)
MOVT	R1, #hi_addr(_frecuencia+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;FuncionSenoidal.c,46 :: 		}
L_main5:
;FuncionSenoidal.c,47 :: 		Delay_ms(200);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main6:
SUBS	R7, R7, #1
BNE	L_main6
NOP
NOP
NOP
NOP
;FuncionSenoidal.c,48 :: 		}
IT	AL
BAL	L_main1
;FuncionSenoidal.c,49 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
