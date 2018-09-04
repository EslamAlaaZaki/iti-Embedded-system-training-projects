#line 1 "C:/Users/as/Desktop/Eslam_Alaa/session7/menu.c"
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
#line 2 "C:/Users/as/Desktop/Eslam_Alaa/session7/menu.c"
void Paint_Init(void);
void Comm_Init(void);
void Game_Init(void);
void Menu_Init(void)
{
 TFT_Fill_Screen(CL_GRAY);
 TFT_Set_Pen(CL_NAVY,3);
 TFT_Rectangle(0,2,315,80);
 TFT_Write_Text("Game",150,30);
 TFT_Rectangle(0,80,315,160);
 TFT_Write_Text("Communication",130,110);
 TFT_Rectangle(0,160,315,235);
 TFT_Write_Text("Paint",150,180);
}

void Menu(u32 Y)
{
 extern u8 Page;
 if((Y>80)&&(Y<160)){Page=2;Comm_Init();}
 else if((Y>160)&&(Y<240)){Page=3;Paint_Init(void);}
 else if(Y<80) {Page=1;Game_Init();}
}
