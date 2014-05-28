_Conf_puertos:
;ServoMotores.c,5 :: 		void Conf_puertos(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ServoMotores.c,7 :: 		GPIO_Digital_Input(&GPIOA_BASE,_GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Input+0
;ServoMotores.c,8 :: 		GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_8);
MOVW	R1, #256
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;ServoMotores.c,9 :: 		}
L_end_Conf_puertos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Conf_puertos
_main:
;ServoMotores.c,11 :: 		void main() {
SUB	SP, SP, #4
;ServoMotores.c,12 :: 		Conf_puertos();
BL	_Conf_puertos+0
;ServoMotores.c,13 :: 		LAMPARA = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;ServoMotores.c,14 :: 		current_duty =100;                        // initial value for current_duty
MOVS	R1, #100
MOVW	R0, #lo_addr(_current_duty+0)
MOVT	R0, #hi_addr(_current_duty+0)
STR	R0, [SP, #0]
STRH	R1, [R0, #0]
;ServoMotores.c,15 :: 		pwm_period1 = PWM_TIM2_Init(50);
MOVS	R0, #50
BL	_PWM_TIM2_Init+0
MOVW	R1, #lo_addr(_pwm_period1+0)
MOVT	R1, #hi_addr(_pwm_period1+0)
STRH	R0, [R1, #0]
;ServoMotores.c,16 :: 		PWM_TIM2_Set_Duty(current_duty,  _PWM_NON_INVERTED, _PWM_CHANNEL2);
LDR	R0, [SP, #0]
LDRH	R0, [R0, #0]
MOVS	R2, #1
MOVS	R1, #0
BL	_PWM_TIM2_Set_Duty+0
;ServoMotores.c,17 :: 		PWM_TIM2_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM2_CH2_PA1);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM2_CH2_PA1+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM2_CH2_PA1+0)
MOVS	R0, #1
BL	_PWM_TIM2_Start+0
;ServoMotores.c,19 :: 		while (1){
L_main0:
;ServoMotores.c,20 :: 		if(GPIOA_IDR.B0){
MOVW	R1, #lo_addr(GPIOA_IDR+0)
MOVT	R1, #hi_addr(GPIOA_IDR+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main2
;ServoMotores.c,21 :: 		LAMPARA = ~LAMPARA;
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;ServoMotores.c,22 :: 		Delay_ms(1);
MOVW	R7, #2665
MOVT	R7, #0
NOP
NOP
L_main3:
SUBS	R7, R7, #1
BNE	L_main3
NOP
NOP
;ServoMotores.c,23 :: 		current_duty = current_duty + 50;       // increment current_duty
MOVW	R2, #lo_addr(_current_duty+0)
MOVT	R2, #hi_addr(_current_duty+0)
LDRH	R0, [R2, #0]
ADDW	R1, R0, #50
UXTH	R1, R1
STRH	R1, [R2, #0]
;ServoMotores.c,24 :: 		if (current_duty > pwm_period1) {      // if we increase current_duty greater then possible pwm_period1 value
MOVW	R0, #lo_addr(_pwm_period1+0)
MOVT	R0, #hi_addr(_pwm_period1+0)
LDRH	R0, [R0, #0]
CMP	R1, R0
IT	LS
BLS	L_main5
;ServoMotores.c,25 :: 		current_duty = 1;                    // reset current_duty value to zero
MOVS	R1, #1
MOVW	R0, #lo_addr(_current_duty+0)
MOVT	R0, #hi_addr(_current_duty+0)
STRH	R1, [R0, #0]
;ServoMotores.c,26 :: 		}
L_main5:
;ServoMotores.c,27 :: 		PWM_TIM2_Set_Duty(current_duty,  _PWM_NON_INVERTED, _PWM_CHANNEL2); /// set newly acquired duty ratio
MOVW	R0, #lo_addr(_current_duty+0)
MOVT	R0, #hi_addr(_current_duty+0)
LDRH	R0, [R0, #0]
MOVS	R2, #1
MOVS	R1, #0
BL	_PWM_TIM2_Set_Duty+0
;ServoMotores.c,28 :: 		}
L_main2:
;ServoMotores.c,29 :: 		Delay_ms(1);                             // slow down change pace a little
MOVW	R7, #2665
MOVT	R7, #0
NOP
NOP
L_main6:
SUBS	R7, R7, #1
BNE	L_main6
NOP
NOP
;ServoMotores.c,30 :: 		}
IT	AL
BAL	L_main0
;ServoMotores.c,31 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
