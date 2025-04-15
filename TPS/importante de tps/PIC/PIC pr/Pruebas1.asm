	ORG	0		;DIRECTIVA Origen del programa
	bsf	STATUS,5	;CAMBIO DE BANCO para configurar el Micro
	clrf	TRISA		;Todo en 0(8 bit)
	clrf	TRISB		;Todo en 0(8 bit)
	bsf	PORTA,0		;bit 0 de PORTA = in
	bcf	PORTB,7		;bit 7 de PORTB = out LED
	bcf	STATUS,5	;CAMBIO DE BANCO para TRABAJAR el Micro
	clrf	PORTA		;Asegurar que ARRANCA en 0
	clrf	PORTB
INICIO	btfss	PORTA,0		; ? EL BIT 0 = 1?? PULSADOR
	goto	APAGAR	
	goto	prender

APAGAR	bcf	PORTB,7		;BIT 7 DE porb =0
	goto	INICIO	

PRENDER	bsf	PORTB,7	
	goto	INICIO	

	END			;DIRECTIVA de final de grabacion	
	


