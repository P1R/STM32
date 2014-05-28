char uart_rd;


void main() {
 UART1_Init(9600);              // Initialize UART module at 56000 bps
  Delay_ms(100);                  // Wait for UART module to stabilize

  UART1_Write_Text("Start");
  UART1_Write(13);
  UART1_Write(10);

  while (1) {
  if (UART1_Data_Ready() == 1) {          // if data is received
    UART1_Read_Text(uart_rd, "OK", 10);    // reads text until 'OK' is found
    UART1_Write_Text(uart_rd);             // sends back text
 }
}
}