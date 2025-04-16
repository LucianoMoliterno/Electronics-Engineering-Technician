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
	bcf   STATUS,5   ;CAMBIO DE BANCO
   	movlw	.7
	movwf	CMCON
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
	;configuraciones de los colores a prender
	bsf   portb,0      ;Verde prende
	movfw   portb
	movwf   3ah
	clrf   PORTB      ;TODO EN 0 
	bsf   portb,1      ;Amarillo prende
	movfw   portb
	movwf   3bh
	clrf   PORTB      ;TODO EN 0          
	bsf   portb,2      ;Azul prende
	movfw   portb
	movwf   3ch
	clrf   PORTB      ;TODO EN 0           
	bsf   portb,3      ;Rojo prende
	movfw   portb
	movwf   3dh
	clrf   PORTB      ;TODO EN 0
	bsf   portb,4      ;Blanco prende
	movfw   portb
	movwf   3eh
	clrf   PORTB      ;TODO EN 0
	;cierro el terminal de datos
	clrf   PORTA      ;TODO EN 0 
	clrf   PORTB      ;TODO EN 0	
;--------------------------------------------------------          	            	        
inicio  btfss   porta,0		;Empesando con el sistema de velocidades, a elegir velocidad por colores
	goto   NO      		;Sigue preguntando por los otros      
	call   demora1      	;Si es si va por una velocidad de 1 segundo
no1     btfsc   porta,0      	;Pregunto si solto el boton.
	goto   no1      	;pregunto cuando lo suelto
	movlw   .1      	;pongo .1 para indentificar la velocidades en la funcion de velocidad
	movwf   1AH      	;variable entre .1 a .5
	goto   F1      		;Funcion velocidad
	;Segunda pregunta de velocidad----------------------------------------------------------------    
NO      btfss    porta,1      ;pregunto por la segunda velocidad de 0,8 seg
	goto   NO2
	CALL   demora1      ;Si es si
NO3     btfsc   porta,1
	goto   NO3      ;pregunto cuando lo suelto
	movlw   .2
	movwf   1AH
	goto   F1      ;Funcion velocidad
	;Tercera pregunta de velocidad-----------------------------------------------
NO2     btfss   porta,2      ;pregunto por la tercera velocidad que es 0,6 seg
	goto   NO4
	call   demora1
no5     btfsc   porta,2
	goto   no5
	movlw   .3
	movwf   1AH
	goto   F1
	;Cuarta pregunta de velocidad------------------------------------------------
NO4     btfss   porta,3      ;pregunto por la tercera velocidad que es 0,5 seg   
	goto   no6
	call    demora1
no7     btfsc   porta,3
	goto   no7
	movlw   .4
	movwf   1AH
	goto   F1
	;Quinta y ultima pregunta de velocidad--------------------------------------      
no6   	btfss   porta,4      ;pregunto por la tercera velocidad que es 0,4 seg
	goto   inicio      ;Me vuelvo para el principio (no se toco nada)
	call    demora1
no8     btfsc   porta,4
	goto   no8
	movlw   .5
	movwf   1AH
	goto   F1	         	
F1      movfw   2AH     	;Fin de la pregunta de velocidades, empiesa el comando de velocidad-------- 
	subwf   1AH,W		;.1 - .1 deberia dar cero si se preciono porta,0
	btfss   status,2   ;Z = 1   el resultado dio cero
	goto   NO9      ;Z no vale 0, pregunto por los otros
	movlw   .20      ;.20 es que repite 20 veses 50mseg, Si el resultado da cero la velocidad es de 1seg
	movwf   30h      ;Donde pongo el dato de .20, variable del timer
	movlw   .61      ;50 mseg
	movwf   31h      ;Donde pongo el dato de .61=50mseg, variable del timer
	goto   juego      ;Empiesa el juego              	
NO9     movfw   2BH    		;comando de velocidad numero 2--------------------------------------------  	
	subwf   1AH,W		;.2 - .1 deberia dar cero si se preciono porta,0
	btfss   status,2   ;Z = 1   el resultado dio cero
	goto   NO10      ;Z no vale 0, pregunto por los otros
	movlw   .14      ;.16 es que repite 16 veses 50mseg, Si el resultado da cero la velocidad es de 0,8seg
	movwf   30h      ;Donde pongo el dato de .16, variable del timer
	movlw   .61      ;50 mseg
	movwf   31h      ;Donde pongo el dato de .61=50mseg, variable del timer
	goto   juego      ;Empiesa el juego   
	;comando de velocidad numero 3-------------------------------------------
NO10    movfw   2CH      ;.3 - .1 deberia dar cero si se preciono porta,0
	subwf   1AH,W
	btfss   status,2   ;Z = 1   el resultado dio cero
	goto   NO11      ;Z no vale 0, pregunto por los otros
	movlw   .10      ;.12 es que repite 12 veses 50mseg, Si el resultado da cero la velocidad es de 0,6seg
	movwf   30h      ;Donde pongo el dato de .12, variable del timer
	movlw   .61      ;50 mseg
	movwf   31h      ;Donde pongo el dato de .61=50mseg, variable del timer
	goto   juego      ;Empiesa el juego        
	;comando de velocidad numero 4-------------------------------------------
NO11    movfw   2DH      ;.4 - .1 deberia dar cero si se preciono porta,0
	subwf   1AH,W
	btfss   status,2   ;Z = 1   el resultado dio cero
	goto   NO12      ;Z no vale 0, pregunto por los otros
	movlw   .8      ;.10 es que repite 10 veses 50mseg, Si el resultado da cero la velocidad es de 0,4seg
	movwf   30h      ;Donde pongo el dato de .10, variable del timer
	movlw   .61      ;50 mseg
	movwf   31h      ;Donde pongo el dato de .61=50mseg, variable del timer
	goto   juego      ;Empiesa el juego           
	;comando de velocidad numero 5-------------------------------------------
NO12    movfw   2EH	;.5 - .1 deberia dar cero si se preciono porta,0
	subwf   1AH,W
	btfss   status,2   ;Z = 1   el resultado dio cero
	goto   inicio      ;Z no vale 0, pregunto por los otros
	movlw   .3      ;.8 es que repite 8 veses 50mseg, Si el resultado da cero la velocidad es de 0,150seg
	movwf   30h      ;Donde pongo el dato de .8, variable del timer
	movlw   .61      ;50 mseg
	movwf   31h      ;Donde pongo el dato de .61=50mseg, variable del timer
	goto   juego      ;Empiesa el juego
        
juego   clrf   	portb    	;EMPIESA EL JUEGO Codigo de muestreo-------------------------------------  
	call	demora2
	bsf   	portb,0      	;Prende el verde
	call   	demorav      	;Demora variable
	bcf   	portb,0      	;apaga el verde
	call	demora2
	bsf	portb,3
	call	demorav
	clrf	portb
	call	demora2	
	movlw   .1
	movwf   4ah
	movlw	.4
	movwf	4bh
	movlw	.2
	movwf	20h	
j1	btfss   porta,0		;Primera pregunta--------------------------------------------------------	
	goto   no13		;si es no me voy a preguntar por los otros puertos
	movlw   .1		;si es si
	movwf   40h		;variable para restar despues
	bsf   portb,0		;Prende el color del puertob,0
      	call   demora1		;Anti rebote de 50mseg
w1	btfsc   porta,0		;primera pregunta aleatoria
	goto	w1
	goto	R1		;es la parte donde se le resta para hacer lo de aleatorio				     	
no13    btfss   porta,1   	;pregunta por el otro pulsador------------------------------------------   
	goto    no14      	;si es no me voy a preguntar por los otros puertos
	movlw   .2      	;si es si
	movwf   40h      	;variable para restar despues
	bsf	portb,1      	;Prende el color del puertob,1
      	call	demora1		;Anti rebote de 50mseg
w2	btfsc   porta,1		;primera pregunta aleatoria
	goto	w2
	goto	R1         	
no14    btfss   porta,2      	;pregunta por el otro pulsador------------------------------------------
	goto   no15      	;si es no me voy a preguntar por los otros puertos
	movlw   .3      	;si es si
	movwf   40h      	;variable para restar despues
	bsf   portb,2      	;Prende el color del puertob,2
     	call   demora1      ;Anti rebote de 50mseg
w3	btfsc   porta,2      ;primera pregunta aleatoria
	goto	w3
	goto	R1	                 		
no15    btfss   porta,3      ;pregunta por el otro pulsador------------------------------------------
	goto   no16      ;si es no me voy a preguntar por los otros puertos
	movlw   .4      ;si es si
	movwf   40h      ;variable para restar despues
	bsf   portb,3      ;Prende el color del puertob,3         
      	call   demora1      ;Anti rebote de 50mseg
w4	btfsc   porta,3      ;primera pregunta aleatoria
	goto	w4
	goto	R1	   	
no16	btfss   porta,4      ;pregunta por el otro pulsador------------------------------------------
	goto    k1      ;si es no me voy a preguntar por los otros puertos
	movlw   .5      ;si es si
	movwf   40h      ;variable para restar despues
	bsf	portb,4      ;Prende el color del puertob,4 
	;Primera pregunta de la funcion aleatoria---------------------------------------------------------
	call   demora1      ;Anti rebote de 50mseg
w5	btfsc   porta,4      ;primera pregunta aleatoria
	goto	w5
	goto	R1	
k1	movlw	.2		;para hacer el tiempo de aleatorio
	addwf	48h,f		;Se le suma .1 al 49h que es una memoria
	movlw	.1		;para hacer el tiempo de aleatorio
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	call	demora3
	goto	j1		
R1	clrf	portb		;Funcion aleatorio de desconteo de 49H------------------------------------------
	movlw	.1		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no22
	movfw	3ah		;mantiene el color adentro (verde)
	movwf	5ch		;lo usara despues para mostrarlo en la segunda fase
	movlw	.1		;el .1 equivale al color
	movwf	4ch		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	pp		;funcion de saber si se preciono bien o no
no22	movlw	.1		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no23
	movfw	3bh		;mantiene el color adentro (verde)
	movwf	5ch		;lo usara despues para mostrarlo en la segunda fase
	movlw	.2		;el .1 equivale al color
	movwf	4ch		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	pp		;funcion de saber si se preciono bien o no	
no23	movlw	.1		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no24
	movfw	3ch		;mantiene el color adentro (verde)
	movwf	5ch		;lo usara despues para mostrarlo en la segunda fase
	movlw	.3		;el .1 equivale al color
	movwf	4ch		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	pp		;funcion de saber si se preciono bien o no
no24	movlw	.1		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no25
	movfw	3dh		;mantiene el color adentro (verde)
	movwf	5ch		;lo usara despues para mostrarlo en la segunda fase
	movlw	.4		;el .1 equivale al color
	movwf	4ch		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	pp		;funcion de saber si se preciono bien o no
no25	movlw	.1		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	R1
	movfw	3eh		;mantiene el color adentro (verde)
	movwf	5ch		;lo usara despues para mostrarlo en la segunda fase
	movlw	.5		;el .1 equivale al color
	movwf	4ch		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	pp		;funcion de saber si se preciono bien o no
pp	;configuraciones de los colores a pren
	bsf   portb,0      ;Verde prende
	movfw   portb
	movwf   3ah
	clrf   PORTB      ;TODO EN 0 
	bsf   portb,1      ;Amarillo prende
	movfw   portb
	movwf   3bh
	clrf   PORTB      ;TODO EN 0          
	bsf   portb,2      ;Azul prende
	movfw   portb
	movwf   3ch
	clrf   PORTB      ;TODO EN 0           
	bsf   portb,3      ;Rojo prende
	movfw   portb
	movwf   3dh
	clrf   PORTB      ;TODO EN 0
	bsf   portb,4      ;Blanco prende
	movfw   portb
	movwf   3eh
	clrf   PORTB      ;TODO EN 0
R2	movlw	.1		;Repite la operacion hasta dar cero
	subwf	48h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no26
	movfw	3ah		;mantiene el color adentro (verde)
	movwf	5dh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.1		;el .1 equivale al color
	movwf	4dh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	p		;funcion de saber si se preciono bien o no
no26	movlw	.1		;Repite la operacion hasta dar cero
	subwf	48h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no27
	movfw	3bh		;mantiene el color adentro (verde)
	movwf	5dh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.2		;el .1 equivale al color
	movwf	4dh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	p		;funcion de saber si se preciono bien o no	
no27	movlw	.1		;Repite la operacion hasta dar cero
	subwf	48h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no28
	movfw	3ch		;mantiene el color adentro (verde)
	movwf	5dh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.3		;el .1 equivale al color
	movwf	4dh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	p		;funcion de saber si se preciono bien o no
no28	movlw	.1		;Repite la operacion hasta dar cero
	subwf	48h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no29
	movfw	3dh		;mantiene el color adentro (verde)
	movwf	5dh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.4		;el .1 equivale al color
	movwf	4dh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	p		;funcion de saber si se preciono bien o no
no29	movlw	.1		;Repite la operacion hasta dar cero
	subwf	48h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	R2
	movfw	3eh		;mantiene el color adentro (verde)
	movwf	5dh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.5		;el .1 equivale al color
	movwf	4dh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	p		;funcion de saber si se preciono bien o no	

p   	movlw	.1		;Empiesa a preguntar si el pulsador presioado es el correcto--------------------
	subwf	20h,f
	btfss	status,2
	goto	no30
	movfw	40h
	subwf	4bh,w
	btfss	status,2
	goto	perdi
	goto	bien1

no30	movfw	40h		;varia dependiendo que boton precione (.1 deberia ser)
	subwf	4ah,w		;mantiene en forma permanente el .1
	btfss	status,2	;pregunta si da cero
	goto	Perdi		
	goto	j1	
	;Segunda fase del simon say---------------------------------------------------------------------	
bien1	clrf   	portb      ;limpia el puerto b por las dudas
	call	demora2
	bsf   	portb,0      ;Prende el verde
	call   	demorav      ;Demora variable
	bcf   	portb,0      ;apaga el verde
	call	demora2
	bsf	portb,3
	call	demorav
	clrf	portb
	call	demora2	
	movfw	5ch
	movwf	portb
	call	demorav
	clrf	portb
	call	demora2
	movfw	5dh
	movwf	portb
	call	demorav
	clrf	portb
	movlw   .1
	movwf   4ah
	movlw	.4
	movwf	4bh
	movlw	.2
	movwf	20h
	movlw	.3
	movwf	6ch
	movlw	.4
	movwf	6dh
	;configuraciones de los colores a prender-----------------------------------------------
	bsf   portb,0      ;Verde prende
	movfw   portb
	movwf   3ah
	clrf   PORTB      ;TODO EN 0 
	bsf   portb,1      ;Amarillo prende
	movfw   portb
	movwf   3bh
	clrf   PORTB      ;TODO EN 0          
	bsf   portb,2      ;Azul prende
	movfw   portb
	movwf   3ch
	clrf   PORTB      ;TODO EN 0           
	bsf   portb,3      ;Rojo prende
	movfw   portb
	movwf   3dh
	clrf   PORTB      ;TODO EN 0
	bsf   portb,4      ;Blanco prende
	movfw   portb
	movwf   3eh
	clrf   PORTB      ;TODO EN 0     
	;Primera pregunta--------------------------------------------------------
j2	btfss   porta,0		;aprete el puerto A,0?
	goto   no31		;si es no me voy a preguntar por los otros puertos
	movlw   .1		;si es si
	movwf   40h		;variable para restar despues
	bsf   portb,0		;Prende el color del puertob,0
       	;Empiesa la funcion aleatoria--------------------------------------------
      	call   demora1		;Anti rebote de 50mseg
w6	btfsc   porta,0		;primera pregunta aleatoria
	goto	w6
	goto	R3		;es la parte donde se le resta para hacer lo de aleatorio		
		     
	;pregunta por el otro pulsador------------------------------------------
no31    btfss   porta,1      ;aprete el puerto A,1?
	goto    no32      ;si es no me voy a preguntar por los otros puertos
	movlw   .2      ;si es si
	movwf   40h      ;variable para restar despues
	bsf	portb,1      ;Prende el color del puertob,1
      	;Primera pregunta de la funcion aleatoria-------------------------------
      	call	demora1		;Anti rebote de 50mseg
w7	btfsc   porta,1		;primera pregunta aleatoria
	goto	w7
	goto	R3       
	;pregunta por el otro pulsador------------------------------------------
no32    btfss   porta,2      ;aprete el puerto A,2?
	goto   no33      ;si es no me voy a preguntar por los otros puertos
	movlw   .3      ;si es si
	movwf   40h      ;variable para restar despues
	bsf   portb,2      ;Prende el color del puertob,2
      	;Primera pregunta de la funcion aleatoria-------------------------------
      	call   demora1      ;Anti rebote de 50mseg
w8	btfsc   porta,2      ;primera pregunta aleatoria
	goto	w8
	goto	R3
	                 
	;pregunta por el otro pulsador------------------------------------------
no33    btfss   porta,3     	 ;aprete el puerto A,3?
	goto   no78      	 ;si es no me voy a preguntar por los otros puertos
	movlw   .4     		 ;si es si
	movwf   40h      	;variable para restar despues
	bsf   portb,3      	;Prende el color del puertob,3         
	;Primera pregunta de la funcion aleatoria-------------------------------
      	call   demora1      	;Anti rebote de 50mseg
w9	btfsc   porta,3      	;primera pregunta aleatoria
	goto	w9
	goto	R3	
   
	;pregunta por el otro pulsador------------------------------------------
no78	btfss   porta,4      ;aprete el puerto A,4?
	goto    k2      ;si es no me voy a preguntar por los otros puertos
	movlw   .5      ;si es si
	movwf   40h      ;variable para restar despues
	bsf	portb,4      ;Prende el color del puertob,4 
	;Primera pregunta de la funcion aleatoria---------------------------------------------------------
	call   demora1      ;Anti rebote de 50mseg
w10	btfsc   porta,4      ;primera pregunta aleatoria
	goto	w10
	goto	R3	
k2	movlw	.2		;para hacer el tiempo de aleatorio
	addwf	48h,f		;Se le suma .1 al 49h que es una memoria
	movlw	.1		;para hacer el tiempo de aleatorio
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	call	demora3
	goto	j2
	
	;Funcion aleatorio de desconteo de 49H-------------------------------------------------------------
R3	clrf	portb
	movlw	.1		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no35
	movfw	3ah		;mantiene el color adentro (verde)
	movwf	5eh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.1		;el .1 equivale al color
	movwf	4eh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	pp2		;funcion de saber si se preciono bien o no

no35	movlw	.1		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no36
	movfw	3bh		;mantiene el color adentro (verde)
	movwf	5eh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.2		;el .1 equivale al color
	movwf	4eh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	pp2		;funcion de saber si se preciono bien o no
	
no36	movlw	.1		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no37
	movfw	3ch		;mantiene el color adentro (verde)
	movwf	5eh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.3		;el .1 equivale al color
	movwf	4eh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	pp2		;funcion de saber si se preciono bien o no

no37	movlw	.1		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no38
	movfw	3dh		;mantiene el color adentro (verde)
	movwf	5eh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.4		;el .1 equivale al color
	movwf	4eh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	pp2		;funcion de saber si se preciono bien o no

no38	movlw	.1		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	R3
	movfw	3eh		;mantiene el color adentro (verde)
	movwf	5eh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.5		;el .1 equivale al color
	movwf	4eh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	pp2		;funcion de saber si se preciono bien o no
	;Es par la segunda variable que se pondra en la segunda fase---------------------------------------------
pp2	;configuraciones de los colores a prender
	bsf   portb,0      ;Verde prende
	movfw   portb
	movwf   3ah
	clrf   PORTB      ;TODO EN 0 
	bsf   portb,1      ;Amarillo prende
	movfw   portb
	movwf   3bh
	clrf   PORTB      ;TODO EN 0          
	bsf   portb,2      ;Azul prende
	movfw   portb
	movwf   3ch
	clrf   PORTB      ;TODO EN 0           
	bsf   portb,3      ;Rojo prende
	movfw   portb
	movwf   3dh
	clrf   PORTB      ;TODO EN 0
	bsf   portb,4      ;Blanco prende
	movfw   portb
	movwf   3eh
	clrf   PORTB      ;TODO EN 0

R4	movlw	.1		;Repite la operacion hasta dar cero
	subwf	48h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no39
	movfw	3ah		;mantiene el color adentro (verde)
	movwf	5fh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.1		;el .1 equivale al color
	movwf	4fh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	p2		;funcion de saber si se preciono bien o no

no39	movlw	.1		;Repite la operacion hasta dar cero
	subwf	48h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no40
	movfw	3bh		;mantiene el color adentro (verde)
	movwf	5fh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.2		;el .1 equivale al color
	movwf	4fh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	p2		;funcion de saber si se preciono bien o no
	
no40	movlw	.1		;Repite la operacion hasta dar cero
	subwf	48h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no41
	movfw	3ch		;mantiene el color adentro (verde)
	movwf	5fh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.3		;el .1 equivale al color
	movwf	4fh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	p2		;funcion de saber si se preciono bien o no

no41	movlw	.1		;Repite la operacion hasta dar cero
	subwf	48h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no42
	movfw	3dh		;mantiene el color adentro (verde)
	movwf	5fh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.4		;el .1 equivale al color
	movwf	4fh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	p2		;funcion de saber si se preciono bien o no

no42	movlw	.1		;Repite la operacion hasta dar cero
	subwf	48h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	R4
	movfw	3eh		;mantiene el color adentro (verde)
	movwf	5fh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.5		;el .1 equivale al color
	movwf	4fh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	p2		;funcion de saber si se preciono bien o no
	;Empiesa a preguntar si el pulsador presioado es el correcto-----------------------------------------------
p2   	movlw	.1
	subwf	6dh,f		;.3
	btfss	status,2
	goto	no43
	movfw	40h
	subwf	4dh,w
	btfss	status,2
	goto	perdi
	goto	bien2
		
no43	movlw	.1
	subwf	6ch,f
	btfss	status,2
	goto	no44
	movfw	40h
	subwf	4ch,w
	btfss	status,2
	goto	perdi
	goto	j2
		
no44	movlw	.1
	subwf	20h,f		;vale.2
	btfss	status,2
	goto	no45
	movfw	40h
	subwf	4bh,w
	btfss	status,2
	goto	perdi
	goto	j2

no45	movfw	40h		;varia dependiendo que boton precione (.1 deberia ser)
	subwf	4ah,w		;mantiene en forma permanente el .1
	btfss	status,2	;pregunta si da cero
	goto	Perdi		
	goto	j2	


	;tercera fase del simon say---------------------------------------------------------------------	
bien2	clrf   	portb      ;limpia el puerto b por las dudas
	call	demora2
	bsf   	portb,0      ;Prende el verde
	call   	demorav      ;Demora variable
	bcf   	portb,0      ;apaga el verde
	call	demora2
	bsf	portb,3
	call	demorav
	clrf	portb
	call	demora2	
	movfw	5ch
	movwf	portb
	call	demorav
	clrf	portb
	call	demora2
	movfw	5dh
	movwf	portb
	call	demorav
	clrf	portb
	call	demora2
	movfw	5eh
	movwf	portb
	call	demorav
	clrf	portb
	call	demora2
	movfw	5fh
	movwf	portb
	call	demorav
	clrf	portb
	call	demora2	
	movlw   .1
	movwf   4ah		;ESTA DEMAS
	movlw	.4
	movwf	4bh		;ESTA DEMAS
	movlw	.2
	movwf	20h
	movlw	.3
	movwf	6ch
	movlw	.4
	movwf	6dh
	movlw	.5
	movwf	6eh
	movlw	.6
	movwf	6fh	
j3	;configuraciones de los colores a prender-----------------------------------------------
	bsf   portb,0      ;Verde prende
	movfw   portb
	movwf   3ah
	clrf   PORTB      ;TODO EN 0 
	bsf   portb,1      ;Amarillo prende
	movfw   portb
	movwf   3bh
	clrf   PORTB      ;TODO EN 0          
	bsf   portb,2      ;Azul prende
	movfw   portb
	movwf   3ch
	clrf   PORTB      ;TODO EN 0           
	bsf   portb,3      ;Rojo prende
	movfw   portb
	movwf   3dh
	clrf   PORTB      ;TODO EN 0
	bsf   portb,4      ;Blanco prende
	movfw   portb
	movwf   3eh
	clrf   PORTB      ;TODO EN 0     
	;Primera pregunta--------------------------------------------------------
	btfss   porta,0		;aprete el puerto A,0?
	goto   no46		;si es no me voy a preguntar por los otros puertos
	movlw   .1		;si es si
	movwf   40h		;variable para restar despues
	bsf   portb,0		;Prende el color del puertob,0
       	;Empiesa la funcion aleatoria--------------------------------------------
      	call   demora1		;Anti rebote de 50mseg
w11	btfsc   porta,0		;primera pregunta aleatoria
	goto	w11
	goto	R5		;es la parte donde se le resta para hacer lo de aleatorio		
		     
	;pregunta por el otro pulsador------------------------------------------
no46    btfss   porta,1      ;aprete el puerto A,1?
	goto    no47      ;si es no me voy a preguntar por los otros puertos
	movlw   .2      ;si es si
	movwf   40h      ;variable para restar despues
	bsf	portb,1      ;Prende el color del puertob,1
      	;Primera pregunta de la funcion aleatoria-------------------------------
      	call	demora1		;Anti rebote de 50mseg
w12	btfsc   porta,1		;primera pregunta aleatoria
	goto	w12
	goto	R5
         
	;pregunta por el otro pulsador------------------------------------------
no47    btfss   porta,2      ;aprete el puerto A,2?
	goto   no48	     ;si es no me voy a preguntar por los otros puertos
	movlw   .3      ;si es si
	movwf   40h      ;variable para restar despues
	bsf   portb,2      ;Prende el color del puertob,2
      	;Primera pregunta de la funcion aleatoria-------------------------------
      	call   demora1      ;Anti rebote de 50mseg
w13	btfsc   porta,2      ;primera pregunta aleatoria
	goto	w13
	goto	R5
	                 
	;pregunta por el otro pulsador------------------------------------------
no48    btfss   porta,3      	;aprete el puerto A,3?
	goto   no49      	;si es no me voy a preguntar por los otros puertos
	movlw   .4      	;si es si
	movwf   40h      	;variable para restar despues
	bsf   portb,3      	;Prende el color del puertob,3         
	;Primera pregunta de la funcion aleatoria-------------------------------
      	call   demora1      	;Anti rebote de 50mseg
w14	btfsc   porta,3      	;primera pregunta aleatoria
	goto	w14
	goto	R5	
  
	;pregunta por el otro pulsador------------------------------------------
no49	btfss   porta,4      	;aprete el puerto A,4?
	goto    k3      	;si es no me voy a preguntar por los otros puertos
	movlw   .5      	;si es si
	movwf   40h      	;variable para restar despues
	bsf	portb,4      	;Prende el color del puertob,4 
	;Primera pregunta de la funcion aleatoria---------------------------------------------------------
	call   demora1      	;Anti rebote de 50mseg
w15	btfsc   porta,4     	;primera pregunta aleatoria
	goto	w15
	goto	R5	
k3	movlw	.2		;para hacer el tiempo de aleatorio
	addwf	48h,f		;Se le suma .1 al 49h que es una memoria
	movlw	.1		;para hacer el tiempo de aleatorio
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	call	demora3
	goto	j3	
	;Funcion aleatorio de desconteo de 49H-------------------------------------------------------------
R5	clrf	portb
	movlw	.1		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no50
	movfw	3ah		;mantiene el color adentro (verde)
	movwf	60h		;lo usara despues para mostrarlo en la segunda fase
	movlw	.1		;el .1 equivale al color
	movwf	41h		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	pp3		;funcion de saber si se preciono bien o no

no50	movlw	.1		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no51
	movfw	3bh		;mantiene el color adentro (verde)
	movwf	60h		;lo usara despues para mostrarlo en la segunda fase
	movlw	.2		;el .1 equivale al color
	movwf	41h		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	pp3		;funcion de saber si se preciono bien o no
	
no51	movlw	.1		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no52
	movfw	3ch		;mantiene el color adentro (verde)
	movwf	60h		;lo usara despues para mostrarlo en la segunda fase
	movlw	.3		;el .1 equivale al color
	movwf	41h		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	pp3		;funcion de saber si se preciono bien o no

no52	movlw	.1		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no53
	movfw	3dh		;mantiene el color adentro (verde)
	movwf	60h		;lo usara despues para mostrarlo en la segunda fase
	movlw	.4		;el .1 equivale al color
	movwf	41h		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	pp3		;funcion de saber si se preciono bien o no

no53	movlw	.1		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	R5
	movfw	3eh		;mantiene el color adentro (verde)
	movwf	60h		;lo usara despues para mostrarlo en la segunda fase
	movlw	.5		;el .1 equivale al color
	movwf	41h		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	pp3		;funcion de saber si se preciono bien o no

	;Funcion aleatorio de desconteo de 49H-------------------------------------------------------------
pp3	;configuraciones de los colores a prender
	bsf   portb,0      ;Verde prende
	movfw   portb
	movwf   3ah
	clrf   PORTB      ;TODO EN 0 
	bsf   portb,1      ;Amarillo prende
	movfw   portb
	movwf   3bh
	clrf   PORTB      ;TODO EN 0          
	bsf   portb,2      ;Azul prende
	movfw   portb
	movwf   3ch
	clrf   PORTB      ;TODO EN 0           
	bsf   portb,3      ;Rojo prende
	movfw   portb
	movwf   3dh
	clrf   PORTB      ;TODO EN 0
	bsf   portb,4      ;Blanco prende
	movfw   portb
	movwf   3eh
	clrf   PORTB      ;TODO EN 0

R6	clrf	portb
	movlw	.1		;Repite la operacion hasta dar cero
	subwf	48h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no59
	movfw	3ah		;mantiene el color adentro (verde)
	movwf	61h		;lo usara despues para mostrarlo en la segunda fase
	movlw	.1		;el .1 equivale al color
	movwf	42h		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	p4		;funcion de saber si se preciono bien o no

no59	movlw	.1		;Repite la operacion hasta dar cero
	subwf	48h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no60
	movfw	3bh		;mantiene el color adentro (verde)
	movwf	61h		;lo usara despues para mostrarlo en la segunda fase
	movlw	.2		;el .1 equivale al color
	movwf	42h		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	p4		;funcion de saber si se preciono bien o no
	
no60	movlw	.1		;Repite la operacion hasta dar cero
	subwf	48h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no61
	movfw	3ch		;mantiene el color adentro (verde)
	movwf	61h		;lo usara despues para mostrarlo en la segunda fase
	movlw	.3		;el .1 equivale al color
	movwf	42h		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	p4		;funcion de saber si se preciono bien o no
no61	movlw	.1		;Repite la operacion hasta dar cero
	subwf	48h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no62
	movfw	3dh		;mantiene el color adentro (verde)
	movwf	61h		;lo usara despues para mostrarlo en la segunda fase
	movlw	.4		;el .1 equivale al color
	movwf	42h		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	p4		;funcion de saber si se preciono bien o no
no62	movlw	.1		;Repite la operacion hasta dar cero
	subwf	48h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	R6
	movfw	3eh		;mantiene el color adentro (verde)
	movwf	61h		;lo usara despues para mostrarlo en la segunda fase
	movlw	.5		;el .1 equivale al color
	movwf	42h		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	p4		;funcion de saber si se preciono bien o no
	;Empiesa a preguntar si el pulsador presioado es el correcto-----------------------------------------------
p4	movlw	.1
	subwf	6eh,f		;.3
	btfss	status,2
	goto	no54
	movfw	40h
	subwf	4eh,w
	btfss	status,2
	goto	perdi
	goto	win
no54	movlw	.1
	subwf	6dh,f		;.3
	btfss	status,2
	goto	no55
	movfw	40h
	subwf	4fh,w
	btfss	status,2
	goto	perdi
	goto	j3
no55	movlw	.1
	subwf	6dh,f		;.3
	btfss	status,2
	goto	no56
	movfw	40h
	subwf	4dh,w
	btfss	status,2
	goto	perdi
	goto	j3		
no56	movlw	.1
	subwf	6ch,f
	btfss	status,2
	goto	no57
	movfw	40h
	subwf	4ch,w
	btfss	status,2
	goto	perdi
	goto	j3		
no57	movlw	.1
	subwf	20h,f		;vale.2
	btfss	status,2
	goto	no58
	movfw	40h
	subwf	4bh,w
	btfss	status,2
	goto	perdi
	goto	j3
no58	movfw	40h		;varia dependiendo que boton precione (.1 deberia ser)
	subwf	4ah,w		;mantiene en forma permanente el .1
	btfss	status,2	;pregunta si da cero
	goto	Perdi		
	goto	j3	
	;Perdiste (Game Over)----------------------------------------------------------------------------------------
Perdi	bsf	portb,0
	bsf	portb,1
	bsf	portb,2
	bsf	portb,3
	bsf	portb,4
	call 	demora2
	clrf	portb
	call 	demora2
	bsf	portb,0
	bsf	portb,1
	bsf	portb,2
	bsf	portb,3
	bsf	portb,4
	call 	demorav
	clrf	portb
	call 	demora2
	bsf	portb,0
	bsf	portb,1
	bsf	portb,2
	bsf	portb,3
	bsf	portb,4
	call 	demora2
	clrf	portb
	goto	inicio
	;Ganaste (Win)------------------------------------------------------------
win	bsf	portb,0
	call	demora2
	bsf	portb,1
	call	demora2
	bsf	portb,2
	call	demora2
	bsf	portb,3
	call	demora2
	bsf	portb,4
	call	demora2
	clrf	portb
	call 	demora2
	bsf	portb,0
	bsf	portb,1
	bsf	portb,2
	bsf	portb,3
	bsf	portb,4
	call 	demora2
	clrf	portb
	goto	inicio 
	;Demoras de tiempos------------------------------------------------------
demorav	clrf	TMR0      	;TMR0=0 limpio el timer
	movfw   30h		;va 30H
	movwf   3FH      	;permanente
pipa    bcf	intcon,2
	movlw	.61		;variable (tengo .61 = 50mseg) ESTABA 31H
	movwf   TMR0		;Permanente, 31h le pasa el .61 al timer
ni      btfss   intcon,2	;cuenta hasta llegar a cero
	goto	ni		;repite hasta llegar a cero
	goto	si9		;llego a cero intcon,2
si9     decfsz	3FH,f		;es la variable que se resta
	goto	pipa
	return          	;vuelve de donde vino----------------------------
demora1	clrf   TMR0		;limpiando timer, hacer de 50 mseg
	movlw   d'61'		;Seria .61
	movwf   TMR0		;TMRO=178
N	btfss	intcon,2
	goto	N
	bcf	intcon,2
	return			;;vuelve de donde vino----------------------------
demora2	clrf	TMR0      	;TMR0=0 limpio el timer
	movlw   .5		;con esto hace un demora de 500 mseg
	movwf   48H      	;permanente
pipa2   bcf	intcon,2
	movlw	.61		;variable (tengo .61 = 50mseg) ESTABA 31H
	movwf   TMR0		;Permanente, 31h le pasa el .61 al timer
niii    btfss   intcon,2	;cuenta hasta llegar a cero
	goto	niii		;repite hasta llegar a cero
	goto	siz		;llego a cero intcon,2
siz     decfsz	48H,f		;es la variable que se resta
	goto	pipa2
	return			;vuelve de donde vino----------------------------
demora3	clrf	TMR0      	;TMR0=0 limpio el timer
	movlw   .1		;con esto hace un demora de 500 mseg
	movwf   47H      	;permanente
pipa3   bcf	intcon,2
	movlw	.255		;variable (tengo .61 = 50mseg) ESTABA 31H
	movwf   TMR0		;Permanente, 31h le pasa el .61 al timer
niiii   btfss   intcon,2	;cuenta hasta llegar a cero
	goto	niiii		;repite hasta llegar a cero
	goto	sizz		;llego a cero intcon,2
sizz     decfsz	47H,f		;es la variable que se resta
	goto	pipa3
	return			;vuelve de donde vino----------------------------