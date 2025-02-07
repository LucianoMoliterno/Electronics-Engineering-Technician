	ORG	0
	bsf	status,5
	clrf	trisb
	movlw	b'10000111'
	movwf	option
	bsf	porta,4
	bsf	portb,7

	bsf	porta,0
	bsf	porta,1
	bsf	porta,2
	bsf	porta,3
	
	bcf	status,5
	clrf	porta
	clrf	portb
inicio	btfss	porta,4
	goto	no
	goto	si
si	call	demora2
	btfss	porta,4
	goto	inicio
	goto	jk
jk	btfss	porta,3		;SI esta el 8
	goto	funcion
	goto	si2

funcion	movfw	porta		;NO2
	movwf	1ah
	movfw	1ah
	movwf	portb
	bcf	portb,4
	goto	suelta
suelta	btfss	porta,4
	goto	inicio
	goto	suelta
si2	btfss	porta,1		;Si esta el 10
	goto	no3
	goto	si3
si3	goto	suelta
no3	btfss	porta,2
	goto	no4
	goto	si4
si4	goto	suelta
no4	goto	funcion

no	btfss	portb,7
	goto	inicio		;NO
	goto	see

see	goto	z0
z0	call	demora		;ME VOY A DEMORAAAA
	btfss	status,2
	goto	sote
	decf	portb,f	
	btfss	status,2
	goto	note		;no
	goto	sote		;si

note	goto	see
sote	btfss	portb,7
	goto	inicio		;no
	goto	sote		;si

demora2	clrf	TMR0
	movlw	.255
	movwf	TMR0
dece	btfss	intcon,2
	goto	dece
	goto	listo
listo	bcf	intcon,2
	return

demora	clrf	2ah
	clrf	1bh
	movfw	1bh
	movlw	.100
	movwf	2ah
	movlw	.200
aw	decfsz	2ah,f
	goto	aw
	decfsz	1bh,f
	goto	aw
	return

	

	






	