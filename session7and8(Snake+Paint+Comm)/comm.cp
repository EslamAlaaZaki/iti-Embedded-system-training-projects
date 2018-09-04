#line 1 "C:/Users/as/Desktop/Eslam_Alaa/session7/comm.c"
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
#line 2 "C:/Users/as/Desktop/Eslam_Alaa/session7/comm.c"
void Menu_Init(void);
void Comm_Init(void)
{
 GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_ALL);
 TFT_Fill_Screen(CL_AQUA);
 UART1_Init(115200);
 TFT_Set_Pen(CL_BLACK,3);
 TFT_Rectangle(0,2,315,70);
 TFT_Write_Text("cmd:",8,25);
 TFT_Rectangle(0,70,315,140);
 TFT_Write_Text("Start",150,105);
 TFT_Rectangle(0,140,315,210);
 TFT_Write_Text("Stop",150,175);
 TFT_Write_Text("Back->",270,220);

}

void comm(u32 X,u32 Y,u32 number, u32 flag)
{ extern u8 Page;
 static u8 start=0;
 static u8 message[10];
 static u8 num=0;
 if(flag==0)
 {
 if((Y>70)&&(Y<140))
 {
 start=1;
 }
 else if((Y>140)&&(Y<210))
 {
 if(start)
 { start=0;
 if(num!=0)
 {
 UART1_Write_Text(message);
 num=0;
 TFT_Set_Font(TFT_defaultFont,CL_AQUA,FO_HORIZONTAL);
 TFT_Write_Text(message,40,25);
 TFT_Set_Font(TFT_defaultFont,CL_BLACK,FO_HORIZONTAL);
 }
 }
 }
 else if(Y>210 && X>270)
 {
 start=0;
 num=0;
 Page=0;
 Menu_Init();
 }


 }
 else
 { if(start)
 if(num<9)
 {
 message[num]=number+48;
 message[num+1]=0;
 TFT_Write_Text(message,40,25);
 num++;
 }
 }

}
