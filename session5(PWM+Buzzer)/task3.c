 #include "interface.h"
#include "types.h"

void buzzer(u8 frequency_KHz,f32 Duty,u32 Time_s )
{
     f32 Period_Time_us=1000.0/frequency_KHz;
    u32 high=Period_Time_us*Duty;
    u32 low= Period_Time_us-high;
    u32 counter=0;
    u64 counter1;
     u64 num_of_cycles=((u64)Time_s*1000000)/(u64)Period_Time_us;
     for(counter1=0;counter1<num_of_cycles;counter1++)
     {
                GPIOE_ODR|=1<<14;
                for(counter=0;counter<high;counter++)Delay_us(1);
                GPIOE_ODR&=~(1<<14);
                for(counter=0;counter<low;counter++)Delay_us(1);
     }
}
void main() {
  GPIO_Digital_Output(&GPIOE_ODR,_GPIO_PINMASK_14);
     buzzer(25,0.5,5);
     Delay_ms(5000);


}