#include "types.h"


//////////////////////////////////////////////////
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_WR at GPIOE_ODR.B11;
sbit TFT_RD at GPIOE_ODR.B10;
sbit TFT_CS at GPIOE_ODR.B15;
sbit TFT_RS at GPIOE_ODR.B12;
sbit TFT_RST at GPIOE_ODR.B8;
sbit TFT_BLED at GPIOE_ODR.B9;
///////////////////////////////////////
 sbit DriveX_Left at GPIOB_ODR.B1;
sbit DriveX_Right at GPIOB_ODR.B8;
sbit DriveY_Up at GPIOB_ODR.B9;
sbit DriveY_Down at GPIOB_ODR.B0;
//////////////////////////////////////////

u32 colors[16]={CL_AQUA,CL_BLACK,CL_BLUE,CL_FUCHSIA,CL_GRAY,CL_GREEN,CL_LIME,CL_MAROON,CL_NAVY,CL_OLIVE,CL_PURPLE,CL_RED,CL_SILVER,CL_TEAL,CL_WHITE,CL_YELLOW};
u32 PenColor=1;
u8  shape=0;
u8  painted=0;
void Screen_init(void)
{
   PenColor=1;
   shape=0;
   painted=0;
   TFT_Set_Default_Mode();
   //TFT_Init_ILI9341_8bit(240,320);
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

//////////////////////////////////////////////

void  BT_Configure() {


    UART3_Write_Text("$$$");                  // Enter command mode
    Delay_ms(500);
        Delay_ms(500);

    UART3_Write_Text("SN,BlueTooth-Islam");   // Name of device
    UART3_Write(13);                          // CR
    Delay_ms(500);
    Delay_ms(500);

    UART3_Write_Text("SO,Slave");             // Extended status string
    UART3_Write(13);                          // CR
    Delay_ms(500);
        Delay_ms(500);

    UART3_Write_Text("SM,0");                 // Set mode (0 = slave, 1 = master, 2 = trigger, 3 = auto, 4 = DTR, 5 = ANY)
    UART3_Write(13);                          // CR
    Delay_ms(500);
        Delay_ms(500);

    UART3_Write_Text("SA,1");                 // Authentication (1 to enable, 0 to disable)
    UART3_Write(13);                          // CR
    Delay_ms(500);
        Delay_ms(500);


    UART3_Write_Text("SP,1234");              // Security pin code (mikroe)
    UART3_Write(13);                          // CR
    Delay_ms(500);
        Delay_ms(500);


    UART3_Write_Text("---");                  // Security pin code (mikroe)
    UART3_Write(13);                          // CR
    Delay_ms(500);
        Delay_ms(500);
}





void main() {


   u8 txt[60];
    Screen_init();
   TFT_Fill_Screen(colors[11]);
  UART3_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PD89);
  Delay_ms(100);                // UART3 Init

    // Configure BlueTooth-Click module
BT_Configure();

  //  Wait 4 sec to connect

Delay_ms(4000);

  //Connected


  while (1) 
         { 
             u16 i;                    // Endless loop
             if(UART3_Data_Ready())
             {  
                 TFT_Set_Font(TFT_defaultFont, CL_RED, FO_HORIZONTAL);
                 TFT_Write_Char(i,150,150);
                 i= UART3_Read();
                 TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
                 TFT_Write_Char(i,150,150);
             }


         }
}