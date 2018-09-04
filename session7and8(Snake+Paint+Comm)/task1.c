#include "types.h"
void Screen_init(void);
void Paint_Init(void);
void Paint(u32 X,u32 Y);
void Comm_Init(void);
void comm(u32 X,u32 Y,u32 number, u32 flag);
void Game_Init(void);
void Game(void);
void Menu_Init(void);
void Menu(u32 Y);
u8 Page=2;
void main() {
  u16 x,y;
  u8 i;
  Screen_Init();
  Menu_Init();
  while(1)
  {

     if(Page==0)
     {
          if(TP_TFT_Press_Detect())
          {
             for(i=0;i<10;i++)TP_TFT_Get_Coordinates(&x,&y);
             Menu(y);
          }
     }
     else if(Page==1)
     {

       Game();


     }
     else if(Page==2)
     {
        if(TP_TFT_Press_Detect())
     {
        for(i=0;i<10;i++)TP_TFT_Get_Coordinates(&x,&y);
        comm(x,y,0, 0);
     }
      if(Button(&GPIOD_IDR, 0, 1, 1))
      {
          while(Button(&GPIOD_IDR, 0, 1, 1)){}
          comm(0,0,0, 1);

      }
     if(Button(&GPIOD_IDR, 1, 1, 1))
      {
          while(Button(&GPIOD_IDR, 1, 1, 1)){}
          comm(0,0,1, 1);

      }
      if(Button(&GPIOD_IDR, 2, 1, 1))
      {
          while(Button(&GPIOD_IDR, 2, 1, 1)){}
          comm(0,0,2, 1);

      }
      if(Button(&GPIOD_IDR, 3, 1, 1))
      {
          while(Button(&GPIOD_IDR, 3, 1, 1)){}
          comm(0,0,3, 1);

      }
      if(Button(&GPIOD_IDR, 4, 1, 1))
      {
          while(Button(&GPIOD_IDR, 4, 1, 1)){}
          comm(0,0,4, 1);

      }
      if(Button(&GPIOD_IDR, 5, 1, 1))
      {
          while(Button(&GPIOD_IDR, 5, 1, 1)){}
          comm(0,0,5, 1);

      }
      if(Button(&GPIOD_IDR, 6, 1, 1))
      {
          while(Button(&GPIOD_IDR, 6, 1, 1)){}
          comm(0,0,6, 1);

      }
      if(Button(&GPIOD_IDR, 7, 1, 1))
      {
          while(Button(&GPIOD_IDR, 7, 1, 1)){}
          comm(0,0,7, 1);

      }
      if(Button(&GPIOD_IDR, 8, 1, 1))
      {
          while(Button(&GPIOD_IDR, 8, 1, 1)){}
          comm(0,0,8, 1);

      }
      if(Button(&GPIOD_IDR, 9, 1, 1))
      {
          while(Button(&GPIOD_IDR, 9, 1, 1)){}
          comm(0,0,9, 1);

      }

     }
     else if(Page==3)
     {
          if(TP_TFT_Press_Detect())
          {
             for(i=0;i<10;i++)TP_TFT_Get_Coordinates(&x,&y);
             Paint(x,y);
          }
     }

  }

}
