Symbol ad_action = ADCON0.GO_DONE  'set new name for A/D conversion start bit
Symbol display = PORTB  'set new name for PORTB used to display the conversion result

TRISB = %00000000  'set PORTB pins as outputs
TRISA = %111111  'set PORTA pins as inputs
ADCON0 = 0xc0  'set A/D conversion clock to internal source
ADCON1 = 0  'set PORTA pins as analog inputs
High ADCON0.ADON  'turn on A/D converter module

main:
Gosub getadresult  'go to conversion routine
display = ADRESH  'display the result of the conversion
Goto main  'repeat forever
End

getadresult:  'conversion routine
High ad_action  'start the conversion
While ad_action  'wait until conversion is completed
Wend
Return
