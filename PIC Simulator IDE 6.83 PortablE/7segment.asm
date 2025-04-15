; Begin
	R0L EQU 0x20
	R0H EQU 0x21
	R1L EQU 0x22
	R1H EQU 0x23
	R2L EQU 0x24
	R2H EQU 0x25
	R3L EQU 0x26
	R3H EQU 0x27
	R4L EQU 0x28
	R4H EQU 0x29
	R5L EQU 0x2A
	R5H EQU 0x2B
	W_TEMP EQU 0x7F
	STATUS_TEMP EQU 0x7E
	ORG 0x0000
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO L0005
	ORG 0x0004
	MOVWF W_TEMP
	SWAPF STATUS,W
	CLRF STATUS
	MOVWF STATUS_TEMP
	CALL L0006
	SWAPF STATUS_TEMP,W
	MOVWF STATUS
	SWAPF W_TEMP,F
	SWAPF W_TEMP,W
	RETFIE
L0005:
; 1: Dim digit As Byte 'input variable for GETMASK subroutine
;       The address of 'digit' is 0x2D
	digit EQU 0x2D
; 2: Dim digit1 As Byte 'current high digit
;       The address of 'digit1' is 0x2E
	digit1 EQU 0x2E
; 3: Dim digit2 As Byte 'current low digit
;       The address of 'digit2' is 0x2F
	digit2 EQU 0x2F
; 4: Dim mask As Byte 'output variable from GETMASK subroutine
;       The address of 'mask' is 0x30
	mask EQU 0x30
; 5: Dim mask1 As Byte 'current high digit mask
;       The address of 'mask1' is 0x31
	mask1 EQU 0x31
; 6: Dim mask2 As Byte 'current low digit mask
;       The address of 'mask2' is 0x32
	mask2 EQU 0x32
; 7: Dim i As Byte
;       The address of 'i' is 0x33
	i EQU 0x33
; 8: Dim phase As Bit
;       The address of 'phase' is 0x2C,0
; 9: 
; 10: Symbol d1enable = PORTC.0 'enable line for higher 7-segment display
;       The address of 'd1enable' is 0x7,0
; 11: Symbol d2enable = PORTC.1 'enable line for lower 7-segment display
;       The address of 'd2enable' is 0x7,1
; 12: TRISB = %00000000 'set PORTB pins as outputs
	BSF STATUS,RP0
	CLRF 0x06
	BCF STATUS,RP0
; 13: TRISC.0 = 0 'set RC0 pin as output
	BSF STATUS,RP0
	BCF 0x07,0
	BCF STATUS,RP0
; 14: TRISC.1 = 0 'set RC1 pin as output
	BSF STATUS,RP0
	BCF 0x07,1
	BCF STATUS,RP0
; 15: d1enable = False
	BCF 0x07,0
; 16: d2enable = False
	BCF 0x07,1
; 17: mask1 = 0
	CLRF 0x31
; 18: mask2 = 0
	CLRF 0x32
; 19: phase = 0
	BCF 0x2C,0
; 20: INTCON.T0IE = 1 'enable Timer0 interrupts
	BSF 0x0B,5
; 21: INTCON.GIE = 1 'enable all un-masked interrupts
	BSF 0x0B,7
; 22: OPTION_REG.T0CS = 0 'set Timer0 clock source to internal instruction cycle clock
	BSF STATUS,RP0
	BCF 0x01,5
	BCF STATUS,RP0
; 23: 
; 24: loop: 
L0001:
; 25: For i = 0 To 99
	CLRF 0x33
L0007:
	MOVF 0x33,W
	SUBLW 0x63
	BTFSS STATUS,C
	GOTO L0008
; 26: digit1 = i / 10 'get current high digit
	MOVF 0x33,W
	MOVWF R0L
	CLRF R0H
	MOVLW 0x0A
	MOVWF R1L
	CLRF R1H
	CALL D001
	MOVWF 0x2E
; 27: digit2 = i Mod 10 'get current low digit
	MOVF 0x33,W
	MOVWF R0L
	CLRF R0H
	MOVLW 0x0A
	MOVWF R1L
	CLRF R1H
	CALL D001
	MOVF R2L,W
	MOVWF 0x2F
; 28: TMR0 = 0 'reset Timer0 to prevent its interrupt before both masks are determined
	CLRF 0x01
; 29: digit = digit1
	MOVF 0x2E,W
	MOVWF 0x2D
; 30: Gosub getmask 'get mask for high digit
	CALL L0002
; 31: mask1 = mask
	MOVF 0x30,W
	MOVWF 0x31
; 32: digit = digit2
	MOVF 0x2F,W
	MOVWF 0x2D
; 33: Gosub getmask 'get mask for low digit
	CALL L0002
; 34: mask2 = mask
	MOVF 0x30,W
	MOVWF 0x32
; 35: Gosub show1 'display new mask
	CALL L0003
; 36: Gosub show2 'display new mask
	CALL L0004
; 37: WaitUs 500 'delay interval suitable for simulation
	MOVLW 0xF4
	MOVWF R4L
	MOVLW 0x01
	MOVWF R4H
	CALL Y001
; 38:  'use large delay for the real device, say WAITMS 500
; 39: Next i
	MOVLW 0x01
	ADDWF 0x33,F
	BTFSS STATUS,C
	GOTO L0007
L0008:	MOVLW 0x1F
	ANDWF STATUS,F
; 40: Goto loop
	GOTO L0001
; 41: End
L0009:	GOTO L0009
; 42: 
; 43: On Interrupt 'Timer0 interrupt routine
L0006:
; 44:  'continuously switch between high and low digit displays
; 45: If phase = 0 Then
	BTFSC 0x2C,0
	GOTO L0010
; 46: phase = 1
	BSF 0x2C,0
; 47: Gosub show1
	CALL L0003
; 48: Else
	GOTO L0011
L0010:	MOVLW 0x1F
	ANDWF STATUS,F
; 49: phase = 0
	BCF 0x2C,0
; 50: Gosub show2
	CALL L0004
; 51: Endif
L0011:	MOVLW 0x1F
	ANDWF STATUS,F
; 52: INTCON.T0IF = 0 'enable new TMR0 interrupts
	BCF 0x0B,2
; 53: Resume
	RETURN
; 54: 
; 55: getmask:  'get appropriate 7-segment mask for input digit
L0002:
; 56: mask = LookUp(0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f, 0x6f), digit
	MOVF 0x2D,W
	SUBLW 0x09
	BTFSS STATUS,C
	GOTO L0012
	CALL L0013
	MOVWF 0x30
	GOTO L0012
L0013:
	MOVLW 0x00
	MOVWF PCLATH
	MOVF 0x2D,W
	ADDWF PCL,F
	RETLW 0x3F
	RETLW 0x06
	RETLW 0x5B
	RETLW 0x4F
	RETLW 0x66
	RETLW 0x6D
	RETLW 0x7D
	RETLW 0x07
	RETLW 0x7F
	RETLW 0x6F
L0012:
; 57: Return
	RETURN
; 58: 
; 59: show1:  'show high digit on its display
L0003:
; 60: d2enable = False
	BCF 0x07,1
; 61: PORTB = mask1
	MOVF 0x31,W
	MOVWF 0x06
; 62: d1enable = True
	BSF 0x07,0
; 63: Return
	RETURN
; 64: 
; 65: show2:  'show low digit on its display
L0004:
; 66: d1enable = False
	BCF 0x07,0
; 67: PORTB = mask2
	MOVF 0x32,W
	MOVWF 0x06
; 68: d2enable = True
	BSF 0x07,1
; 69: Return
	RETURN
; End of program
L0014:	GOTO L0014
; Division Routine
D001:	MOVLW 0x10
	MOVWF R3L
	CLRF R2H
	CLRF R2L
D002:	RLF R0H,W
	RLF R2L,F
	RLF R2H,F
	MOVF R1L,W
	SUBWF R2L,F
	MOVF R1H,W
	BTFSS STATUS,C
	INCFSZ R1H,W
	SUBWF R2H,F
	BTFSC STATUS,C
	GOTO D003
	MOVF R1L,W
	ADDWF R2L,F
	MOVF R1H,W
	BTFSC STATUS,C
	INCFSZ R1H,W
	ADDWF R2H,F
	BCF STATUS,C
D003:	RLF R0L,F
	RLF R0H,F
	DECFSZ R3L,F
	GOTO D002
	MOVF R0L,W
	RETURN
; Waitus Routine - Word Argument
Y001:	MOVLW 0x10
	SUBWF R4L,F
	CLRW
	BTFSS STATUS,C
	ADDLW 0x01
	SUBWF R4H,F
	BTFSS STATUS,C
	RETURN
	GOTO Y002
Y002:	MOVLW 0x0A
	SUBWF R4L,F
	CLRW
	BTFSS STATUS,C
	ADDLW 0x01
	SUBWF R4H,F
	BTFSS STATUS,C
	RETURN
	GOTO Y002
; End of listing
	END
