unsigned int current_duty, old_duty, i;
unsigned int pwm_period1;
sbit LAMPARA at GPIOC_ODRbits.B8;

void Conf_puertos(void)
{
 GPIO_Digital_Input(&GPIOA_BASE,_GPIO_PINMASK_0);
 GPIO_Digital_Output(&GPIOC_BASE,_GPIO_PINMASK_8);
}

void main() {
  Conf_puertos();
  LAMPARA = 1;
  current_duty =100;                        // initial value for current_duty
  pwm_period1 = PWM_TIM2_Init(50);
  PWM_TIM2_Set_Duty(current_duty,  _PWM_NON_INVERTED, _PWM_CHANNEL2);
  PWM_TIM2_Start(_PWM_CHANNEL2, &_GPIO_MODULE_TIM2_CH2_PA1);
  
    while (1){
     if(GPIOA_IDR.B0){
      LAMPARA = ~LAMPARA;
      Delay_ms(1);
       current_duty = current_duty + 100;       // increment current_duty
        if (current_duty > pwm_period1) {      // if we increase current_duty greater then possible pwm_period1 value
        current_duty = 1;                    // reset current_duty value to zero
        }
       PWM_TIM2_Set_Duty(current_duty,  _PWM_NON_INVERTED, _PWM_CHANNEL2); /// set newly acquired duty ratio
      }
    Delay_ms(1);                             // slow down change pace a little
  }
}