	ORG	0		;DIRECTIVA Origen del programa
	bsf	STATUS,5	;CAMBIO DE BANCO para configurar el Micro
	clrf	TRISA		;Todo en 0(8 bit)
	clrf	TRISB		;Todo en 0(8 bit)

	bsf	PORTA,0		;para precionar entradas
	bsf	PORTA,1		;para precionar
	bsf	PORTA,2		;para precionar
	bsf	PORTA,3		;para precionar 
	bsf	PORTA,4		;para precionar 

	bsf	PORTB,6		;para precionar mov
	bsf	PORTB,7		;para precionar	mov

	bcf	PORTB,0		;Salidas
	bcf	PORTB,1
	bcf	PORTB,2
	bsf	PORTB,3		;para precionar 
	bsf	PORTB,4		;para precionar 

	bcf	STATUS,5	;CAMBIO DE BANCO
	clrf	PORTA		;TODO EN 0 
	clrf	PORTB		;TODO EN 0

INICIO	btfss	porta,0		;si precione
	goto	no
	goto	si
si	bsf	portb,0
	btfss	porta,0
	goto	no
	goto	si		;volvemos
no	bcf	portb,0
	goto	no2

no2	btfss	porta,1		;si precione
	goto	no1
	goto	si1

si1	bsf	PORTB,1
	btfss	porta,1
	goto	no1
	goto	si1		;volvemos

no1	bcf	PORTB,1
	goto	inicio
end	