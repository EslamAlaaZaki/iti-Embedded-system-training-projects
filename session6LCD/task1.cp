#line 1 "C:/Users/as/Desktop/Eslam_Alaa/session6/task1.c"
#line 1 "c:/users/as/desktop/eslam_alaa/session6/interface.h"
#line 1 "c:/users/as/desktop/eslam_alaa/session6/types.h"


typedef unsigned char u8;
typedef char s8;
typedef unsigned int u16;
typedef int s16;
typedef unsigned long u32;
typedef long s32;
typedef unsigned long long u64;
typedef long long s64;
typedef float f32;
#line 3 "C:/Users/as/Desktop/Eslam_Alaa/session6/task1.c"
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_WR at GPIOE_ODR.B11;
sbit TFT_RD at GPIOE_ODR.B10;
sbit TFT_CS at GPIOE_ODR.B15;
sbit TFT_RS at GPIOE_ODR.B12;
sbit TFT_RST at GPIOE_ODR.B8;
sbit TFT_BLED at GPIOE_ODR.B9;
void main() {
u32 x=105,x1=120,y=152,y1=160,xold,x1old,yold,y1old;
u8 flag=0;
u32 colors[16]={CL_AQUA,CL_BLACK,CL_BLUE,CL_FUCHSIA,CL_GRAY,CL_GREEN,CL_LIME,CL_MAROON,CL_NAVY,CL_OLIVE,CL_PURPLE,CL_RED,CL_SILVER,CL_TEAL,CL_WHITE,CL_YELLOW};
u8 font=14;
u8 background=1;
GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2|_GPIO_PINMASK_4|_GPIO_PINMASK_12|_GPIO_PINMASK_13|_GPIO_PINMASK_14|_GPIO_PINMASK_15);
GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_5);
TFT_Set_Default_Mode();
TFT_Init_ILI9341_8bit(240,320);
TFT_Fill_Screen(colors[background]);
TFT_Set_Pen(CL_WHITE, 5);
TFT_Circle(x1, y1, 2);
while(1)
{

 xold=x;
 yold=y;
 x1old=x1;
 y1old=y1;
 if(Button(&GPIOD_IDR, 4, 1, 1)){if(x1<240){x++;x1++;flag=1;}}
 else if(Button(&GPIOB_IDR, 5, 1, 1)){if(x1>0){x--;x1--;flag=1;}}
 else if(Button(&GPIOD_IDR, 2, 1, 1)){if(y1>0){y1--;y--;flag=1;}}
 else if(Button(&GPIOA_IDR, 6, 1, 1)){if(y1<320){y++;y1++;flag=1;}}
 if(Button(&GPIOD_IDR, 12, 1, 1)){flag=1;font=(font+1);if(font==16)font=0;}
 else if(Button(&GPIOD_IDR, 13, 1, 1)){flag=1;;font=(font-1);if(font>16)font=16;}
 else if(Button(&GPIOD_IDR, 14, 1, 1)){background=(background+1);if(background==16)background=0;TFT_Fill_Screen(colors[background]);flag=1;}
 else if(Button(&GPIOD_IDR, 15, 1, 1)){background=(background-1);if(background>16)background=16;TFT_Fill_Screen(colors[background]);flag=1;}
 if(flag)
 {
 flag=0;
 TFT_Set_Pen(colors[background], 5);
 TFT_Circle(x1old, y1old, 2);
 Delay_ms(10);


 TFT_Set_Pen(colors[font], 5);
 TFT_Circle(x1, y1, 2);
 Delay_ms(10);


 }





}




}
