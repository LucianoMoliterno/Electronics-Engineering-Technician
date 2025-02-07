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
; 1: Dim a As Byte 'eeprom address
;       The address of 'a' is 0x18
	a EQU 0x18
; 2: Dim b As Byte 'eeprom data
;       The address of 'b' is 0x19
	b EQU 0x19
; 3: 
; 4: For a = 0 To 63 'go through whole eeprom memory
	CLRF 0x18
L0002:
	MOVF 0x18,W
	SUBLW 0x3F
	BTFSS STATUS,C
	GOTO L0003
; 5: b = 255 - a 'set the data value to be written
	MOVF 0x18,W
	SUBLW 0xFF
	MOVWF 0x19
; 6: Write a, b 'perform the writing to eeprom
	MOVF 0x18,W
	MOVWF EEADR
	MOVF 0x19,W
	MOVWF EEDATA
	BSF STATUS,RP0
	BSF EECON1,WREN
	MOVLW 0x55
	MOVWF EECON2
	MOVLW 0xAA
	MOVWF EECON2
	BSF EECON1,WR
L0004:	BTFSC EECON1,WR
	GOTO L0004
	BCF EECON1,WREN
	BCF EECON1,EEIF
	BCF STATUS,RP0
; 7: Next a
	MOVLW 0x01
	ADDWF 0x18,F
	BTFSS STATUS,C
	GOTO L0002
L0003:	MOVLW 0x1F
	ANDWF STATUS,F
; End of program
L0005:	GOTO L0005
; End of listing
	END
