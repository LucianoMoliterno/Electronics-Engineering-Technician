	ORG	0
	bsf	STATUS,5
	clrf	TRISA
	clrf	TRISB
	bsf	PORTB,0
	bsf	PORTB,1
	bsf	PORTB,2
	bsf	PORTB,3
	bsf	PORTB,6
	bsf	PORTB,7
	bcf	PORTA,0
	bcf	PORTA,1
	bcf	PORTA,2
	bcf	PORTA,3
	bcf	STATUS,5
	clrf	TRISA
	clrf	TRISB
inicio	btfss	PORTB,7
	goto	no
	goto	si
si	movfw	PORTB
	movwf	1Ah
	goto	no
no	btfss	PORTB,6
	goto	no2
	goto	si2
si2	movfw	1ah
	movwf	PORTA
	goto	no2
no2	goto	inicio