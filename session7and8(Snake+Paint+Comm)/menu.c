#include "types.h"
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