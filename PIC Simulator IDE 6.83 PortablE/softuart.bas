Define SEROUT_DELAYUS = 500
Dim i As Byte  'declare a variable
'WaitMs 1000 'this delay should be used in a real device

For i = 10 To 5 Step -1  'for-next loop
Serout PORTB.1, 9600, "Number: ", #i, CrLf  'send formatted output to PORTB.1 (TX line of software UART)
'WaitMs 500 'this delay should be used in a real device
Next i

loop:
	Serin PORTB.2, 9600, i  'wait to receive a byte on PORTB.2 (RX line of software UART)
	Serout PORTB.1, 9600, "Number: ", #i, CrLf  'send formatted output to serial port
Goto loop  'loop forever
