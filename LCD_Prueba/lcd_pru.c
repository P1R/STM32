// LCD module connections
sbit LCD_RS at GPIOB_ODR.B10;
sbit LCD_EN at GPIOB_ODR.B11;
sbit LCD_D4 at GPIOB_ODR.B12;
sbit LCD_D5 at GPIOB_ODR.B13;
sbit LCD_D6 at GPIOB_ODR.B14;
sbit LCD_D7 at GPIOB_ODR.B15;
// End LCD module connections
void Lcd_Init();
void Lcd_Cmd();
void Lcd_Out();

char txt1[] = "Mariyam has";
char txt2[] = "beautiful eyes";
char txt3[] = "Message";
char txt4[] = "from P1R0";

char i;                              // Inicializo variable para el bucle

void Move_Delay() {                  // Function donde movera texto
  Delay_ms(750);                     // cargara a la velocidad que se movera el texto
}

void main(){

  Lcd_Init();                        // Inicializa LCD

  Lcd_Cmd(_LCD_CLEAR);               // limpiar display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor apagado
  Lcd_Out(1,6,txt3);                 // Escribe texto en la primera linea

  Lcd_Out(2,6,txt4);                 // Escribe el texto en segundos row
  Delay_ms(2000);
  Lcd_Cmd(_LCD_CLEAR);               // limpiar display

  Lcd_Out(1,1,txt1);                 // Write text in first row
  Lcd_Out(2,4,txt2);                 // Write text in second row

  Delay_ms(2000);

  // Movimiento del texto
  for(i=0; i<4; i++) {               // Movimiento del texto a la derecha en 4 tiempos
    Lcd_Cmd(_LCD_SHIFT_RIGHT);
    Move_Delay();
  }

  while(1) {                         // usara la variable inicializada ene l bucle
    for(i=0; i<7; i++) {             // Moviento del texto  en 7 tiempos
      Lcd_Cmd(_LCD_SHIFT_LEFT);
      Move_Delay();
    }

    for(i=0; i<7; i++) {             // Movimiento del texto a la derecha en 7 tiempos
      Lcd_Cmd(_LCD_SHIFT_RIGHT);
      Move_Delay();
    }
  }
}