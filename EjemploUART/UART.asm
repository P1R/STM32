_main:
;UART.c,4 :: 		void main() {
;UART.c,5 :: 		UART1_Init(9600);              // Initialize UART module at 56000 bps
MOVW	R0, #9600
BL	_UART1_Init+0
;UART.c,6 :: 		Delay_ms(100);                  // Wait for UART module to stabilize
MOVW	R7, #4521
MOVT	R7, #4
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
;UART.c,8 :: 		UART1_Write_Text("Start");
MOVW	R0, #lo_addr(?lstr1_UART+0)
MOVT	R0, #hi_addr(?lstr1_UART+0)
BL	_UART1_Write_Text+0
;UART.c,9 :: 		UART1_Write(13);
MOVS	R0, #13
BL	_UART1_Write+0
;UART.c,10 :: 		UART1_Write(10);
MOVS	R0, #10
BL	_UART1_Write+0
;UART.c,12 :: 		while (1) {
L_main2:
;UART.c,13 :: 		if (UART1_Data_Ready() == 1) {          // if data is received
BL	_UART1_Data_Ready+0
CMP	R0, #1
IT	NE
BNE	L_main4
;UART.c,14 :: 		UART1_Read_Text(uart_rd, "OK", 10);    // reads text until 'OK' is found
MOVW	R1, #lo_addr(?lstr2_UART+0)
MOVT	R1, #hi_addr(?lstr2_UART+0)
MOVW	R0, #lo_addr(_uart_rd+0)
MOVT	R0, #hi_addr(_uart_rd+0)
LDRB	R0, [R0, #0]
MOVS	R2, #10
BL	_UART1_Read_Text+0
;UART.c,15 :: 		UART1_Write_Text(uart_rd);             // sends back text
MOVW	R0, #lo_addr(_uart_rd+0)
MOVT	R0, #hi_addr(_uart_rd+0)
LDRB	R0, [R0, #0]
BL	_UART1_Write_Text+0
;UART.c,16 :: 		}
L_main4:
;UART.c,17 :: 		}
IT	AL
BAL	L_main2
;UART.c,18 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
