#include <stdio.h>
void main(void)
{

  float operand1,operand2,result;
  char operator,again;
  scanf("%f%c%f",&operand1,&operator,&operand2);
  switch(operator)
  {
     case '-': result=operand1-operand2;break;
     case '+': result=operand1+operand2;break;
     case '*': result=operand1*operand2;break;
     case '/': result=operand1/operand2;break;
     
  }
  printf("result=%f",result);
  

}