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
	GOTO L0003
	ORG 0x0004
	RETFIE
L0003:
; 1: Symbol ad_action = ADCON0.GO_DONE 'set new name for A/D conversion start bit
;       The address of 'ad_action' is 0x1F,2
; 2: Symbol display = PORTB 'set new name for PORTB used to display the conversion result
;       The address of 'display' is 0x6
	display EQU 0x6
; 3: 
; 4: TRISB = %00000000 'set PORTB pins as outputs
	BSF STATUS,RP0
	CLRF 0x06
	BCF STATUS,RP0
; 5: TRISA = %111111 'set PORTA pins as inputs
	BSF STATUS,RP0
	MOVLW 0x3F
	MOVWF 0x05
	BCF STATUS,RP0
; 6: ADCON0 = 0xc0 'set A/D conversion clock to internal source
	MOVLW 0xC0
	MOVWF 0x1F
; 7: ADCON1 = 0 'set PORTA pins as analog inputs
	BSF STATUS,RP0
	CLRF 0x1F
	BCF STATUS,RP0
; 8: High ADCON0.ADON 'turn on A/D converter module
	BSF 0x1F,0
; 9: 
; 10: main: 
L0001:
; 11: Gosub getadresult 'go to conversion routine
	CALL L0002
; 12: display = ADRESH 'display the result of the conversion
	MOVF 0x1E,W
	MOVWF 0x06
; 13: Goto main 'repeat forever
	GOTO L0001
; 14: End
L0004:	GOTO L0004
; 15: 
; 16: getadresult:  'conversion routine
L0002:
; 17: High ad_action 'start the conversion
	BSF 0x1F,2
; 18: While ad_action 'wait until conversion is completed
L0005:
	BTFSS 0x1F,2
	GOTO L0006
; 19: Wend
	GOTO L0005
L0006:	MOVLW 0x1F
	ANDWF STATUS,F
; 20: Return
	RETURN
; End of program
L0007:	GOTO L0007
; End of listing
	END
