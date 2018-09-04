void main()
{
       GPIO_Digital_Output(&GPIOA_ODR,_GPIO_PINMASK_ALL);
       GPIOA_ODR=0xffffffff;
       while(1){}
}