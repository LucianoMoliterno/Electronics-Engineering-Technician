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
	ORG 0x0000
	BCF PCLATH,3
	BCF PCLATH,4
	GOTO L0001
	ORG 0x0004
	RETFIE
L0001:
; 1: Dim a As Word 'first number
;       The address of 'a' is 0x18
	a EQU 0x18
; 2: Dim b As Word 'second number
;       The address of 'b' is 0x1A
	b EQU 0x1A
; 3: Dim x As Word 'result
;       The address of 'x' is 0x1C
	x EQU 0x1C
; 4:
; 5: a = 123 'set first number
	MOVLW 0x7B
	MOVWF 0x18
	CLRF 0x19
; 6: b = 234 'set second number
	MOVLW 0xEA
	MOVWF 0x1A
	CLRF 0x1B
; 7: x = a * b 'calculate result
	MOVF 0x18,W
	MOVWF R3L
	MOVF 0x19,W
	MOVWF R3H
	MOVF 0x1A,W
	MOVWF R1L
	MOVF 0x1B,W
	MOVWF R1H
	CALL M001
	MOVWF 0x1C
	MOVF R2H,W
	MOVWF 0x1D
; End of program
L0002:	GOTO L0002
; Multiplication Routine
M001:	MOVLW 0x10
	MOVWF R4L
	CLRF R0H
	CLRF R0L
M002:	RRF R3H,F
	RRF R3L,F
	BTFSS STATUS,C
	GOTO M003
	MOVF R1L,W
	ADDWF R0L,F
	MOVF R1H,W
	BTFSC STATUS,C
	INCFSZ R1H,W
	ADDWF R0H,F
M003:	RRF R0H,F
	RRF R0L,F
	RRF R2H,F
	RRF R2L,F
	DECFSZ R4L,F
	GOTO M002
	MOVF R2L,W
	RETURN
; End of listing
	END
