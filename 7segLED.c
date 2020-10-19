// ref: https://hackprojects.wordpress.com/forum/avr/interfacing-7-segment-to-avr-microcontroller-atmega-8/

// ******************************************************
// Project: 0x00 to 0x9F display in 7-segments using atmega328p
// Author: xiaolaba
// two 7-segments LED used, one 8bit PORTD used
// ******************************************************

// port to Arduino UNO, ATmega168p
// PD0 - PD6, segA-SegG
// PD7, source current, driver pin for two digits, digit1 = direct drive, digit2 = through an simpele inverter
// Arduino UNO pin out D0-D7

//// enable one of following for experimnent
//#define ORIGINAL_BUG
//#define TEST
//#define FIX
#define BETTER_ABSTRACTION 1


#define F_CPU 16000000UL    // change to 16Mhz, ARduino UNO/Nano, 168p/328p
#include <avr/io.h>
#include <util/delay.h>

#define driverPort     DDRD    // PD0 - PD6, control sengments, segA ~ segG, DP not used
#define segmentDriver  PORTD   // PD0 - PD6, control sengments, segA ~ segG, DP not used

#define comDriver PD7             // PD7, power supply to common anodes, multiplexing display
#define showUnits  (0<<comDriver)   // PD7=0, show Units, no power to Tens, inverter supply power to Units  
#define showTens   (1<<comDriver)   // PD7=1, show Tens, inverter off, no power to Units


#ifdef BETTER_ABSTRACTION
// count 0x00 ~ 0xFF
int main(void)
{
// 计, κ计, 计, 计
// Thousands, Hundreds, Tens, Units
 uint8_t Thousands, Hundreds, Tens, Units;  // not used yet, Thousands & Hundreds
 
//uint8_t a[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7c,0x07,0x7f,0x67};  // bug, intentionally?


uint8_t lookupTable[16]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x27,0x7F,0x6F,  // 7seg LED map for "0" ~ "9" 
                         0x77,0x7C,0x39,0x5E,0x79,0x71};                     // 7seg LED map for "A,b,C,d,E,F"

 driverPort=0xff;  // PD0 - PD7, all output

 while(1)
 {
  for(Tens = 0; Tens < 16; Tens ++)     // , count 0 - F
  {
   for(Units = 0; Units < 16; Units ++) // , count 0 - F
   {       
     //segmentDriver=lookupTable[Tens] + showTens;  // for common cathode
     segmentDriver=~lookupTable[Tens] + showTens;   // for common anode
     _delay_ms(200);
     
     //segmentDriver=lookupTable[Units] + showUnits; // for common cathode   
     segmentDriver=~lookupTable[Units] + showUnits;  // for common anode
     _delay_ms(400);
   }
  }
 }
}
#endif





#ifdef TEST
int main(void) {
//uint8_t a[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7c,0x07,0x7f,0x67};  // bug, intentionally?
// LED map for "0" ~ "9"
uint8_t lookupTable[10]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x27,0x7F,0x6F};
uint8_t i;
 DDRD = 0xff;
// test segment A-F
 while(1) {
    for (i=0; i<6; i++){
      segmentPort = ~(1<<i) & 0x7f;  // for common anode
      _delay_ms(10);    
      segmentPort = ~(1<<i) & 0xff; // for common anode 
      _delay_ms(100);    
    } 

// test segment G, flash 3 times
    for (i=0; i<3; i++){
      segmentPort = ~(1<<PD6) & 0x7f;  // for common anode
      _delay_ms(1000);    
      segmentPort = ~(1<<PD6) & 0xff; // for common anode 
      _delay_ms(1000);
    }
 }
}
#endif



#ifdef FIX
// xiaolaba, modified code, fix lookup table a[10], uses one PORTD only
int main(void)
{
 DDRD=0xff;
 int i,j,k,l,a[10]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x27,0x7F,0x6F};
 while(1)
 {
  for(k=0;k<10;k++)
  {
   for(l=0;l<10;l++)
   {
   //PORTD=a[k] + (1<<PD7);   // for common cathode 7seg LED
   PORTD=~a[k] + (1<<PD7);   // for common anode 7seg LED
   _delay_ms(100);
   //PORTD=a[l] + (0<<PD7);   // for common cathode 7seg LED
   PORTD=~a[l] + (0<<PD7);   // for common anode 7seg LED
   _delay_ms(1000);
   }
  }
 }
}
#endif





#ifdef ORIGINAL_BUG

// original code, 
// bug of lookup table, 
// for commond cathode 7 seg LED only,
// uses PORTB & PORTB

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
 int i,j,k,l,a[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7c,0x07,0x7f,0x67}; // bug, intentionally?
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

#endif