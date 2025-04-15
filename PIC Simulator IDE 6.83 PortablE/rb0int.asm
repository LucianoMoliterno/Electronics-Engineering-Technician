; Begin
	R0L EQU 0xC
	R0H EQU 0xD
	R1L EQU 0xE
	R1H EQU 0xF
	R2L EQU 0x10
	R2H EQU 0x11
	R3L EQU 0x12
	R3H EQU 0x13
	R4L EQU 0x14
	R4H EQU 0x15
	R5L EQU 0x16
	R5H EQU 0x17
	W_TEMP EQU 0x4F
	STATUS_TEMP EQU 0x4E
	ORG 0x0000
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO L0001
	ORG 0x0004
	MOVWF W_TEMP
	SWAPF STATUS,W
	CLRF STATUS
	MOVWF STATUS_TEMP
	CALL L0002
	SWAPF STATUS_TEMP,W
	MOVWF STATUS
	SWAPF W_TEMP,F
	SWAPF W_TEMP,W
	RETFIE
L0001:
; 1: TRISA = 0x00 'set all PORTA pins as outputs
	BSF STATUS,RP0
	CLRF 0x05
	BCF STATUS,RP0
; 2: PORTA = 0xff 'make all PORTA pins high
	MOVLW 0xFF
	MOVWF 0x05
; 3: INTCON.INTE = 1 'enable RB0/INT interrupts
	BSF 0x0B,4
; 4: INTCON.GIE = 1 'enable all un-masked interrupts
	BSF 0x0B,7
; 5: End
L0003:	GOTO L0003
; 6: 
; 7: On Interrupt 'interrupt routine
L0002:
; 8: PORTA = PORTA - 1 'decrement the value on PORTA
	MOVLW 0x01
	SUBWF 0x05,W
	MOVWF 0x05
; 9: INTCON.INTF = 0 'enable new RB0/INT interrupts
	BCF 0x0B,1
; 10: Resume
	RETURN
; End of program
L0004:	GOTO L0004
; End of listing
	END
