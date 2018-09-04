#include <stdio.h>
void main(void)
{
  unsigned char x;
  char y;
  for(x=0;x<=256;x++) {y=x;printf("y=%d\n",y);}
}