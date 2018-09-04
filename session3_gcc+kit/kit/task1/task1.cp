#line 1 "C:/Users/lab3/Desktop/Eslam_Alaa/session3/kit/task1/task1.c"
void main()
{
 GPIO_Digital_Output(&GPIOA_ODR,_GPIO_PINMASK_ALL);
 GPIOA_ODR=0xffffffff;
 while(1){}
}
