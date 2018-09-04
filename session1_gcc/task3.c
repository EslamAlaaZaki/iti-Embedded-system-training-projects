#include <stdio.h>
void main(void)
{
  char num;
  printf("Enter the number:");
  scanf("%d",&num);
  if(num&1)
    { 
      printf("%d is an odd number",num);
    }
   else
    {
       printf("%d is an even number",num);
    }
}