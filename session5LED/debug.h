#ifndef DEBUG_H
#define DEBUG_H
void blank(unsigned long* reg,int pin);
void blank_port(unsigned long* reg,unsigned long value);
void blank_port_all_pins(unsigned long* reg);
#define Times 5
#endif
