	ORG	0		;DIRECTIVA Origen del programa
	bsf	STATUS,5	;CAMBIO DE BANCO para configurar el Micro
	clrf	TRISA		;Todo en 0(8 bit)
	clrf	TRISB		;Todo en 0(8 bit)
	bsf	PORTA,0		;RA0 EN 0
	bsf	PORTA,1		;RA1 EN 0
	bsf	PORTA,2		;RA2 EN 0
	bsf	PORTA,3		;RA3 EN 1
	
	
	bcf	PORTB,0		;LED 0
	bcf	PORTB,1		;LED 1
	bcf	PORTB,2		;LED 2
	bcf	PORTB,3		;LED 3
	bcf	PORTB,4		;LED 4
	bcf	PORTB,5		;LED 5
	bcf	PORTB,6		;LED 6
	bcf	PORTB,7		;LED 7
	bcf	STATUS,5	;CAMBIO DE BANCO
	clrf	PORTA		;TODO EN 0 
	clrf	PORTB		;TODO EN 0

	goto	inicio	

inicio 	btfss	PORTA,0
	goto	ZC		;no	
	goto	ZX		;si

ZC	bcf	PORTB,0		;LED = 0
	bcf	PORTB,2		;LED = 0
	bcf	PORTB,4		;LED = 0
	bcf	PORTB,6		;LED = 0
	bcf	PORTB,1		;LED = 0
	bcf	PORTB,3		;LED = 0
	bcf	PORTB,5		;LED = 0
	bcf	PORTB,7		;LED = 0
	goto	inicio2

ZX	btfss	PORTA,2
	goto	NN		;no
	goto	NM		;si
	
NN	goto	ZH		;pregunta PORTA,0

NM	btfss	PORTA,3	
	goto	NH		;no
	goto	NB		;si

NH	bcf	PORTB,0		;LED = 0
	bcf	PORTB,2		;LED = 0
	bcf	PORTB,4		;LED = 0
	bcf	PORTB,6		;LED = 0
	bcf	PORTB,1		;LED = 0
	bcf	PORTB,3		;LED = 0
	bcf	PORTB,5		;LED = 0
	bcf	PORTB,7		;LED = 0
	goto	inicio

NB	bcf	PORTB,0		;LED = O
	bcf	PORTB,1		;LED = 0
	bsf	PORTB,2		;LED = 1
	bsf	PORTB,3		;LED = 1
	bsf	PORTB,4		;LED = 1
	bsf	PORTB,5		;LED = 1
	bcf	PORTB,6		;LED = 0
	bcf	PORTB,7		;LED = 0
	goto	inicio


ZH	btfss	PORTA,3		;inicio
	goto	QR		;no
	goto	QW		;si

QW	bsf	PORTB,0		;LED = 1
	bsf	PORTB,2		;LED = 1
	bsf	PORTB,4		;LED = 1
	bsf	PORTB,6		;LED = 1
	bcf	PORTB,1		;LED = 0
	bcf	PORTB,3		;LED = 0
	bcf	PORTB,5		;LED = 0
	bcf	PORTB,7		;LED = 0
	goto	inicio

QR	bcf	PORTB,0		;LED = 0
	bcf	PORTB,2		;LED = 0
	bcf	PORTB,4		;LED = 0
	bcf	PORTB,6		;LED = 0
	bcf	PORTB,1		;LED = 0
	bcf	PORTB,3		;LED = 0
	bcf	PORTB,5		;LED = 0
	bcf	PORTB,7		;LED = 0
	goto	inicio

inicio2	btfss	PORTA,1
	goto	DE		;no
	goto	FR		;si

DE	bcf	PORTB,0		;LED = 0
	bcf	PORTB,1		;LED = 0
	bcf	PORTB,2		;LED = 0
	bcf	PORTB,3		;LED = 0
	bcf	PORTB,4		;LED = 0
	bcf	PORTB,5		;LED = 0
	bcf	PORTB,6		;LED = 0
	bcf	PORTB,7		;LED = 0
	goto	inicio3

FR	btfss	PORTA,3
	goto	QE		;no
	goto	QX		;si


QE	bcf	PORTB,0		;LED = 0
	bcf	PORTB,1		;LED = 0
	bcf	PORTB,2		;LED = 0
	bcf	PORTB,3		;LED = 0
	bcf	PORTB,4		;LED = 0
	bcf	PORTB,5		;LED = 0
	bcf	PORTB,6		;LED = 0
	bcf	PORTB,7		;LED = 0
	goto	inicio2

QX	bsf	PORTB,0		;LED = 1
	bcf	PORTB,1		;LED = 0
	bcf	PORTB,2		;LED = 0
	bcf	PORTB,3		;LED = 0
	bcf	PORTB,4		;LED = 0
	bcf	PORTB,5		;LED = 0
	bcf	PORTB,6		;LED = 0
	bsf	PORTB,7		;LED = 1
	goto	inicio2


inicio3	btfss	PORTA,2
	goto	TY		;no
	goto	FI		;si  

FI	btfss	PORTA,0		;PREGUNTO
	goto	GP		;no	
	goto	MP		;si

GP	goto	FV
MP	btfss	PORTA,3
	goto	PUT
	goto	TRO
	
PUT	bcf	PORTB,0		;LED = 0
	bcf	PORTB,1		;LED = 0
	bcf	PORTB,2		;LED = 0
	bcf	PORTB,3		;LED = 0
	bcf	PORTB,4		;LED = 0
	bcf	PORTB,5		;LED = 0
	bcf	PORTB,6		;LED = 0
	bcf	PORTB,7		;LED = 0
	goto 	inicio3

TRO	bcf	PORTB,0		;LED = O
	bcf	PORTB,1		;LED = 0
	bsf	PORTB,2		;LED = 1
	bsf	PORTB,3		;LED = 1
	bsf	PORTB,4		;LED = 1
	bsf	PORTB,5		;LED = 1
	bcf	PORTB,6		;LED = 0
	bcf	PORTB,7		;LED = 0
	goto	inicio3			


FV	btfss	PORTA,3
	goto	QB		;no
	goto	QA		;si

TY	bcf	PORTB,0		;LED = 0
	bcf	PORTB,1		;LED = 0
	bcf	PORTB,2		;LED = 0
	bcf	PORTB,3		;LED = 0
	bcf	PORTB,4		;LED = 0
	bcf	PORTB,5		;LED = 0
	bcf	PORTB,6		;LED = 0
	bcf	PORTB,7		;LED = 0
	goto	inicio

QA	bsf	PORTB,0		;LED = 1
	bsf	PORTB,1		;LED = 1
	bcf	PORTB,2		;LED = 0
	bcf	PORTB,3		;LED = 0
	bcf	PORTB,4		;LED = 0
	bcf	PORTB,5		;LED = 0
	bsf	PORTB,6		;LED = 1
	bsf	PORTB,7		;LED = 1
	goto	inicio3

QB	bcf	PORTB,0		;LED = 0
	bcf	PORTB,1		;LED = 0
	bcf	PORTB,2		;LED = 0
	bcf	PORTB,3		;LED = 0
	bcf	PORTB,4		;LED = 0
	bcf	PORTB,5		;LED = 0
	bcf	PORTB,6		;LED = 0
	bcf	PORTB,7		;LED = 0
	goto	inicio3







