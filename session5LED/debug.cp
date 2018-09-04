#line 1 "C:/Users/lab3/Desktop/Eslam_Alaa/session5/debug.c"
#line 1 "c:/users/lab3/desktop/eslam_alaa/session5/debug.h"


void blank(unsigned long* reg,int pin);
void blank_port(unsigned long* reg,unsigned long value);
void blank_port_all_pins(unsigned long* reg);
#line 2 "C:/Users/lab3/Desktop/Eslam_Alaa/session5/debug.c"
void blank(unsigned long* reg,int pin)
{ unsigned long counter=0;
 for(;counter< 5 ;counter++)
 {
 *reg|=(1<<pin);
 Delay_ms(200);
 *reg&=~(1<<pin);
 Delay_ms(200);
 }
}
void blank_port(unsigned long* reg,unsigned long value)
{
 unsigned long counter=0;
 for(;counter< 5 ;counter++)
 {
 *reg=value;
 Delay_ms(200);
 *reg=0;
 Delay_ms(200);

 }

}
void blank_port_all_pins(unsigned long* reg)
{
 unsigned long counter=0;
 for(;counter< 5 ;counter++)
 {
 *reg=0xffff;
 Delay_ms(200);
 *reg=0x0;
 Delay_ms(200);

 }

}
