TRISB = 0x00  'set all PORTB pins as outputs
PORTB = %11111111  'make all PORTB pins high
INTCON.T0IE = 1  'enable Timer0 interrupts
INTCON.GIE = True  'enable all un-masked interrupts
OPTION_REG.T0CS = False  'set Timer0 clock source to internal instruction cycle clock
End

On Interrupt  'interrupt routine
PORTB = PORTB - 1  'decrement the value on PORTB
INTCON.T0IF = 0  'enable new TMR0 interrupts
Resume
