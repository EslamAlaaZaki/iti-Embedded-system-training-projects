#include "types.h"

u8 fun(void);
void funpower(u32 x, u32 y);
void funprint(void);
 
void main(void)
{
   u32 x=2,y=0;
   while(fun()<20)
   {
	funpower(x,y+fun());
        funprint();     
   }
}