	ORG	0		;DIRECTIVA Origen del programa
	bsf	STATUS,5	;CAMBIO DE BANCO para configurar el Micro
	clrf	TRISA		;Todo en 0(8 bit)
	clrf	TRISB		;Todo en 0(8 bit)
	bsf	PORTA,0		;asciende

	bcf	PORTB,0
	bcf	PORTB,1
	bcf	PORTB,2
	bcf	PORTB,3
	bcf	PORTB,4
	bcf	PORTB,5
	bcf	PORTB,6
	bcf	PORTB,7

	bcf	STATUS,5	;CAMBIO DE BANCO
	clrf	PORTA		;TODO EN 0 
	clrf	PORTB		;TODO EN 0

inicio	btfss	PORTA,0		;INICIATIVA
	goto	inicio		;NO
	goto	SI2		;SI

SI2	call	DEMORA		;VAMOS A DEMORA
Si	incf	PORTB,F
	goto	suelta

suelta	btfss	PORTA,0
	goto	inicio
	goto	suelta		;Fin

DEMORA	clrf 	1AH		;LIMPIAMOS
	clrf	1BH		;Limpiamos
	clrf	2AH		;LIMPIAMOS
	MOVLW	.4		;LOS SEGUNDOS X LITERAL
	MOVWF	2AH
NOPE2	MOVLW	.255		;NOPE2 CON NOPE FORMAN LOS SEGUNDOS
	MOVWF	1BH	
Nope	MOVLW	.255		;NOPE2 CON NOPE FORMAN LOS SEGUNDOS
	MOVWF	1AH		;LO PONEMOS HAY	
	
NO	DECFSZ	1AH,F		;DECRECEMOS
	goto	NO		;SIGUE DECRECIENDO
	goto	pepe		;TERMINO

pepe	DECFSZ	1BH,F
	goto	Nope
	goto	PEPE2

PEPE2	DECFSZ	2AH,F
	goto	NOPE2
	goto	AI
	

AI	RETURN			;VOLVEMOS

	

