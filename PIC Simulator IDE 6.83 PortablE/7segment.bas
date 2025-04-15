Dim digit As Byte  'input variable for GETMASK subroutine
Dim digit1 As Byte  'current high digit
Dim digit2 As Byte  'current low digit
Dim mask As Byte  'output variable from GETMASK subroutine
Dim mask1 As Byte  'current high digit mask
Dim mask2 As Byte  'current low digit mask
Dim i As Byte
Dim phase As Bit

Symbol d1enable = PORTC.0  'enable line for higher 7-segment display
Symbol d2enable = PORTC.1  'enable line for lower 7-segment display
TRISB = %00000000  'set PORTB pins as outputs
TRISC.0 = 0  'set RC0 pin as output
TRISC.1 = 0  'set RC1 pin as output
d1enable = False
d2enable = False
mask1 = 0
mask2 = 0
phase = 0
INTCON.T0IE = 1  'enable Timer0 interrupts
INTCON.GIE = 1  'enable all un-masked interrupts
OPTION_REG.T0CS = 0  'set Timer0 clock source to internal instruction cycle clock

loop:
For i = 0 To 99
	digit1 = i / 10  'get current high digit
	digit2 = i Mod 10  'get current low digit
	TMR0 = 0  'reset Timer0 to prevent its interrupt before both masks are determined
	digit = digit1
	Gosub getmask  'get mask for high digit
	mask1 = mask
	digit = digit2
	Gosub getmask  'get mask for low digit
	mask2 = mask
	Gosub show1  'display new mask
	Gosub show2  'display new mask
	WaitUs 500  'delay interval suitable for simulation
'use large delay for the real device, say WAITMS 500
Next i
Goto loop
End

On Interrupt  'Timer0 interrupt routine
'continuously switch between high and low digit displays
If phase = 0 Then
	phase = 1
	Gosub show1
Else
	phase = 0
	Gosub show2
Endif
INTCON.T0IF = 0  'enable new TMR0 interrupts
Resume

getmask:  'get appropriate 7-segment mask for input digit
	mask = LookUp(0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f), digit
Return

show1:  'show high digit on its display
	d2enable = False
	PORTB = mask1
	d1enable = True
Return

show2:  'show low digit on its display
	d1enable = False
	PORTB = mask2
	d2enable = True
Return
