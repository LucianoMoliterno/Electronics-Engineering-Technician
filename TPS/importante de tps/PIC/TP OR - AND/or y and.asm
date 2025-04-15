	ORG	0		;DIRECTIVA Origen del programa
	bsf	STATUS,5	;CAMBIO DE BANCO para configurar el Micro
	clrf	TRISA		;Todo en 0(8 bit)
	clrf	TRISB		;Todo en 0(8 bit)
	bsf	PORTA,0		;Logica A = OR
	bsf	PORTA,1		;Logica B = AND
	bsf	PORTB,6		;EMPIESA EN 0
	bsf	PORTB,5		;EMPIESA EN 0

	bcf	PORTB,0		;LED
	bcf	STATUS,5	;CAMBIO DE BANCO
	clrf	PORTA		;TODO EN 0 
	clrf	PORTB		;TODO EN 0

	goto	inicio

inicio	btfss	PORTA,1		;PREGUNTO SI ES 1
	goto	AE		;no
	goto	BE		;zi

AE	bcf	PORTB,0		;APAGA
	goto	inicio1

BE	btfss	PORTB,6		;PREGUNTO OR
	goto	PE		;no	
	goto	PO		;zi

PO	bsf	PORTB,0		;PRENDE
	goto	inicio

PE	btfss	PORTB,5		;PREGUNTO AND
	goto	FE		;i
	goto	FA		;no
FE	bcf	PORTB,0
	goto	inicio

FA	btfss	PORTA,0
	goto	WA	
	goto	WE
WA	bcf	PORTB,0		;APAGO
	goto	inicio

WE	bsf	PORTB,0		;PRENDE
	goto	inicio


inicio1	btfss	PORTA,0		;PREGUNTO SI ES 1
	goto	OE
	goto	OA

OE	bcf	PORTB,0		;APAGA
	goto 	inicio2

OA	btfss	PORTB,6		;PREGUNTO
	goto	OL		;i
	goto	OK		;no

OK	bsf	PORTB,0		;PRENDE
	goto	inicio2

OL	bcf	PORTB,0		;APAGA
	goto	inicio2
	goto	VA

VA	bsf	PORTB,0		;PRENDE
	goto	inicio2

inicio2	btfss	PORTA,0		;PREGUNTO SI ES 1
	goto	JE
	goto	JA

JE	bcf	PORTB,0		;APAGA
	goto	inicio3

JA	btfss	PORTB,6		;PREGUNTO POR OR
	goto	HE
	goto	HA

HE	bcf	PORTB,0		;APAGO
	goto	inicio3
HA	bsf	PORTB,0		;PRENDE
	goto	inicio2

Inicio3	btfss	PORTA,1		
	goto	GA
	goto	GE

GA	bcf	PORTB,0
	goto	inicio

GE	btfss	PORTB,6
	goto	YE
	goto	YA

YA	bsf	PORTB,0
	goto	inicio3
YE	bcf	PORTB,0	
	goto	inicio
end