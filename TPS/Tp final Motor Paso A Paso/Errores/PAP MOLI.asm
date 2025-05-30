	org	0
	bsf	status,5
	clrf	trisa
	clrf	trisb
	movlw	b'1000111'
	movwf	option
	bsf	porta,0
	bsf	porta,1
	bsf	porta,2
	bsf	porta,3
	bcf	PORTB,0
	bcf	PORTB,1
	bcf	PORTB,2
	bcf	PORTB,3
	bcf	PORTB,4
	bcf	PORTB,5
	bcf	PORTB,6
	bcf	PORTB,7
	bcf	status,5
	clrf	PORTA
	clrf	PORTB
	MOVLW	.1
	MOVWF	1BH		;Permanentes
	MOVLW	.2
	MOVWF	1CH		;Permanentes
	MOVLW	.3
	MOVWF	3AH		;Permanentes
	MOVLW	.4
	MOVWF	3BH		;Permanentes
	MOVLW	.5
	MOVWF	4AH		;Permanentes
	MOVLW	.6
	MOVWF	4BH		;Permanentes
	MOVLW	.7
	MOVWF	4CH		;Permanentes

	MOVLW	.1
	MOVWF	1AH		;el que varia	
	movlw	.1
	movwf	2AH

inicio	btfss	porta,0
	goto	inicio		;NO
	goto	traba		;SI

traba	btfsc	porta,0
	goto	traba		;NO SOLTO
	goto	inicix		;SI SOLTO
	
inicix	
ra2	btfss	porta,2
	goto	ra3		;no
	goto	kiss		;si

ra3	btfss	porta,3
	goto	ra1		;no
	goto	kiss2		;si
	
ra1	btfss	porta,1
	goto	sopo		;NO (hiva noo4)
	goto	cambio		;si

cambio	btfsc	porta,1
	goto	cambio
	incf	2AH,F
	goto	inicix

sopo	movfw	1BH		;vale 1
	subwf	2AH,W		;variable
	btfss	status,2
	goto	gogo		;no ( porque varia con ra1, que nos da z=0)
	goto	gege		;si ( porque quedo 0)
gege	
	bsf	portb,1
	bsf	portb,2
	bcf	portb,3
	bcf	portb,4
	call	demora
	bsf	portb,1
	bcf	portb,2
	bcf	portb,3
	bsf	portb,4
	call	demora
	bcf	portb,1
	bcf	portb,2
	bsf	portb,3
	bsf	portb,4
	call	demora
	bcf	portb,1
	bsf	portb,2
	bsf	portb,3
	bcf	portb,4
	call 	demora
				;preguntando
	btfss	porta,0		
	goto	noo4
	goto	si6		;quiero apagar	
si6	bcf	portb,1
	bcf	portb,2
	bcf	portb,3
	bcf	portb,4
	btfsc	porta,0 
	goto	si6
	goto	inicio
	
	


kiss	btfsc	porta,2
	goto	kiss
	goto	empiesa
	
empiesa	movfw	1BH		;.1
	subwf	1AH,W
	btfss	status,2
	goto	no1
	goto	aa
aa	incf	1AH,F
	goto	ra3		;no

no1	movfw	1CH		;.2
	subwf	1AH,W
	btfss	status,2
	goto	no2
	incf	1AH,F
	goto	ra3

no2	movfw	3AH		;.3
	subwf	1AH,W
	btfss	status,2
	goto	no3
	goto	as
as	incf	1AH,F
	goto	ra3

no3	movfw	3BH		;.4
	subwf	1AH,W
	btfss	status,2
	goto	no4
	goto	ad
ad	incf	1AH,F
	goto	ra3

no4	movfw	4AH		;.5
	subwf	1AH,W
	btfss	status,2
	goto	no5
	goto	af
af	incf	1AH,F
	goto	ra3

no5	movfw	4BH		;.6
	subwf	1AH,W
	btfss	status,2
	goto	inicix
	goto	ag
ag	incf	1AH,F
	goto	ra3		;FIN


kiss2	btfsc	porta,3
	goto	kiss2
	goto	empies2		;EMPIESA 2
empies2	movfw	4CH		;.7
	subwf	1AH,W
	btfss	status,2
	goto	nope1
	goto	sepe1
sepe1	decf	1AH,F
	goto	inicix

nope1	movfw	4BH		;.6
	SUBWF	1AH,W
	BTFSS	status,2
	GOTO	nope2
	goto	sepe2
sepe2	decf	1AH,F
	GOTO	inicix

nope2	movfw	4AH		;.5
	SUBWF	1AH,W
	BTFSS	status,2
	GOTO	nope3
	goto	sepe3
sepe3	DECF	1AH,F
	GOTO	inicix

nope3	movfw	3BH		;.4
	SUBWF	1AH,W
	BTFSS	status,2
	GOTO	nope4
	goto	sepe4
sepe4	DECF	1AH,F
	GOTO	inicix

nope4	movfw	3AH		;.3
	SUBWF	1AH,W
	BTFSS	status,2
	GOTO	nope5
	goto	sepe5
sepe5	DECF	1AH,F
	GOTO	inicix

nope5	movfw	1CH		;.2
	SUBWF	1AH,W
	BTFSS	status,2
	GOTO	inicix
	DECF	1AH,F
	GOTO	ra2		;FIIN


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
	
