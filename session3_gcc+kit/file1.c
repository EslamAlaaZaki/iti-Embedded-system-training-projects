#include "types.h"

u8 fun(void)
{
  static u8 counter =0;
  counter ++;
  return counter;
}

