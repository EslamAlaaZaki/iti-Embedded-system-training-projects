#include "debug.h"
void blank(unsigned long* reg,int pin)
{       unsigned long counter=0;
          for(;counter<Times;counter++)
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
          for(;counter<Times;counter++)
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
          for(;counter<Times;counter++)
          {
                *reg=0xffff;
                Delay_ms(200);
                *reg=0x0;
                Delay_ms(200);

          }

}

