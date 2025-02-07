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
	movlw	.1
	movwf	1BH		;Permanentes
	movlw	.2
	movwf	1CH		;Permanentes
	movlw	.3
	movwf	3AH		;Permanentes
	movlw	.4
	movwf	3BH		;Permanentes
	movlw	.5
	movwf	4AH		;Permanentes
	movlw	.6
	movwf	4BH		;Permanentes
	movlw	.7
	movwf	4CH		;Permanentes

	movlw	.2
	movwf	1AH		;el que varia	
	movlw	.1
	movwf	2AH

	movlw	.4		;inicial	DEMORA
	movwf	1DH
	movlw	.61		;;inicial	TMR0
	movwf	2CH
	

inicio	btfss	porta,0
	goto	inicio		;NO
	goto	traba		;SI

traba	bsf	portb,5
	btfsc	porta,0
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
	goto	inicix

sopo	movfw	1BH		;vale 1
	subwf	2AH,W		;variable	1 - 1 = 0
	btfss	status,2	; Z = 1
	goto	gogo		;no ( porque varia con ra1, que nos da z=0) IZQUIERAA
	goto	gege		;si ( porque quedo 0) DERECHA

gogo
	bsf	portb,6
	bcf	portb,7
	bcf	portb,1
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
	goto	lono
	goto	li7
lono	btfss	porta,2
	goto	lono2
	goto	kiss

lono2	btfss	porta,3
	goto	lono3
	goto	kiss2

lono3	btfss	porta,1
	goto	gogo		;no
	movlw	.1		
	movwf	2AH
	goto	cambio

li7	bcf	portb,1
	bcf	portb,2
	bcf	portb,3
	bcf	portb,4
	bcf	portb,5
	bcf	portb,6
	bcf	portb,7
	movlw	.2
	movwf	2AH
poti	btfsc	porta,0
	goto	poti
	goto	inicio

gege
	bcf	portb,6
	bsf	portb,7

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
	goto	noko
	goto	li8		;quiero apagar	

li8	bcf	portb,1
	bcf	portb,2
	bcf	portb,3
	bcf	portb,4
	bcf	portb,5
	bcf	portb,6
	bcf	portb,7
	movlw	.1
	movwf	2AH
yu	btfsc	porta,0 
	goto	yu
	goto	inicio

noko	btfss	porta,2
	goto	noko1
	goto	kiss
noko1	btfss	porta,3
	goto	noko2
	goto	kiss2
noko2	btfss	porta,1
	goto	gege
	movlw	.2		;Derecha
	movwf	2AH
	goto	cambio


kiss	btfsc	porta,2
	goto	kiss
	goto	empiesa

empiesa	movfw	1CH		;.2	10
	subwf	1AH,W
	btfss	status,2
	goto	no2
	incf	1AH,F
	movlw	.2		;inicial	DEMORA
	movwf	1DH
	movlw	.61		;;inicial	TMR0
	movwf	2CH
	goto	ra3

no2	movfw	3AH		;.3	15
	subwf	1AH,W
	btfss	status,2
	goto	no3
	goto	as
as	incf	1AH,F
	movlw	.2		;inicial	DEMORA
	movwf	1DH
	movlw	.126		;;inicial	TMR0
	movwf	2CH
	goto	ra3

no3	movfw	3BH		;.4	20
	subwf	1AH,W
	btfss	status,2
	goto	no4
	goto	ad
ad	incf	1AH,F
	movlw	.1		;inicial	DEMORA
	movwf	1DH
	movlw	.61		;;inicial	TMR0
	movwf	2CH
	goto	ra3

no4	movfw	4AH		;.5	25
	subwf	1AH,W
	btfss	status,2
	goto	no5
	goto	af
af	incf	1AH,F
	movlw	.1		;inicial	DEMORA
	movwf	1DH
	movlw	.100		;;inicial	TMR0
	movwf	2CH
	goto	ra3

no5	movfw	4BH		;.6	30
	subwf	1AH,W
	btfss	status,2
	goto	gh		;no
	goto	ag		;si
ag	incf	1AH,F
	movlw	.1		;inicial	DEMORA
	movwf	1DH
	movlw	.126		;;inicial	TMR0
	movwf	2CH
	goto	ra3		;FIN

gh	movfw	4CH		;.7	35
	subwf	1AH,W
	btfss	status,2
	goto	inicix
	incf	1AH,F
	movlw	.1		;inicial	DEMORA
	movwf	1DH
	movlw	.145		;;inicial	TMR0
	movwf	2CH
	goto	ra3		;FIN


kiss2	btfsc	porta,3
	goto	kiss2
	goto	empies2		;EMPIESA 2

empies2	
nope1	movfw	4BH		;.6	30p
	subwf	1AH,W
	btfss	status,2
	goto	nope2
	goto	sepe2
sepe2	decf	1AH,F
	movlw	.1		;inicial	DEMORA
	movwf	1DH
	movlw	.126		;;inicial	TMR0
	movwf	2CH
	GOTO	inicix

nope2	movfw	4AH		;.5	25p
	subwf	1AH,W
	btfss	status,2
	goto	nope3
	goto	sepe3
sepe3	decf	1AH,F
	movlw	.1		;inicial	DEMORA
	movwf	1DH
	movlw	.100		;;inicial	TMR0
	movwf	2CH
	GOTO	inicix

nope3	movfw	3BH		;.4	20p
	SUBWF	1AH,W
	BTFSS	status,2
	GOTO	nope4
	goto	sepe4
sepe4	DECF	1AH,F
	movlw	.1		;inicial	DEMORA
	movwf	1DH
	movlw	.61		;;inicial	TMR0
	movwf	2CH
	GOTO	ra2

nope4	movfw	3AH		;.3	15p
	SUBWF	1AH,W
	BTFSS	status,2
	GOTO	nope5
	goto	sepe5
sepe5	DECF	1AH,F
	movlw	.2		;inicial	DEMORA
	movwf	1DH
	movlw	.126		;;inicial	TMR0
	movwf	2CH
	GOTO	ra2

nope5	movfw	1CH		;.2	10
	subwf	1AH,W
	btfss	status,2
	goto	nope7
	decf	1AH,F
	movlw	.2		;inicial	DEMORA
	movwf	1DH
	movlw	.61		;;inicial	TMR0
	movwf	2CH
	GOTO	ra2	

nope7	movfw	1BH		;.2	10
	subwf	1AH,W
	btfss	status,2
	goto	ra2
	decf	1AH,F
	movlw	.4		;inicial	DEMORA
	movwf	1DH
	movlw	.61		;;inicial	TMR0
	movwf	2CH
	GOTO	ra2		
	


demora	clrf	TMR0		;TMR0=0
	movfw	1DH		;variable (TENGO .50)
	movwf	3DH		;permanente
pipa	bcf	intcon,2
	movfw	2CH		;variable (TENGO .50)
	movwf	TMR0		;Permanente
no	btfss	intcon,2
	goto	no
	goto	si9
si9	decfsz	3DH,F
	goto	pipa
	return
	
