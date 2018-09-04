#line 1 "C:/Users/as/Desktop/Eslam_Alaa/session7/paint.c"
#line 1 "c:/users/as/desktop/eslam_alaa/session7/types.h"


typedef unsigned char u8;
typedef char s8;
typedef unsigned int u16;
typedef int s16;
typedef unsigned long u32;
typedef long s32;
typedef unsigned long long u64;
typedef long long s64;
typedef float f32;
#line 2 "C:/Users/as/Desktop/Eslam_Alaa/session7/paint.c"
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_WR at GPIOE_ODR.B11;
sbit TFT_RD at GPIOE_ODR.B10;
sbit TFT_CS at GPIOE_ODR.B15;
sbit TFT_RS at GPIOE_ODR.B12;
sbit TFT_RST at GPIOE_ODR.B8;
sbit TFT_BLED at GPIOE_ODR.B9;

sbit DriveX_Left at GPIOB_ODR.B1;
sbit DriveX_Right at GPIOB_ODR.B8;
sbit DriveY_Up at GPIOB_ODR.B9;
sbit DriveY_Down at GPIOB_ODR.B0;
u32 colors[16]={CL_AQUA,CL_BLACK,CL_BLUE,CL_FUCHSIA,CL_GRAY,CL_GREEN,CL_LIME,CL_MAROON,CL_NAVY,CL_OLIVE,CL_PURPLE,CL_RED,CL_SILVER,CL_TEAL,CL_WHITE,CL_YELLOW};
u32 PenColor=1;
u8 shape=0;
u8 painted=0;
void Menu_Init(void);
void Screen_init(void)
{
 PenColor=1;
 shape=0;
 painted=0;
 TFT_Set_Default_Mode();

 TFT_Init_ILI9341_8bit(320,240);
 ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9);
 ADC1_Init();
 TP_TFT_Init(320, 240, 8, 9);
 TP_TFT_Set_ADC_Threshold(600);
 TFT_Fill_Screen(colors[14]);
 TP_TFT_Calibrate_Min();
 Delay_ms(500);
 TP_TFT_Calibrate_Max();
}
void Paint_Init(void)
{
 TFT_Fill_Screen(colors[14]);
 TFT_Set_Pen(colors[14],20);
 TFT_Rectangle(0,0,20,20);
 TFT_Write_Text("Clear",2,8);
 TFT_Set_Pen(colors[1],20);
 TFT_Rectangle(50,0,70,20);
 TFT_Set_Pen(colors[2],20);
 TFT_Rectangle(100,0,120,20);
 TFT_Set_Pen(colors[3],20);
 TFT_Rectangle(150,0,170,20);
 TFT_Set_Pen(colors[4],20);
 TFT_Rectangle(200,0,220,20);
 TFT_Set_Pen(colors[5],20);
 TFT_Rectangle(250,0,270,20);
 TFT_Set_Pen(colors[6],20);
 TFT_Rectangle(300,0,320,20);

 TFT_Set_Pen(colors[2],1);
 TFT_Rectangle(5,50,45,90);
 TFT_Set_Pen(colors[1],10);
 TFT_Circle(25,70,1);
 TFT_Set_Pen(colors[2],1);
 TFT_Rectangle(5,100,45,140);
 TFT_Set_Pen(colors[1],20);
 TFT_Circle(25,120,1);
 TFT_Set_Pen(colors[2],1);
 TFT_Rectangle(5,150,45,190);
 TFT_Set_Pen(colors[1],3);
 TFT_Circle(25,170,15);
 TFT_Set_Pen(colors[2],1);
 TFT_Rectangle(5,200,45,240);
 TFT_Set_Pen(colors[1],3);
 TFT_Rectangle(10,210,40,230);
 TFT_Set_Pen(colors[1],1);
 TFT_Rectangle(50,45,310,215);

 TFT_Write_Text("Back->",270,220);
}
void Paint(u32 X,u32 Y)
{
 extern u8 Page;
 if(Y<30)
 {
 if((X<50)&&(painted)){painted=0;Paint_Init();}
 else if(X<100)PenColor=1;
 else if(X<150)PenColor=2;
 else if(X<200)PenColor=3;
 else if(X<250)PenColor=4;
 else if(X<300)PenColor=5;
 else PenColor=6;
 }
 else if(X<50)
 {
 if(Y<100){shape=0;}
 else if(Y<150){shape=4;}
 else if(Y<200){shape=1;}
 else{shape=2;}
 }
 else if((X>60)&&(Y>55)&&(X<290)&&(Y<195))
 { painted++;
 if(shape==0){TFT_Set_Pen(colors[PenColor],10);TFT_Circle(X,Y,1);}
 else if(shape==1){TFT_Set_Pen(colors[PenColor],3);TFT_Circle(X,Y,20);}
 else if(shape==2){TFT_Set_Pen(colors[PenColor],3); TFT_Rectangle(X,Y,X+20,Y+20);}
 else {TFT_Set_Pen(colors[PenColor],20);TFT_Circle(X,Y,1);}
 }
 else if(Y>210 && X>270)
 {
 Page=0;
 Menu_Init();
 }
}
