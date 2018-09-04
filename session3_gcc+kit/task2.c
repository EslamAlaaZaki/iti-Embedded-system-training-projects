#include <stdio.h>
#define x
void main (void)
{
   printf("Hello");
   #ifndef x
   printf(" World");
   #endif
   
}
