#include <16F877A.h>
#fuses XT,NOWDT
#use delay( clock = 4000000 )   // Reloj  de 4 MHz
#BYTE TRISB = 0x86            // TRISB en 86h.
#BYTE PORTB = 0x06            // PORTB en 06h.
#BYTE OPTION_REG = 0x81      //OPTION_REG en 81h.
void main() {
   bit_clear(OPTION_REG,7);      // Habilitacion Pull-up
   bit_set(TRISB,0);            //B0 como entrada
   bit_set(TRISB,2);            //B2 como entrada   
   bit_clear(TRISB,1);         // B1 como salida
   bit_clear(TRISB,3);         // B1 como salida
   bit_clear(PORTB,7);         // apaga LED
   while (1) {
   if (bit_test(portb,0) == 1 )  //Si RB0 es 1 apaga el LED
      bit_set(portb,1);                        
   else
      bit_clear(portb,1);         //Si RB0=0 no es apretado
   if (bit_test(portb,2) == 1 )  //Si RB2 es 1 apaga el LED
      bit_set(portb,3); 
   else 
      bit_clear(portb,3);         //Si RB0=0 no es apretado
   }
}  
