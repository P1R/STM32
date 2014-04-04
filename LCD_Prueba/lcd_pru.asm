_Move_Delay:
;lcd_pru.c,20 :: 		void Move_Delay() {                  // Function donde movera texto
;lcd_pru.c,21 :: 		Delay_ms(750);                     // cargara a la velocidad que se movera el texto
MOVW	R7, #33918
MOVT	R7, #30
NOP
NOP
L_Move_Delay0:
SUBS	R7, R7, #1
BNE	L_Move_Delay0
NOP
NOP
NOP
;lcd_pru.c,22 :: 		}
L_end_Move_Delay:
BX	LR
; end of _Move_Delay
_main:
;lcd_pru.c,24 :: 		void main(){
;lcd_pru.c,26 :: 		Lcd_Init();                        // Inicializa LCD
BL	_Lcd_Init+0
;lcd_pru.c,28 :: 		Lcd_Cmd(_LCD_CLEAR);               // limpiar display
MOVS	R0, #1
BL	_Lcd_Cmd+0
;lcd_pru.c,29 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor apagado
MOVS	R0, #12
BL	_Lcd_Cmd+0
;lcd_pru.c,30 :: 		Lcd_Out(1,6,txt3);                 // Escribe texto en la primera linea
MOVW	R2, #lo_addr(_txt3+0)
MOVT	R2, #hi_addr(_txt3+0)
MOVS	R1, #6
MOVS	R0, #1
BL	_Lcd_Out+0
;lcd_pru.c,32 :: 		Lcd_Out(2,6,txt4);                 // Escribe el texto en segundos row
MOVW	R2, #lo_addr(_txt4+0)
MOVT	R2, #hi_addr(_txt4+0)
MOVS	R1, #6
MOVS	R0, #2
BL	_Lcd_Out+0
;lcd_pru.c,33 :: 		Delay_ms(2000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
NOP
;lcd_pru.c,34 :: 		Lcd_Cmd(_LCD_CLEAR);               // limpiar display
MOVS	R0, #1
BL	_Lcd_Cmd+0
;lcd_pru.c,36 :: 		Lcd_Out(1,1,txt1);                 // Write text in first row
MOVW	R2, #lo_addr(_txt1+0)
MOVT	R2, #hi_addr(_txt1+0)
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;lcd_pru.c,37 :: 		Lcd_Out(2,4,txt2);                 // Write text in second row
MOVW	R2, #lo_addr(_txt2+0)
MOVT	R2, #hi_addr(_txt2+0)
MOVS	R1, #4
MOVS	R0, #2
BL	_Lcd_Out+0
;lcd_pru.c,39 :: 		Delay_ms(2000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
NOP
;lcd_pru.c,42 :: 		for(i=0; i<4; i++) {               // Movimiento del texto a la derecha en 4 tiempos
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
L_main6:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
CMP	R0, #4
IT	CS
BCS	L_main7
;lcd_pru.c,43 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
MOVS	R0, #28
BL	_Lcd_Cmd+0
;lcd_pru.c,44 :: 		Move_Delay();
BL	_Move_Delay+0
;lcd_pru.c,42 :: 		for(i=0; i<4; i++) {               // Movimiento del texto a la derecha en 4 tiempos
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;lcd_pru.c,45 :: 		}
IT	AL
BAL	L_main6
L_main7:
;lcd_pru.c,47 :: 		while(1) {                         // usara la variable inicializada ene l bucle
L_main9:
;lcd_pru.c,48 :: 		for(i=0; i<7; i++) {             // Moviento del texto  en 7 tiempos
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
L_main11:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
CMP	R0, #7
IT	CS
BCS	L_main12
;lcd_pru.c,49 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);
MOVS	R0, #24
BL	_Lcd_Cmd+0
;lcd_pru.c,50 :: 		Move_Delay();
BL	_Move_Delay+0
;lcd_pru.c,48 :: 		for(i=0; i<7; i++) {             // Moviento del texto  en 7 tiempos
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;lcd_pru.c,51 :: 		}
IT	AL
BAL	L_main11
L_main12:
;lcd_pru.c,53 :: 		for(i=0; i<7; i++) {             // Movimiento del texto a la derecha en 7 tiempos
MOVS	R1, #0
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRB	R1, [R0, #0]
L_main14:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRB	R0, [R0, #0]
CMP	R0, #7
IT	CS
BCS	L_main15
;lcd_pru.c,54 :: 		Lcd_Cmd(_LCD_SHIFT_RIGHT);
MOVS	R0, #28
BL	_Lcd_Cmd+0
;lcd_pru.c,55 :: 		Move_Delay();
BL	_Move_Delay+0
;lcd_pru.c,53 :: 		for(i=0; i<7; i++) {             // Movimiento del texto a la derecha en 7 tiempos
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;lcd_pru.c,56 :: 		}
IT	AL
BAL	L_main14
L_main15:
;lcd_pru.c,57 :: 		}
IT	AL
BAL	L_main9
;lcd_pru.c,58 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
