	ORG	0		;DIRECTIVA Origen del programa
	bsf	STATUS,5	;CAMBIO DE BANCO para configurar el Micro
	clrf	TRISA		;Todo en 0(8 bit)
	clrf	TRISB		;Todo en 0(8 bit)
	bcf	PORTA,0		;bit 0 de PORTA = in
	bsf	PORTB,7		;bit 7 de PORTB = out LED
	clrf	PORTA		;Asegurar que ARRANCA en 0
	clrf	PORTB		;asegurar que arranca en 0
	bcf	STATUS,5	;CAMBIO DE BANCO para TRABAJAR el Micro
INICIO	btfss	PORTB,7		;Pulsador = 1
	goto	APAGAR	
	goto	prender

APAGAR	bcf	PORTA,0		;Pulsador sin presionar
	goto	INICIO	

PRENDER	bsf	PORTA,0		;Pulsador presionado
	goto	INICIO	

	END			
