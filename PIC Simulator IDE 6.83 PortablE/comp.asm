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
	ORG 0x0000
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO L0002
	ORG 0x0004
	RETFIE
L0002:
; 1: Symbol comp_change = PIR1.CMIF 'comparator interrupt flag
;       The address of 'comp_change' is 0xC,6
; 2: 
; 3: CMCON = 0x06 'set comparator mode to two common reference comparators with outputs
	MOVLW 0x06
	MOVWF 0x1F
; 4: TRISA = 0x07 'set RA0, RA1 and RA2 as inputs, other PORTA pins as outputs
	BSF STATUS,RP0
	MOVLW 0x07
	MOVWF 0x05
	BCF STATUS,RP0
; 5: VRCON = 0xec 'turn on, configure voltage reference module for 2.5V and connect it to RA2
	BSF STATUS,RP0
	MOVLW 0xEC
	MOVWF 0x1F
	BCF STATUS,RP0
; 6: TRISB = 0x00 'set PORTB pins as outputs
	BSF STATUS,RP0
	CLRF 0x06
	BCF STATUS,RP0
; 7: 
; 8: loop1: 
L0001:
; 9: While Not comp_change 'wait for comparator output change
L0003:
	BTFSC 0x0C,6
	GOTO L0004
; 10: Wend
	GOTO L0003
L0004:	MOVLW 0x1F
	ANDWF STATUS,F
; 11: PORTB = CMCON 'display CMCON register on PORTB pins, RB6 and RB7 are comparator outputs
	MOVF 0x1F,W
	MOVWF 0x06
; 12: comp_change = 0 'reset comparator interrupt flag
	BCF 0x0C,6
; 13: Goto loop1 'repeat forever
	GOTO L0001
; End of program
L0005:	GOTO L0005
; End of listing
	END
