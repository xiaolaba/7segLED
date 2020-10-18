// https://hackprojects.wordpress.com/forum/avr/interfacing-7-segment-to-avr-microcontroller-atmega-8/
// ******************************************************
// Project: 0 to 99 display in 7-segments using atmega8
// Author: Hack Projects India
// Module description: Operate two 7-segments
// ******************************************************
#define F_CPU 8000000UL
#include <avr/io.h>
#include<util/delay.h>

int main(void)
{
 DDRB=0xff;
 DDRD=0xff;
 int i,j,k,l,a[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7c,0x07,0x7f,0x67};
 while(1)
 {
  for(k=0;k<10;k++)
  {
   for(l=0;l<10;l++)
   {
   PORTD=~0x02;
   PORTB=a[k];
   _delay_ms(100);
   PORTD=~0x01;
   PORTB=a[l];
   _delay_ms(1000);
   }
  }
 }
}