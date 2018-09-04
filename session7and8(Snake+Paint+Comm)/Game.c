#include "types.h"

void Menu_Init(void);
void Game_Init(void)
{

    GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2|_GPIO_PINMASK_4);
    GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
    GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_5);
    GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_15);
    TFT_Fill_Screen(CL_BLACK);
    TFT_Set_Pen(CL_RED,10);
    TFT_Circle(150,150,1);
    TFT_Set_Pen(CL_SILVER,10);
    TFT_Circle(25,120,1);

}
void Game(void)
{
   extern u8 Page;
   static s32 X=150,Y=150,Xtarget=25,Ytarget=120,raduis=10,step=1;
   static u8 flag=0;
   s32 r =(X-Xtarget)*(X-Xtarget)+(Y-Ytarget)*(Y-Ytarget);
   GPIOD_ODR^=1<<14;
   r=sqrt(r);
   if(r<=((raduis+10)/2))
   {
      raduis+=2;
      step++;
      TFT_Set_Pen(CL_BLACK,10);
      TFT_Circle(Xtarget,Ytarget,1);
      srand(Xtarget);
      Xtarget=rand()%320;
      srand(Ytarget);
      Ytarget=rand()%240;
      TFT_Set_Pen(CL_SILVER,10);
      TFT_Circle(Xtarget,Ytarget,1);
   }
   if(Button(&GPIOD_IDR, 4, 1, 0)) flag=0;
   else if(Button(&GPIOD_IDR, 2, 1, 0)) flag=1;
   else if(Button(&GPIOB_IDR, 5, 1, 0)) flag=2;
   else if(Button(&GPIOA_IDR, 6, 1, 0)) flag=3;
   else if(Button(&GPIOD_IDR, 15, 1, 1)) 
   {
        while(Button(&GPIOD_IDR, 15, 1, 1)){} 
        Page=0;
        flag=0;
        X=150,Y=150,Xtarget=25,Ytarget=120,raduis=10,step=1;
        TFT_Set_Pen(CL_BLACK,10);
        TFT_Circle(Xtarget,Ytarget,1);
        Menu_Init();
        return;
   }
   TFT_Set_Pen(CL_BLACK,raduis);
   TFT_Circle(X,Y,1);
   if(flag==0)
   {
       Y=Y-step;
       if(Y<0)Y=240;
       TFT_Set_Pen(CL_RED,raduis);
       TFT_Circle(X,Y,1);
   }
   else if(flag==1)
   {
       X=X-step;
       if(X<0)X=320;
       TFT_Set_Pen(CL_RED,raduis);
       TFT_Circle(X,Y,1);
   }
    else if(flag==2)
   {
       Y=Y+step;
       if(Y>240)Y=0;
       TFT_Set_Pen(CL_RED,raduis);
       TFT_Circle(X,Y,1);
   }
    else if(flag==3)
   {
       X=X+step;
       if(X>320)X=0;
       TFT_Set_Pen(CL_RED,raduis);
       TFT_Circle(X,Y,1);
   }


}