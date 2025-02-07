	ORG	0		;DIRECTIVA Origen del programa
	bsf	STATUS,5	;CAMBIO DE BANCO para configurar el Micro
	clrf	TRISA		;Todo en 0(8 bit)
	clrf	TRISB		;Todo en 0(8 bit)
	bcf	PORTA,0		;bit = in lED 0 
	bsf	PORTA,1		;bit = in led 1
	bsf	PORTA,2

	bcf	PORTB,0		
	bcf	PORTB,1		
	bcf	PORTB,2			
	bcf	PORTB,3		
	bcf	PORTB,4		
	bcf	PORTB,5		
	bcf	PORTB,6		
	bcf	PORTB,7		;

	bcf	STATUS,5	;CAMBIO DE BANCO para TRABAJAR el Micro
	clrf	PORTA		;Todo en 0(8 bit)
	clrf	PORTB		;Todo en 0(8 bit)

	

inicio	bsf	PORTA,0		;+V PARA EL SENSOR
	bsf	PORTB,0
	bsf	PORTB,1
	bsf	PORTB,2		;principio del movimiento del robot
	bcf	PORTB,3
	bsf	PORTB,4
	bcf	PORTB,5

	btfss	PORTA,1	
	goto	inicio2		;NO
	goto	AA		;SI
	
inicio2	btfss	PORTA,2
	goto	inicio
	goto	AS

AA	bcf	PORTB,2		;PORTA,1 = Sensor 1 fue tocado Para Atras
	bsf	PORTB,3
	bcf	PORTB,4
	bsf	PORTB,5
	call	DEMORA
	bsf	PORTB,2		;MOTOR1 DOBLA
	bcf	PORTB,3
	bcf	PORTB,4		;MOTOR2 APAGADO
	bcf	PORTB,5
	call	DEMORA
	bsf	PORTB,4
	bcf	PORTB,5
	goto	inicio

AS	bcf	PORTB,4		;Para Atras Sensor 2 tocado
	bsf	PORTB,5
	bcf	PORTB,2
	bsf	PORTB,3
	call	DEMORA
	bcf	PORTB,2
	bcf	PORTB,3
	bsf	PORTB,4
	bcf	PORTB,5
	call	DEMORA
	bsf	PORTB,2
	bcf	PORTB,3
	goto	inicio
	
	
DEMORA	clrf 	1AH		;LIMPIAMOS
	clrf	1BH		;Limpiamos
	clrf	2AH		;LIMPIAMOS
	MOVLW	.16		;LOS SEGUNDOS X LITERAL
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
