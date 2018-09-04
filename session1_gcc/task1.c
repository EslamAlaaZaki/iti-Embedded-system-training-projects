#include <stdio.h>
void main(void)
{
  char counter=1;
  for(;counter<=10;counter=counter+2) 
      {
         printf("%d\n",counter);
         if(counter==9)counter=0;
      }
}