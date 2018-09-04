#line 1 "C:/Users/lab3/Desktop/Eslam_Alaa/session4/task1/task1.c"

void blank(unsigned long* reg,int pin)
{
 *reg&=~(1<<pin);
 Delay_ms(200);
 *reg|=(1<<pin);
 Delay_ms(200);
 *reg&=~(1<<pin);
 Delay_ms(200);
 *reg|=(1<<pin);
 Delay_ms(200);
 *reg&=~(1<<pin);
 Delay_ms(200);
 *reg|=(1<<pin);
 Delay_ms(200);
}
void main()
{

int index=0;
int b=15;
unsigned long* output[4]={&GPIOA_ODR,&GPIOB_ODR,&GPIOC_ODR,&GPIOD_ODR};
GPIO_Digital_Input(&GPIOE_IDR,_GPIO_PINMASK_11|_GPIO_PINMASK_12);
GPIO_Digital_Output(&GPIOA_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Output(&GPIOB_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2|_GPIO_PINMASK_4);
GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_5);


while(1)
{
 if(Button(&GPIOE_IDR, 11, 1, 1))
 {
 *output[index]=0;
 b--;
 if(b==-1)
 {
 index++;
 index&=3;
 if(index==0)b=15;
 else if(index==1)b=12;
 else if(index==2)b=13;
 else if(index==3)b=15;
 }
 *output[index]|=1<<b;
 while(Button(&GPIOE_IDR, 11, 1, 1)) {}
 }
 else if(Button(&GPIOE_IDR, 12, 1, 1))
 {
 *output[index]=0;
 b++;
 if(index==0 && b==16){b=0;index=3;}
 else if(index==1&&b==13){b=0;index=0;}
 else if(index==2&&b==14){b=0;index=1;}
 else if(index==3&&b==16){b=0;index=2;}
 *output[index]|=1<<b;
 while(Button(&GPIOE_IDR, 12, 1, 1)) {}
 }
 else if(Button(&GPIOD_IDR, 4, 1, 1))
 {
 while(Button(&GPIOD_IDR, 4, 1, 1)) {}
 if(b==3||b==7||b==11||b==15)
 {
 blank(output[index],b);
 }
 else
 {
 *output[index]=0;
 b++;
 *output[index]|=(1<<b);

 }
 }
 else if(Button(&GPIOB_IDR, 5, 1, 1))
 {
 while(Button(&GPIOB_IDR, 5, 1, 1)) {}
 if(b==0||b==4||b==8||b==12)
 {
 blank(output[index],b);
 }
 else
 {
 *output[index]=0;
 b--;
 *output[index]|=(1<<b);

 }
 }
 else if(Button(&GPIOD_IDR, 2, 1, 1))
 {
 while(Button(&GPIOD_IDR, 2, 1, 1)) {}
 if(b<12)
 {

 *output[index]=0;
 b=b+4;
 *output[index]|=(1<<b);
 }
 else
 { if(index==0)
 {
 blank(output[index],b);
 }
 else
 {
 *output[index]=0;
 b=b-12;
 index--;
 *output[index]|=(1<<b);
 }
 }
 }

 else if(Button(&GPIOA_IDR, 6, 1, 1))
 {
 while(Button(&GPIOA_IDR, 6, 1, 1)) {}
 if(b>3)
 {
 *output[index]=0;
 b=b-4;
 *output[index]|=(1<<b);
 }
 else
 { if(index==3)
 {
 blank(output[index],b);
 }
 else
 {
 *output[index]=0;
 b=b+12;
 index++;
 *output[index]|=(1<<b);
 }
 }
 }
}


}
