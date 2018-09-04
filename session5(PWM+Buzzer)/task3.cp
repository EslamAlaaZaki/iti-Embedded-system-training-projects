#line 1 "C:/Users/lab3/Desktop/Eslam_Alaa/session5-3/task3.c"
#line 1 "c:/users/lab3/desktop/eslam_alaa/session5-3/interface.h"
#line 1 "c:/users/lab3/desktop/eslam_alaa/session5-3/types.h"


typedef unsigned char u8;
typedef char s8;
typedef unsigned int u16;
typedef int s16;
typedef unsigned long u32;
typedef long s32;
typedef unsigned long long u64;
typedef long long s64;
typedef float f32;
#line 4 "C:/Users/lab3/Desktop/Eslam_Alaa/session5-3/task3.c"
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
