	org	0
	bsf	status,5
	bsf	porta,0
	bsf	porta,1
	bsf	porta,2
	bsf	porta,3

	clrf	trisb
	movlw	b'1000111'
	movwf	option
	bcf	status,5
inicio	btfss	porta,0
	goto	inicio
	goto	inicix1

inicix1	clrf	TMR0	;TMR0=0
	movlw	.55	;61 es igual a 250useg
	movwf	TMR0	;TMRO=178

traba	btfsc	porta,0
	goto	traba
	goto	inicix
	
inicix	btfss	porta,2
	goto	no2
	goto	inicix
no2	btfss	porta,3
	goto	no3
	goto	inicix
no3	btfss	porta,1
	goto	inicix
	goto	no4

no4	bcf	portb,1
	bcf	portb,2
	bsf	portb,3
	bsf	portb,4
	call	demora
	bsf	portb,1
	bcf	portb,2
	bcf	portb,3
	bsf	portb,4
	call	demora
	bsf	portb,1
	bsf	portb,2
	bcf	portb,3
	bcf	portb,4
	call	demora
	bcf	portb,1
	bsf	portb,2
	bsf	portb,3
	bcf	portb,4
	call 	demora
	btfss	porta,0
	goto	no4
	goto	si6

si6	bcf	portb,1
	bcf	portb,2
	bcf	portb,3
	bcf	portb,4
	btfsc	porta,0
	goto	si6
	goto	inicio

demora	clrf	1AH
	clrf	TMR0	;TMR0=0
	movlw	.4
	movwf	1AH
pipa	bcf	intcon,2
	movlw	.50
	movwf	TMR0	;TMRO=178
no	btfss	intcon,2
	goto	no
	goto	si9
si9	decfsz	1AH,F
	goto	pipa
	return
	
