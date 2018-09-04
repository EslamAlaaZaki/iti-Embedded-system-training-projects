#line 1 "C:/Users/as/Desktop/Eslam_Alaa/session9/task1.c"
#line 1 "c:/users/as/desktop/eslam_alaa/session9/types.h"


typedef unsigned char u8;
typedef char s8;
typedef unsigned int u16;
typedef int s16;
typedef unsigned long u32;
typedef long s32;
typedef unsigned long long u64;
typedef long long s64;
typedef float f32;
#line 5 "C:/Users/as/Desktop/Eslam_Alaa/session9/task1.c"
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



void BT_Configure() {


 UART3_Write_Text("$$$");
 Delay_ms(500);
 Delay_ms(500);

 UART3_Write_Text("SN,BlueTooth-Islam");
 UART3_Write(13);
 Delay_ms(500);
 Delay_ms(500);

 UART3_Write_Text("SO,Slave");
 UART3_Write(13);
 Delay_ms(500);
 Delay_ms(500);

 UART3_Write_Text("SM,0");
 UART3_Write(13);
 Delay_ms(500);
 Delay_ms(500);

 UART3_Write_Text("SA,1");
 UART3_Write(13);
 Delay_ms(500);
 Delay_ms(500);


 UART3_Write_Text("SP,1234");
 UART3_Write(13);
 Delay_ms(500);
 Delay_ms(500);


 UART3_Write_Text("---");
 UART3_Write(13);
 Delay_ms(500);
 Delay_ms(500);
}





void main() {


 u8 txt[60];
 Screen_init();
 TFT_Fill_Screen(colors[11]);
 UART3_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PD89);
 Delay_ms(100);


BT_Configure();



Delay_ms(4000);




 while (1)
 {
 u16 i;
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
