Dim i As Byte  'declare a variable
Hseropen 9600  'open hardware uart port for baud rate 9600
'WaitMs 1000 'this delay should be used in a real device

For i = 10 To 5 Step -1  'for-next loop
Hserout "Number: ", #i, CrLf  'send formatted output to serial port
'WaitMs 500 'this delay should be used in a real device
Next i

loop:
	Hserin i  'wait to receive a byte on serial port
	Hserout "Number: ", #i, CrLf  'send formatted output to serial port
Goto loop  'loop forever
