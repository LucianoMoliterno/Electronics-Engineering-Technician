	ORG   0      	;DIRECTIVA Origen del programa
	bsf   STATUS,5   ;CAMBIO DE BANCO para configurar el Micro
	clrf   TRISA      ;Todo en 0(8 bit)
	clrf   TRISB      ;Todo en 0(8 bit)
	movlw   b'1000111'
	movwf   option
	         
	bsf   PORTA,0      ;para precionar entradas
	bsf   PORTA,1      ;para precionar
	bsf   PORTA,2      ;para precionar
	bsf   PORTA,3      ;para precionar 
	bsf   PORTA,4      ;para precionar 
         
	bcf   PORTB,0      ;Salidas
	bcf   PORTB,1
	bcf   PORTB,2
	bcf   PORTB,3
	bcf   PORTB,4
	;comandos para la Funcion velocidad
	movlw   .1
	movwf   2ah
	movlw   .2
	movwf   2bh
	movlw   .3
	movwf   2ch
	movlw   .4
	movwf   2dh
	movlw   .5
	movwf   2eh
	;cierro el terminal de datos
	bcf   STATUS,5		;CAMBIO DE BANCO
	clrf   PORTA      	;TODO EN 0 
	clrf   PORTB      	;TODO EN 0
inicio	btfss	porta,0
	goto	inicio
	bsf	portb,0		;si me da si
	call	demora1
w1	btfsc	porta,0
	goto	no
	goto	si

si	movlw	.1
	subwf	49h,f
	btfss	status,2
	goto	si
	goto	si2
si2	bcf	portb,0
	goto	inicio

no	movlw	.1
	addwf	49h,f
	goto	w1
	


demora1	clrf   TMR0      	;limpiando timer, hacer de 50 mseg
	movlw   d'255'      	;Seria .61
	movwf   TMR0      	;TMRO=178
N	btfss   intcon,2
	goto   N
	bcf   intcon,2
	return

	          