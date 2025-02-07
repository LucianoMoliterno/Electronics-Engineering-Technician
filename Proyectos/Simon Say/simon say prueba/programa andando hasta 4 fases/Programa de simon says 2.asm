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
	bcf   STATUS,5   ;CAMBIO DE BANCO
	clrf   PORTA      ;TODO EN 0 
	clrf   PORTB      ;TODO EN 0
	          	            	        
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
no6   btfss   porta,4      ;pregunto por la tercera velocidad que es 0,4 seg
	goto   inicio      ;Me vuelvo para el principio (no se toco nada)
	call    demora1
no8     btfsc   porta,4
	goto   no8
	movlw   .5
	movwf   1AH
	goto   F1	         
	;Fin de la pregunta de velocidades, empiesa el comando de velocidad--------
F1      movfw   2AH      ;.1 - .1 deberia dar cero si se preciono porta,0
	subwf   1AH,W
	btfss   status,2   ;Z = 1   el resultado dio cero
	goto   NO9      ;Z no vale 0, pregunto por los otros
	movlw   .20      ;.20 es que repite 20 veses 50mseg, Si el resultado da cero la velocidad es de 1seg
	movwf   30h      ;Donde pongo el dato de .20, variable del timer
	movlw   .61      ;50 mseg
	movwf   31h      ;Donde pongo el dato de .61=50mseg, variable del timer
	goto   juego      ;Empiesa el juego
               
	;comando de velocidad numero 2--------------------------------------------
NO9     movfw   2BH      ;.2 - .1 deberia dar cero si se preciono porta,0
	subwf   1AH,W
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

        ;EMPIESA EL JUEGO Codigo de muestreo-------------------------------------
juego   clrf   portb      ;limpia el puerto b por las dudas
	bsf   portb,0      ;Prende el verde
	call   demorav      ;Demora variable
	bcf   portb,0      ;apaga el verde
	movlw   .1
	movwf   4ah
       
	;Primera pregunta--------------------------------------------------------
j1	btfss   porta,0		;aprete el puerto A,0?
	goto   no13		;si es no me voy a preguntar por los otros puertos
	movlw   .1		;si es si
	movwf   40h		;variable para restar despues
	bsf   portb,0		;Prende el color del puertob,0
       	;Empiesa la funcion aleatoria--------------------------------------------
      call   demora1		;Anti rebote de 50mseg
w1	btfsc   porta,0		;primera pregunta aleatoria
	goto	no17
	goto	R1		;es la parte donde se le resta para hacer lo de aleatorio		
no17	movlw	.1
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	call	demora3
	goto	w1
		     
	;pregunta por el otro pulsador------------------------------------------
no13    btfss   porta,1      ;aprete el puerto A,1?
	goto    no14      ;si es no me voy a preguntar por los otros puertos
	movlw   .2      ;si es si
	movwf   40h      ;variable para restar despues
	bsf	portb,1      ;Prende el color del puertob,1
      	;Primera pregunta de la funcion aleatoria-------------------------------
      call	demora1		;Anti rebote de 50mseg
w2	btfsc   porta,1		;primera pregunta aleatoria
	goto	no18
	goto	R1
no18	movlw	.1
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	call	demora3
	goto	w2
         
	;pregunta por el otro pulsador------------------------------------------
no14    btfss   porta,2      ;aprete el puerto A,2?
	goto   no15      ;si es no me voy a preguntar por los otros puertos
	movlw   .3      ;si es si
	movwf   40h      ;variable para restar despues
	bsf   portb,2      ;Prende el color del puertob,2
      	;Primera pregunta de la funcion aleatoria-------------------------------
      call   demora1      ;Anti rebote de 50mseg
w3	btfsc   porta,2      ;primera pregunta aleatoria
	goto	no19
	goto	R1
no19	movlw	.1
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	call	demora3
	goto	w3
	                 
	;pregunta por el otro pulsador------------------------------------------
no15    btfss   porta,3      ;aprete el puerto A,3?
	goto   no16      ;si es no me voy a preguntar por los otros puertos
	movlw   .4      ;si es si
	movwf   40h      ;variable para restar despues
	bsf   portb,3      ;Prende el color del puertob,3         
	;Primera pregunta de la funcion aleatoria-------------------------------
      call   demora1      ;Anti rebote de 50mseg
w4	btfsc   porta,3      ;primera pregunta aleatoria
	goto	no20
	goto	R1	
no20	movlw	.1
	addwf	49h,f		;;Se le suma .1 al 49h que es una memoria
	call	demora3
	goto	w4
   
	;pregunta por el otro pulsador------------------------------------------
no16	btfss   porta,4      ;aprete el puerto A,4?
	goto    j1      ;si es no me voy a preguntar por los otros puertos
	movlw   .5      ;si es si
	movwf   40h      ;variable para restar despues
	bsf	portb,4      ;Prende el color del puertob,4 
	;Primera pregunta de la funcion aleatoria-------------------------------
	call   demora1      ;Anti rebote de 50mseg
w5	btfsc   porta,4      ;primera pregunta aleatoria
	goto	no21
	goto	R1	
no21	movlw	.1
	addwf	49h,f		;;Se le suma .1 al 49h que es una memoria
	call	demora3
	goto	w5
	
 	;Funcion aleatorio de desconteo de 49H---------------------------------
R1	call	demora3
	clrf	portb
	movlw	.45		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no22
	movfw	3ah		;mantiene el color adentro (verde)
	movwf	1bh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.1		;el .1 equivale al color
	movwf	4bh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P		;funcion de saber si se preciono bien o no

no22	call	demora3
	movlw	.45		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no23
	movfw	3bh		;mantiene el color adentro (verde)
	movwf	1bh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.2		;el .1 equivale al color
	movwf	4bh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P		;funcion de saber si se preciono bien o no
	
no23	call	demora3
	movlw	.45		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no24
	movfw	3ch		;mantiene el color adentro (verde)
	movwf	1bh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.3		;el .1 equivale al color
	movwf	4bh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P		;funcion de saber si se preciono bien o no

no24	call	demora3
	movlw	.45		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no25
	movfw	3dh		;mantiene el color adentro (verde)
	movwf	1bh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.4		;el .1 equivale al color
	movwf	4bh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P		;funcion de saber si se preciono bien o no

no25	call	demora3
	movlw	.45		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	R1
	movfw	3eh		;mantiene el color adentro (verde)
	movwf	1bh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.5		;el .1 equivale al color
	movwf	4bh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P		;funcion de saber si se preciono bien o no

	;datos para la fase 2---------------------------------------------------
si1     movfw   3ah      ;si sale para la prox el portb,o
	movwf   1bh
	movlw   .1
	movwf   4bh
	goto    P
si2	movfw   3bh      ;si sale para la prox el portb,1
	movwf   1bh
	movlw   .2
	movwf   4bh
	goto    P
si3   movfw     3ch      ;si sale para la prox el portb,2
	movwf   1bh
	movlw   .3
	movwf   4bh
	goto    P
si4	movfw   3dh      ;si sale para la prox el portb,3
	movwf   1bh
	movlw   .4
	movwf   4bh
	goto    P
si5	movfw   3eh      ;si sale para la prox el portb,4
	movwf   1bh
	movlw   .5
	movwf   4bh
	goto	P
	;Empiesa a preguntar si el pulsador presioado es el correcto------------
p   	movfw	40h		;varia dependiendo que boton precione (.1 deberia ser)
	subwf	4ah,w		;mantiene en forma permanente el .1
	btfss	status,2	;pregunta si da cero
	goto	Perdi		;MODIFICAR
	goto	bien1		;MODIFICAR
	
	;Segunda fase, la maquina muestra los colores---------------------------
bien1	clrf	portb		;Esta demas por las dudas
	bsf	portb,0		;Muestre el Ra0 (ej: Verde)
	call	demorav		;Demora variable
	bcf	portb,0		;Apaga el Ra0
	call	demora2
	movfw	1bh		
	movwf	portb
	call	demorav
	clrf	portb
	movlw	.2
	movwf	10h
	call	demora2
	;configuraciones de los colores a prender-------------------------------
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
	;Empiesa las preguntas-------------------------------------------------
j2	btfss   porta,0     	;aprete el puerto A,0?
	goto   no27      	;si es no me voy a preguntar por los otros puertos
	movlw   .1      	;si es si
	movwf   40h      	;variable para restar despues
	bsf   portb,0      	;Prende el color del puertob,0         
	;Primera pregunta de la funcion aleatoria-------------------------------
      call   demora1      	;Anti rebote de 50mseg
w6	btfsc   porta,0      	;primera pregunta aleatoria
	goto	no31
	goto	R2		;es la parte de la funcion aleatoria
no31	movlw	.1		
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w6		

no27	;Pregunta por el otro pulsador------------------------------------------
	btfss   porta,1     	;aprete el puerto A,1?
	goto   no28      	;si es no me voy a preguntar por los otros puertos
	movlw   .2      	;si es si
	movwf   40h      	;variable para restar despues
	bsf   portb,1      	;Prende el color del puertob,1         
	;Primera pregunta de la funcion aleatoria-------------------------------
        call   demora1      	;Anti rebote de 50mseg
w7	btfsc   porta,1      	;primera pregunta aleatoria
	goto	no32
	goto	R2		;es la parte de la funcion aleatoria
no32	movlw	.1		
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w7	

no28	;Pregunta por el otro pulsador------------------------------------------
	btfss   porta,2     	;aprete el puerto A,2?
	goto   no29      	;si es no me voy a preguntar por los otros puertos
	movlw   .3      	;si es si
	movwf   40h      	;variable para restar despues
	bsf   portb,2      	;Prende el color del puertob,2         
	;Primera pregunta de la funcion aleatoria-------------------------------
      call   demora1      	;Anti rebote de 50mseg
w8	btfsc   porta,2      	;primera pregunta aleatoria
	goto	no33
	goto	R2		;es la parte de la funcion aleatoria
no33	movlw	.1		
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w8	

no29	;Pregunta por el otro pulsador------------------------------------------
	btfss   porta,3     	;aprete el puerto A,3?
	goto   no30     	;si es no me voy a preguntar por los otros puertos
	movlw   .4      	;si es si
	movwf   40h      	;variable para restar despues
	bsf   portb,3      	;Prende el color del puertob,3         
	;Primera pregunta de la funcion aleatoria-------------------------------
      call   	demora1		;Anti rebote de 50mseg
w9	btfsc   porta,3      	;primera pregunta aleatoria
	goto	no34
	goto	R2		;es la parte de la funcion aleatoria
no34	movlw	.1		
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w9
	

no30	;Pregunta por el otro pulsador------------------------------------------
	btfss   porta,4     	;aprete el puerto A,3?
	goto   	j2	     	;si es no me voy a preguntar por los otros puertos
	movlw   .5      	;si es si
	movwf   40h      	;variable para restar despues
	bsf   portb,4      	;Prende el color del puertob,3         
	;Primera pregunta de la funcion aleatoria-------------------------------
      call   demora1      	;Anti rebote de 50mseg
w10	btfsc   porta,4      	;primera pregunta aleatoria
	goto	no35
	goto	R2		;es la parte de la funcion aleatoria
no35	movlw	.1		
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w10

R2	;Empiesa la funcion aleatoria, pregunta cuado 49h,f da cero-------------
	clrf	portb
	movlw	.15		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no36
	movfw	3ah		;mantiene el color adentro (verde)
	movwf	1ch		;lo usara despues para mostrarlo en la segunda fase
	movlw	.1		;el .1 equivale al color
	movwf	4ch		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P2		;funcion de saber si se preciono bien o no

no36	movlw	.15		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no37
	movfw	3bh		;mantiene el color adentro (amarillo)
	movwf	1ch		;lo usara despues para mostrarlo en la segunda fase
	movlw	.2		;el .1 equivale al color
	movwf	4ch		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P2		;funcion de saber si se preciono bien o no
	
no37	movlw	.15		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no38
	movfw	3ch		;mantiene el color adentro (azul)
	movwf	1ch		;lo usara despues para mostrarlo en la segunda fase
	movlw	.3		;el .1 equivale al color
	movwf	4ch		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P2		;funcion de saber si se preciono bien o no

no38	movlw	.15		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no39
	movfw	3dh		;mantiene el color adentro (rojo)
	movwf	1ch		;lo usara despues para mostrarlo en la segunda fase
	movlw	.4		;el .1 equivale al color
	movwf	4ch		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P2		;funcion de saber si se preciono bien o no

no39	movlw	.15		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	R2
	movfw	3eh		;mantiene el color adentro (blanco)
	movwf	1ch		;lo usara despues para mostrarlo en la segunda fase
	movlw	.5		;el .1 equivale al color
	movwf	4ch		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P2		;funcion de saber si se preciono bien o no

P2	;Funcion si se preciono bien o no---------------------------------------
	movlw	.1
	subwf	10h,f
	btfss	status,2	;Z = 1 osea que si dio cero la resta
	goto	no40	 	;Significa que solo dio una vuelta y pregunta por el primero
	movfw	40h		;si es si
	subwf	4bh,w		;al ser ,w mantiene el valor que adquirio paras otras fases
	btfss	status,2	;Z = 1 osea que si dio cero la resta
	goto	perdi
	goto	bien2

no40	movfw	40h		;si es si
	subwf	4ah,w		;al ser ,w mantiene el valor que adquirido para otras fases
	btfss	status,2	;Z = 1 osea que si dio cero la resta
	goto	perdi
	call	demora2
	goto	j2		;Vuelve para la segunda vuelta

	;Tercera Fase del simon say---------------------------------------------
bien2	clrf	portb		;Esta demas por las dudas
	bsf	portb,0		;Muestre el Ra0 (ej: Verde)
	call	demorav		;Demora variable
	bcf	portb,0		;Apaga el Ra0
	call	demora2
	movfw	1bh		
	movwf	portb
	call	demorav
	clrf	portb
	call	demora2
	movfw	1ch		
	movwf	portb
	call	demorav
	clrf	portb	
	movlw	.2
	movwf	10h
	movlw	.3
	movwf	0ch

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

	;Empiesa las preguntas-------------------------------------------------
j3	btfss   porta,0     	;aprete el puerto A,0?
	goto   no410     	;si es no me voy a preguntar por los otros puertos
	movlw   .1      	;si es si
	movwf   40h      	;variable para restar despues
	bsf   portb,0      	;Prende el color del puertob,0         
	;Primera pregunta de la funcion aleatoria-------------------------------
        call   demora1      	;Anti rebote de 50mseg
w11	btfsc   porta,0      	;primera pregunta aleatoria
	goto	no41
	goto	R3		;es la parte de la funcion aleatoria
no41	movlw	.1		
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w11

no410	;Pregunta por el otro pulsador-----------------------------------------
	btfss   porta,1     	;aprete el puerto A,1?
	goto   no42      	;si es no me voy a preguntar por los otros puertos
	movlw   .2      	;si es si
	movwf   40h      	;variable para restar despues
	bsf   portb,1      	;Prende el color del puertob,1         
	;Primera pregunta de la funcion aleatoria-------------------------------
        call   demora1      	;Anti rebote de 50mseg
w12	btfsc   porta,1      	;primera pregunta aleatoria
	goto	no43
	goto	R3		;es la parte de la funcion aleatoria
no43	movlw	.1		
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w12

no42	btfss   porta,2     	;aprete el puerto A,2?
	goto   no44     	;si es no me voy a preguntar por los otros puertos
	movlw   .3	     	;si es si
	movwf   40h      	;variable para restar despues
	bsf   portb,2      	;Prende el color del puertob,2         
	;Primera pregunta de la funcion aleatoria-------------------------------
        call   demora1      	;Anti rebote de 50mseg
w13	btfsc   porta,2      	;primera pregunta aleatoria
	goto	no45
	goto	R3		;es la parte de la funcion aleatoria
no45	movlw	.1		
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w13

no44	btfss   porta,3     	;aprete el puerto A,3?
	goto   no46     	;si es no me voy a preguntar por los otros puertos
	movlw   .4	     	;si es si
	movwf   40h      	;variable para restar despues
	bsf   	portb,3      	;Prende el color del puertob,3         
	;Primera pregunta de la funcion aleatoria-------------------------------
        call   demora1      	;Anti rebote de 50mseg
w14	btfsc   porta,3      	;primera pregunta aleatoria
	goto	no47
	goto	R3		;es la parte de la funcion aleatoria
no47	movlw	.1		
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w14

no46	btfss   porta,4     	;aprete el puerto A,4?
	goto   	j3    		;si es no me voy a preguntar por los otros puertos
	movlw   .5	     	;si es si
	movwf   40h      	;variable para restar despues
	bsf   	portb,4      	;Prende el color del puertob,4         
	;Primera pregunta de la funcion aleatoria-------------------------------
        call   demora1      	;Anti rebote de 50mseg
w15	btfsc   porta,4      	;primera pregunta aleatoria
	goto	no48
	goto	R3		;es la parte de la funcion aleatoria
no48	movlw	.1		
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w15

	;parte aleatoria para la proxima fase con desconteo de 49h--------------
R3	clrf	portb

R3m	movlw	.35		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no49
	movfw	3ah		;mantiene el color adentro (verde)
	movwf	1dh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.1		;el .1 equivale al color
	movwf	4dh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P3		;funcion de saber si se preciono bien o no

no49	movlw	.35		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no50
	movfw	3bh		;mantiene el color adentro (amarillo)
	movwf	1dh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.2		;el .1 equivale al color
	movwf	4dh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P3		;funcion de saber si se preciono bien o no
	
no50	movlw	.35		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no51
	movfw	3ch		;mantiene el color adentro (azul)
	movwf	1dh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.3		;el .1 equivale al color
	movwf	4dh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P3		;funcion de saber si se preciono bien o no

no51	movlw	.35		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no52
	movfw	3dh		;mantiene el color adentro (rojo)
	movwf	1dh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.4		;el .1 equivale al color
	movwf	4dh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P3		;funcion de saber si se preciono bien o no

no52	movlw	.35		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	R3m
	movfw	3eh		;mantiene el color adentro (blanco)
	movwf	1dh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.5		;el .1 equivale al color
	movwf	4dh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P3		;funcion de saber si se preciono bien o no

	;Funcion si se preciono bien o no---------------------------------------
P3	movlw	.1
	subwf	0CH,f
	btfss	status,2
	goto	no53
	movfw	40h
	subwf	4ch,w
	btfss	status,2
	goto	perdi
	goto	bien3

no53	movlw	.1
	subwf	10h,f
	btfss	status,2	;Z = 1 osea que si dio cero la resta
	goto	no54	 	;Significa que solo dio una vuelta y pregunta por el primero
	movfw	40h		;si es si
	subwf	4bh,w		;al ser ,w mantiene el valor que adquirio paras otras fases
	btfss	status,2	;Z = 1 osea que si dio cero la resta
	goto	perdi
	goto	j3

no54	movfw	40h		;si es si
	subwf	4ah,w		;al ser ,w mantiene el valor que adquirido para otras fases
	btfss	status,2	;Z = 1 osea que si dio cero la resta
	goto	perdi
	call	demora2
	goto	j3		;Vuelve para la segunda vuelta

	;Cuarta fase de simon say-----------------------------------------------
bien3	clrf	portb		;Esta demas por las dudas
	bsf	portb,0		;Muestre el Ra0 (ej: Verde)
	call	demorav		;Demora variable
	bcf	portb,0		;Apaga el Ra0
	call	demora2
	movfw	1bh		
	movwf	portb
	call	demorav
	clrf	portb
	call	demora2
	movfw	1ch		
	movwf	portb
	call	demorav
	clrf	portb
	call	demora2
	movfw	1dh		
	movwf	portb
	call	demorav
	clrf	portb		
	movlw	.2
	movwf	10h
	movlw	.3
	movwf	0ch
	movlw	.4
	movwf	0dh
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

	;Empiesa las preguntas-------------------------------------------------
j4	btfss   porta,0     	;aprete el puerto A,0?
	goto   no55     	;si es no me voy a preguntar por los otros puertos
	movlw   .1      	;si es si
	movwf   40h      	;variable para restar despues
	bsf   portb,0      	;Prende el color del puertob,0         
	;Primera pregunta de la funcion aleatoria-------------------------------
        call   demora1      	;Anti rebote de 50mseg
w16	btfsc   porta,0      	;primera pregunta aleatoria
	goto	no56
	goto	R4		;es la parte de la funcion aleatoria
no56	movlw	.1		
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w16

no55	;Pregunta por el otro--------------------------------------------------
	btfss   porta,1     	;aprete el puerto A,1?
	goto   no57     	;si es no me voy a preguntar por los otros puertos
	movlw   .2      	;si es si
	movwf   40h      	;variable para restar despues
	bsf   portb,1      	;Prende el color del puertob,1         
	;Primera pregunta de la funcion aleatoria-------------------------------
        call   demora1      	;Anti rebote de 50mseg
w17	btfsc   porta,1      	;primera pregunta aleatoria
	goto	no58
	goto	R4		;es la parte de la funcion aleatoria
no58	movlw	.1		
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w17

no57	btfss   porta,2     	;aprete el puerto A,2?
	goto   no59     	;si es no me voy a preguntar por los otros puertos
	movlw   .3      	;si es si
	movwf   40h      	;variable para restar despues
	bsf   portb,2      	;Prende el color del puertob,2         
	;Primera pregunta de la funcion aleatoria-------------------------------
        call   demora1      	;Anti rebote de 50mseg
w18	btfsc   porta,2      	;primera pregunta aleatoria
	goto	no60
	goto	R4		;es la parte de la funcion aleatoria
no60	movlw	.1		
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w18

no59	btfss   porta,3     	;aprete el puerto A,3?
	goto   no61     	;si es no me voy a preguntar por los otros puertos
	movlw   .4      	;si es si
	movwf   40h      	;variable para restar despues
	bsf   portb,3      	;Prende el color del puertob,3         
	;Primera pregunta de la funcion aleatoria-------------------------------
        call   demora1      	;Anti rebote de 50mseg
w19	btfsc   porta,3      	;primera pregunta aleatoria
	goto	no62
	goto	R4		;es la parte de la funcion aleatoria
no62	movlw	.1		
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w19

no61	btfss   porta,4     	;aprete el puerto A,4?
	goto  	j4     		;si es no me voy a preguntar por los otros puertos
	movlw   .5      	;si es si
	movwf   40h      	;variable para restar despues
	bsf   portb,4      	;Prende el color del puertob,4         
	;Primera pregunta de la funcion aleatoria-------------------------------
        call   demora1      	;Anti rebote de 50mseg
w20	btfsc   porta,4      	;primera pregunta aleatoria
	goto	no63
	goto	R4		;es la parte de la funcion aleatoria
no63	movlw	.1		
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w20

R4	;parte aleatoria para la proxima fase con desconteo de 49h--------------
	clrf	portb
RAm	movlw	.5		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no64
	movfw	3ah		;mantiene el color adentro (verde)
	movwf	1eh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.1		;el .1 equivale al color
	movwf	4eh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P4		;funcion de saber si se preciono bien o no

no64	movlw	.5		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no65
	movfw	3bh		;mantiene el color adentro (amarillo)
	movwf	1eh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.2		;el .1 equivale al color
	movwf	4eh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P4		;funcion de saber si se preciono bien o no
	
no65	movlw	.5		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no66
	movfw	3ch		;mantiene el color adentro (azul)
	movwf	1eh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.3		;el .1 equivale al color
	movwf	4eh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P4		;funcion de saber si se preciono bien o no

no66	movlw	.5		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	no67
	movfw	3dh		;mantiene el color adentro (rojo)
	movwf	1eh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.4		;el .1 equivale al color
	movwf	4eh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P4		;funcion de saber si se preciono bien o no

no67	movlw	.5		;Repite la operacion hasta dar cero
	subwf	49h,f
	btfss	status,2	;pregunta si la cuenta dio cero
	goto	RAm		;Vuelve para arriba
	movfw	3eh		;mantiene el color adentro (blanco)
	movwf	1eh		;lo usara despues para mostrarlo en la segunda fase
	movlw	.5		;el .1 equivale al color
	movwf	4eh		;se guardara en 4bh para luego en la resta se dira si fue correcto o no
	goto	P4		;funcion de saber si se preciono bien o no

	;Funcion si se preciono bien o no---------------------------------------
P4	movlw	.1
	subwf	0dh,f
	btfss	status,2
	goto	no70
	movfw	40h
	subwf	4dh,w
	btfss	status,2
	goto	perdi
	goto	win
	
no70	movlw	.1
	subwf	0CH,f
	btfss	status,2	;Z = 1 osea que si dio cero la resta
	goto	no68		;Significa que solo dio una vuelta y pregunta por el primero
	movfw	40h
	subwf	4ch,w		;al ser ,w mantiene el valor que adquirio paras otras fases
	btfss	status,2	;Z = 1 osea que si dio cero la resta
	goto	perdi
	goto	j4

no68	movlw	.1
	subwf	10h,f
	btfss	status,2	;Z = 1 osea que si dio cero la resta
	goto	no69	 	;Significa que solo dio una vuelta y pregunta por el primero
	movfw	40h		;si es si
	subwf	4bh,w		;al ser ,w mantiene el valor que adquirio paras otras fases
	btfss	status,2	;Z = 1 osea que si dio cero la resta
	goto	perdi
	goto	j4

no69	movfw	40h		;si es si
	subwf	4ah,w		;al ser ,w mantiene el valor que adquirido para otras fases
	btfss	status,2	;Z = 1 osea que si dio cero la resta
	goto	perdi
	call	demora2
	goto	j4		;Vuelve para la segunda vuelta

	;Perdiste (Game Over)----------------------------------------------------
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
	call	demorav
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