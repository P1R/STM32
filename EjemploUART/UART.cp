#line 1 "C:/Users/JorgeAlejandro/Documents/Sistemas de tiempo real/STM32-master/EjemploUART/UART.c"
char uart_rd;


void main() {
 UART1_Init(9600);
 Delay_ms(100);

 UART1_Write_Text("Start");
 UART1_Write(13);
 UART1_Write(10);

 while (1) {
 if (UART1_Data_Ready() == 1) {
 UART1_Read_Text(uart_rd, "OK", 10);
 UART1_Write_Text(uart_rd);
 }
}
}
