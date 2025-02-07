	ORG	0		;DIRECTIVA Origen del programa
	bsf	STATUS,5	;CAMBIO DE BANCO para configurar el Micro
	clrf	TRISA		;Todo en 0(8 bit)
	clrf	TRISB		;Todo en 0(8 bit)
	bsf	PORTA,0		;bit = in lED 1 
	bsf	PORTA,1		;bit = in led 3

	bcf	PORTB,1		;BIT = out LED 1
	bcf	PORTB,3		;BIT = out led 3L

	bcf	STATUS,5	;CAMBIO DE BANCO para TRABAJAR el Micro
	clrf	PORTA		;Todo en 0(8 bit)
	clrf	PORTB		;Todo en 0(8 bit)

INICIO	btfss	PORTA,0		; ? EL BIT 0 = 1?? PULSADOR
	goto	APAGAR	
	goto	PRENDER

inici	btfss	PORTA,1
	goto	apaga
	goto	prende

APAGAR	bcf	PORTB,1		;Pulsador sin presionar
	goto	inici

PRENDER	bsf	PORTB,1		;Pulsador precionado
	goto	inici	

apaga	bcf	PORTB,3		;Pulsador sin presionar
	goto 	INICIO
	
	
prende	bsf	PORTB,3		;Pulsador precionado
	goto	INICIO
	
	END			;DIRECTIVA de final de grabacion	
	


