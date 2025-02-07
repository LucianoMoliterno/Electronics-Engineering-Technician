TRISA = 0x00  'set all PORTA pins as outputs
PORTA = 0xff  'make all PORTA pins high
INTCON.INTE = 1  'enable RB0/INT interrupts
INTCON.GIE = 1  'enable all un-masked interrupts
End

On Interrupt  'interrupt routine
PORTA = PORTA - 1  'decrement the value on PORTA
INTCON.INTF = 0  'enable new RB0/INT interrupts
Resume
