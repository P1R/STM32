_main:
;LM35andUART.c,26 :: 		void main() {
;LM35andUART.c,27 :: 		Lcd_Init();
BL	_Lcd_Init+0
;LM35andUART.c,28 :: 		Config_ptos();
BL	_Config_ptos+0
;LM35andUART.c,29 :: 		Config_adc();
BL	_Config_adc+0
;LM35andUART.c,30 :: 		Config_UART1();
BL	_Config_UART1+0
;LM35andUART.c,31 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;LM35andUART.c,32 :: 		Lcd_Out(1, 1, "9CM11-Termometro");
MOVW	R0, #lo_addr(?lstr1_LM35andUART+0)
MOVT	R0, #hi_addr(?lstr1_LM35andUART+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;LM35andUART.c,33 :: 		delay_ms(2000);
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
;LM35andUART.c,34 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;LM35andUART.c,35 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;LM35andUART.c,36 :: 		while(1){
L_main2:
;LM35andUART.c,37 :: 		Proceso();
BL	_Proceso+0
;LM35andUART.c,38 :: 		}
IT	AL
BAL	L_main2
;LM35andUART.c,39 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Config_ptos:
;LM35andUART.c,41 :: 		void Config_ptos(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;LM35andUART.c,42 :: 		GPIO_Digital_Output(&GPIOB_BASE,_GPIO_PINMASK_10|_GPIO_PINMASK_11|_GPIO_PINMASK_12);
MOVW	R1, #7168
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;LM35andUART.c,43 :: 		GPIO_Digital_Output(&GPIOB_BASE,_GPIO_PINMASK_13|_GPIO_PINMASK_14|_GPIO_PINMASK_15);
MOVW	R1, #57344
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;LM35andUART.c,44 :: 		GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_8|_GPIO_PINMASK_9);
MOVW	R1, #768
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;LM35andUART.c,45 :: 		GPIO_Analog_input(&GPIOC_BASE,_GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Analog_Input+0
;LM35andUART.c,46 :: 		VENTILADOR = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;LM35andUART.c,47 :: 		LAMPARA = 0;
MOVW	R0, #lo_addr(GPIOC_ODRbits+0)
MOVT	R0, #hi_addr(GPIOC_ODRbits+0)
STR	R1, [R0, #0]
;LM35andUART.c,48 :: 		}
L_end_Config_ptos:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Config_ptos
_Config_adc:
;LM35andUART.c,49 :: 		void Config_adc(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;LM35andUART.c,50 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_10);
MOVW	R0, #1024
BL	_ADC_Set_Input_Channel+0
;LM35andUART.c,51 :: 		ADC1_Init();
BL	_ADC1_Init+0
;LM35andUART.c,52 :: 		}
L_end_Config_adc:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Config_adc
_Config_UART1:
;LM35andUART.c,53 :: 		void Config_UART1(void){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;LM35andUART.c,54 :: 		UART1_Init(9600);
MOVW	R0, #9600
BL	_UART1_Init+0
;LM35andUART.c,55 :: 		Delay_ms(100);
MOVW	R7, #4521
MOVT	R7, #4
NOP
NOP
L_Config_UART14:
SUBS	R7, R7, #1
BNE	L_Config_UART14
NOP
NOP
;LM35andUART.c,59 :: 		Lcd_Out(1, 1, "Inicia UART1");
MOVW	R0, #lo_addr(?lstr2_LM35andUART+0)
MOVT	R0, #hi_addr(?lstr2_LM35andUART+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;LM35andUART.c,60 :: 		delay_ms(2000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_Config_UART16:
SUBS	R7, R7, #1
BNE	L_Config_UART16
NOP
NOP
NOP
NOP
;LM35andUART.c,61 :: 		}
L_end_Config_UART1:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Config_UART1
_Proceso:
;LM35andUART.c,64 :: 		void Proceso(void){
SUB	SP, SP, #36
STR	LR, [SP, #0]
;LM35andUART.c,72 :: 		adc_value = ADC1_Get_Sample(10);
MOVS	R0, #10
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_adc_value+0)
MOVT	R1, #hi_addr(_adc_value+0)
STRH	R0, [R1, #0]
;LM35andUART.c,73 :: 		grados = adc_value/cuentas;
BL	__UnsignedIntegralToFloat+0
MOVW	R2, #18586
MOVT	R2, #17002
BL	__Div_FP+0
;LM35andUART.c,74 :: 		FloatToStr(grados,centigrados);
ADD	R1, SP, #19
BL	_FloatToStr+0
;LM35andUART.c,75 :: 		UART1_Write_Text(centigrados);
ADD	R0, SP, #19
BL	_UART1_Write_Text+0
;LM35andUART.c,76 :: 		UART1_Write(13);
MOVS	R0, #13
BL	_UART1_Write+0
;LM35andUART.c,77 :: 		UART1_Write(10);
MOVS	R0, #10
BL	_UART1_Write+0
;LM35andUART.c,78 :: 		Lcd_Out(1, 1, centigrados);
ADD	R0, SP, #19
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;LM35andUART.c,79 :: 		Lcd_Out(1, 8, "\xDFc");
MOVW	R0, #lo_addr(?lstr3_LM35andUART+0)
MOVT	R0, #hi_addr(?lstr3_LM35andUART+0)
MOV	R2, R0
MOVS	R1, #8
MOVS	R0, #1
BL	_Lcd_Out+0
;LM35andUART.c,81 :: 		volts = adc_value;
MOVW	R0, #lo_addr(_adc_value+0)
MOVT	R0, #hi_addr(_adc_value+0)
LDRH	R0, [R0, #0]
BL	__UnsignedIntegralToFloat+0
;LM35andUART.c,82 :: 		FloatToStr(volts,val);
ADD	R1, SP, #4
BL	_FloatToStr+0
;LM35andUART.c,83 :: 		Lcd_Out(2, 15, "V");
MOVW	R0, #lo_addr(?lstr4_LM35andUART+0)
MOVT	R0, #hi_addr(?lstr4_LM35andUART+0)
MOV	R2, R0
MOVS	R1, #15
MOVS	R0, #2
BL	_Lcd_Out+0
;LM35andUART.c,84 :: 		Lcd_Out(2, 1, val);
ADD	R0, SP, #4
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;LM35andUART.c,85 :: 		delay(0xFFFFF);
MOVW	R0, #65535
MOVT	R0, #15
BL	_delay+0
;LM35andUART.c,86 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;LM35andUART.c,88 :: 		if (UART1_Data_Ready()) {     // If data is received
BL	_UART1_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_Proceso8
;LM35andUART.c,89 :: 		uart_rd = UART1_Read();     // read the received data
BL	_UART1_Read+0
MOVW	R1, #lo_addr(_uart_rd+0)
MOVT	R1, #hi_addr(_uart_rd+0)
STRB	R0, [R1, #0]
;LM35andUART.c,90 :: 		if (uart_rd == '1'){
UXTB	R0, R0
CMP	R0, #49
IT	NE
BNE	L_Proceso9
;LM35andUART.c,91 :: 		LAMPARA = ~LAMPARA;
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;LM35andUART.c,92 :: 		}
IT	AL
BAL	L_Proceso10
L_Proceso9:
;LM35andUART.c,93 :: 		else if (uart_rd == '2')
MOVW	R0, #lo_addr(_uart_rd+0)
MOVT	R0, #hi_addr(_uart_rd+0)
LDRB	R0, [R0, #0]
CMP	R0, #50
IT	NE
BNE	L_Proceso11
;LM35andUART.c,95 :: 		VENTILADOR = ~VENTILADOR;
MOVW	R1, #lo_addr(GPIOC_ODRbits+0)
MOVT	R1, #hi_addr(GPIOC_ODRbits+0)
LDR	R0, [R1, #0]
EOR	R0, R0, #1
STR	R0, [R1, #0]
;LM35andUART.c,96 :: 		}
L_Proceso11:
L_Proceso10:
;LM35andUART.c,97 :: 		}
L_Proceso8:
;LM35andUART.c,98 :: 		}
L_end_Proceso:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _Proceso
_delay:
;LM35andUART.c,101 :: 		void delay(unsigned long contador)
;LM35andUART.c,103 :: 		while(--contador);
L_delay12:
SUBS	R1, R0, #1
MOV	R0, R1
CMP	R1, #0
IT	EQ
BEQ	L_delay13
IT	AL
BAL	L_delay12
L_delay13:
;LM35andUART.c,104 :: 		}
L_end_delay:
BX	LR
; end of _delay
