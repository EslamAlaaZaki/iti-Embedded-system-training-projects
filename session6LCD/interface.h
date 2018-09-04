#ifndef INTERFACE_H
#define INTERFACE_H
#define Set_Bit(reg,bit) reg|=(1<<bit)
#define Clear_Bit(reg,bit) reg&=~(1<<bit)
#define Get_Bit(reg,bit,output) output=(reg>>bit)&1
#define Toggle_Bit(reg,bit) reg^=(1<<bit)
#define Set_Port(reg) reg=~(0)
#define Clear_Port(reg) reg=0
#define Toggle_Port(reg) reg^=~(0)
#define Set_Half_Port_Low(reg) reg|=(0xff)
#define Set_Half_Port_High(reg) reg|=(0xff00)
#define Clear_Half_Port_Low(reg) reg&=(0xff00)
#define Clear_Half_Port_High(reg) reg&=(0x00ff)
#define Toggle_Half_Port_Low(reg) reg^=(0x00ff)
#define Toggle_Half_Port_High(reg) reg^=(0xff00)
#endif