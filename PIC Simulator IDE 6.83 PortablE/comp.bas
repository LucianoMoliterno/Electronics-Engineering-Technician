Symbol comp_change = PIR1.CMIF  'comparator interrupt flag

CMCON = 0x06  'set comparator mode to two common reference comparators with outputs
TRISA = 0x07  'set RA0, RA1 and RA2 as inputs, other PORTA pins as outputs
VRCON = 0xec  'turn on, configure voltage reference module for 2.5V and connect it to RA2
TRISB = 0x00  'set PORTB pins as outputs

loop1:
While Not comp_change  'wait for comparator output change
Wend
PORTB = CMCON  'display CMCON register on PORTB pins, RB6 and RB7 are comparator outputs
comp_change = 0  'reset comparator interrupt flag
Goto loop1  'repeat forever
