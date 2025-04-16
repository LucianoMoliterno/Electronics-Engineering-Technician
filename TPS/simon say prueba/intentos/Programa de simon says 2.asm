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
	bcf   STATUS,5   ;CAMBIO DE BANCO
	clrf   PORTA      ;TODO EN 0 
	clrf   PORTB      ;TODO EN 0
	          
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
	               
	;Empesando con el sistema de velocidades, a elegir velocidad por colores
        
inicio  btfss   porta,0
	goto   NO      ;Sigue preguntando por los otros      
	call   demora1      ;Si es si va por una velocidad de 1 segundo
no1     btfsc   porta,0      ;Pregunto si solto el boton.
	goto   no1      ;pregunto cuando lo suelto
	movlw   .1      ;pongo .1 para indentificar la velocidades en la funcion de velocidad
	movwf   1AH      ;variable entre .1 a .5
	goto   F1      ;Funcion velocidad

	;Segunda pregunta de velocidad-----------------------------------------------    
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
	movlw   .16      ;.16 es que repite 16 veses 50mseg, Si el resultado da cero la velocidad es de 0,8seg
	movwf   30h      ;Donde pongo el dato de .16, variable del timer
	movlw   .61      ;50 mseg
	movwf   31h      ;Donde pongo el dato de .61=50mseg, variable del timer
	goto   juego      ;Empiesa el juego
   
	;comando de velocidad numero 3-------------------------------------------
NO10    movfw   2CH      ;.3 - .1 deberia dar cero si se preciono porta,0
	subwf   1AH,W
	btfss   status,2   ;Z = 1   el resultado dio cero
	goto   NO11      ;Z no vale 0, pregunto por los otros
	movlw   .12      ;.12 es que repite 12 veses 50mseg, Si el resultado da cero la velocidad es de 0,6seg
	movwf   30h      ;Donde pongo el dato de .12, variable del timer
	movlw   .61      ;50 mseg
	movwf   31h      ;Donde pongo el dato de .61=50mseg, variable del timer
	goto   juego      ;Empiesa el juego
         
	;comando de velocidad numero 4-------------------------------------------
NO11    movfw   2DH      ;.4 - .1 deberia dar cero si se preciono porta,0
	subwf   1AH,W
	btfss   status,2   ;Z = 1   el resultado dio cero
	goto   NO12      ;Z no vale 0, pregunto por los otros
	movlw   .10      ;.10 es que repite 10 veses 50mseg, Si el resultado da cero la velocidad es de 0,5seg
	movwf   30h      ;Donde pongo el dato de .10, variable del timer
	movlw   .61      ;50 mseg
	movwf   31h      ;Donde pongo el dato de .61=50mseg, variable del timer
	goto   juego      ;Empiesa el juego
           
	;comando de velocidad numero 5-------------------------------------------
NO12    movfw   2EH	;.5 - .1 deberia dar cero si se preciono porta,0
	subwf   1AH,W
	btfss   status,2   ;Z = 1   el resultado dio cero
	goto   inicio      ;Z no vale 0, pregunto por los otros
	movlw   .8      ;.8 es que repite 8 veses 50mseg, Si el resultado da cero la velocidad es de 0,4seg
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
w1      call   demora1		;Anti rebote de 50mseg
	btfsc   porta,0		;primera pregunta aleatoria
	goto	no17
	goto	R1		;es la parte donde se le resta para hacer lo de aleatorio		
no17	movlw	.1
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w1
		     
	;pregunta por el otro pulsador------------------------------------------
no13    btfss   porta,1      ;aprete el puerto A,1?
	goto    no14      ;si es no me voy a preguntar por los otros puertos
	movlw   .2      ;si es si
	movwf   40h      ;variable para restar despues
	bsf	portb,1      ;Prende el color del puertob,1
      	;Primera pregunta de la funcion aleatoria-------------------------------
w2      call	demora1		;Anti rebote de 50mseg
	btfsc   porta,1		;primera pregunta aleatoria
	goto	no18
	goto	R1
no18	movlw	.1
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w2
         
	;pregunta por el otro pulsador------------------------------------------
no14    btfss   porta,2      ;aprete el puerto A,2?
	goto   no15      ;si es no me voy a preguntar por los otros puertos
	movlw   .3      ;si es si
	movwf   40h      ;variable para restar despues
	bsf   portb,2      ;Prende el color del puertob,2
      	;Primera pregunta de la funcion aleatoria-------------------------------
w3      call   demora1      ;Anti rebote de 50mseg
	btfsc   porta,2      ;primera pregunta aleatoria
	goto	no19
	goto	R1
no19	movlw	.1
	addwf	49h,f		;Se le suma .1 al 49h que es una memoria
	goto	w3
	                 
	;pregunta por el otro pulsador------------------------------------------
no15    btfss   porta,3      ;aprete el puerto A,3?
	goto   no16      ;si es no me voy a preguntar por los otros puertos
	movlw   .4      ;si es si
	movwf   40h      ;variable para restar despues
	bsf   portb,3      ;Prende el color del puertob,3         
	;Primera pregunta de la funcion aleatoria-------------------------------
w4      call   demora1      ;Anti rebote de 50mseg
	btfsc   porta,3      ;primera pregunta aleatoria
	goto	no20
	goto	R1	
no20	movlw	.1
	addwf	49h,f		;;Se le suma .1 al 49h que es una memoria
	goto	w4
   
	;pregunta por el otro pulsador------------------------------------------
no16	btfss   porta,4      ;aprete el puerto A,4?
	goto    j1      ;si es no me voy a preguntar por los otros puertos
	movlw   .5      ;si es si
	movwf   40h      ;variable para restar despues
	bsf	portb,4      ;Prende el color del puertob,4 
	;Primera pregunta de la funcion aleatoria-------------------------------
w5	call   demora1      ;Anti rebote de 50mseg
	btfsc   porta,4      ;primera pregunta aleatoria
	goto	no21
	goto	R1	
no21	movlw	.1
	addwf	49h,f		;;Se le suma .1 al 49h que es una memoria
	goto	w5
	
 	;Funcion aleatorio de desconteo de 49H---------------------------------
R1	

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
p   	goto	inicio
 
  
	;Demoras de tiempos------------------------------------------------------
demorav	clrf	TMR0      ;TMR0=0 limpio el timer
	movfw   30h      ;variable (varia de .20 a .8)
	movwf   3DH      ;permanente
pipa    bcf	intcon,2
	movfw   31h		;variable (tengo .61 = 50mseg)
	movwf   TMR0		;Permanente, 31h le pasa el .61 al timer
Ni      btfss   intcon,2	;cuenta hasta llegar a cero
	goto	ni		;repite hasta llegar a cero
	goto	si9		;llego a cero intcon,2
si9     decfsz	3DH,F		;es la variable que se resta
	goto	pipa
	return
          
demora1	clrf   TMR0		;limpiando timer, hacer de 50 mseg
	movlw   d'255'		;Seria .61
	movwf   TMR0		;TMRO=178
N	btfss	intcon,2
	goto	N
	bcf	intcon,2
	return