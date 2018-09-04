_Screen_init:
;task1.c,24 :: 		void Screen_init(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;task1.c,26 :: 		PenColor=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenColor+0)
MOVT	R0, #hi_addr(_PenColor+0)
STR	R1, [R0, #0]
;task1.c,27 :: 		shape=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_shape+0)
MOVT	R0, #hi_addr(_shape+0)
STRB	R1, [R0, #0]
;task1.c,28 :: 		painted=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_painted+0)
MOVT	R0, #hi_addr(_painted+0)
STRB	R1, [R0, #0]
;task1.c,29 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;task1.c,31 :: 		TFT_Init_ILI9341_8bit(320,240);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;task1.c,32 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9);
MOVW	R0, #768
BL	_ADC_Set_Input_Channel+0
;task1.c,33 :: 		ADC1_Init();
BL	_ADC1_Init+0
;task1.c,34 :: 		TP_TFT_Init(320, 240, 8, 9);
MOVS	R3, #9
MOVS	R2, #8
MOVS	R1, #240
MOVW	R0, #320
BL	_TP_TFT_Init+0
;task1.c,35 :: 		TP_TFT_Set_ADC_Threshold(600);
MOVW	R0, #600
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;task1.c,36 :: 		TFT_Fill_Screen(colors[14]);
MOVW	R0, #lo_addr(_colors+56)
MOVT	R0, #hi_addr(_colors+56)
LDR	R0, [R0, #0]
BL	_TFT_Fill_Screen+0
;task1.c,37 :: 		TP_TFT_Calibrate_Min();
BL	_TP_TFT_Calibrate_Min+0
;task1.c,38 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Screen_init0:
SUBS	R7, R7, #1
BNE	L_Screen_init0
NOP
NOP
;task1.c,39 :: 		TP_TFT_Calibrate_Max();
BL	_TP_TFT_Calibrate_Max+0
;task1.c,40 :: 		}
L_end_Screen_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Screen_init
_BT_Configure:
;task1.c,44 :: 		void  BT_Configure() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;task1.c,47 :: 		UART3_Write_Text("$$$");                  // Enter command mode
MOVW	R0, #lo_addr(?lstr1_task1+0)
MOVT	R0, #hi_addr(?lstr1_task1+0)
BL	_UART3_Write_Text+0
;task1.c,48 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure2:
SUBS	R7, R7, #1
BNE	L_BT_Configure2
NOP
NOP
;task1.c,49 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure4:
SUBS	R7, R7, #1
BNE	L_BT_Configure4
NOP
NOP
;task1.c,51 :: 		UART3_Write_Text("SN,BlueTooth-Islam");   // Name of device
MOVW	R0, #lo_addr(?lstr2_task1+0)
MOVT	R0, #hi_addr(?lstr2_task1+0)
BL	_UART3_Write_Text+0
;task1.c,52 :: 		UART3_Write(13);                          // CR
MOVS	R0, #13
BL	_UART3_Write+0
;task1.c,53 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure6:
SUBS	R7, R7, #1
BNE	L_BT_Configure6
NOP
NOP
;task1.c,54 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure8:
SUBS	R7, R7, #1
BNE	L_BT_Configure8
NOP
NOP
;task1.c,56 :: 		UART3_Write_Text("SO,Slave");             // Extended status string
MOVW	R0, #lo_addr(?lstr3_task1+0)
MOVT	R0, #hi_addr(?lstr3_task1+0)
BL	_UART3_Write_Text+0
;task1.c,57 :: 		UART3_Write(13);                          // CR
MOVS	R0, #13
BL	_UART3_Write+0
;task1.c,58 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure10:
SUBS	R7, R7, #1
BNE	L_BT_Configure10
NOP
NOP
;task1.c,59 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure12:
SUBS	R7, R7, #1
BNE	L_BT_Configure12
NOP
NOP
;task1.c,61 :: 		UART3_Write_Text("SM,0");                 // Set mode (0 = slave, 1 = master, 2 = trigger, 3 = auto, 4 = DTR, 5 = ANY)
MOVW	R0, #lo_addr(?lstr4_task1+0)
MOVT	R0, #hi_addr(?lstr4_task1+0)
BL	_UART3_Write_Text+0
;task1.c,62 :: 		UART3_Write(13);                          // CR
MOVS	R0, #13
BL	_UART3_Write+0
;task1.c,63 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure14:
SUBS	R7, R7, #1
BNE	L_BT_Configure14
NOP
NOP
;task1.c,64 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure16:
SUBS	R7, R7, #1
BNE	L_BT_Configure16
NOP
NOP
;task1.c,66 :: 		UART3_Write_Text("SA,1");                 // Authentication (1 to enable, 0 to disable)
MOVW	R0, #lo_addr(?lstr5_task1+0)
MOVT	R0, #hi_addr(?lstr5_task1+0)
BL	_UART3_Write_Text+0
;task1.c,67 :: 		UART3_Write(13);                          // CR
MOVS	R0, #13
BL	_UART3_Write+0
;task1.c,68 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure18:
SUBS	R7, R7, #1
BNE	L_BT_Configure18
NOP
NOP
;task1.c,69 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure20:
SUBS	R7, R7, #1
BNE	L_BT_Configure20
NOP
NOP
;task1.c,72 :: 		UART3_Write_Text("SP,1234");              // Security pin code (mikroe)
MOVW	R0, #lo_addr(?lstr6_task1+0)
MOVT	R0, #hi_addr(?lstr6_task1+0)
BL	_UART3_Write_Text+0
;task1.c,73 :: 		UART3_Write(13);                          // CR
MOVS	R0, #13
BL	_UART3_Write+0
;task1.c,74 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure22:
SUBS	R7, R7, #1
BNE	L_BT_Configure22
NOP
NOP
;task1.c,75 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure24:
SUBS	R7, R7, #1
BNE	L_BT_Configure24
NOP
NOP
;task1.c,78 :: 		UART3_Write_Text("---");                  // Security pin code (mikroe)
MOVW	R0, #lo_addr(?lstr7_task1+0)
MOVT	R0, #hi_addr(?lstr7_task1+0)
BL	_UART3_Write_Text+0
;task1.c,79 :: 		UART3_Write(13);                          // CR
MOVS	R0, #13
BL	_UART3_Write+0
;task1.c,80 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure26:
SUBS	R7, R7, #1
BNE	L_BT_Configure26
NOP
NOP
;task1.c,81 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_BT_Configure28:
SUBS	R7, R7, #1
BNE	L_BT_Configure28
NOP
NOP
;task1.c,82 :: 		}
L_end_BT_Configure:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _BT_Configure
_main:
;task1.c,88 :: 		void main() {
SUB	SP, SP, #4
;task1.c,92 :: 		Screen_init();
BL	_Screen_init+0
;task1.c,93 :: 		TFT_Fill_Screen(colors[11]);
MOVW	R0, #lo_addr(_colors+44)
MOVT	R0, #hi_addr(_colors+44)
LDR	R0, [R0, #0]
BL	_TFT_Fill_Screen+0
;task1.c,94 :: 		UART3_Init_Advanced(115200, _UART_8_BIT_DATA, _UART_NOPARITY, _UART_ONE_STOPBIT, &_GPIO_MODULE_USART3_PD89);
MOVW	R0, #lo_addr(__GPIO_MODULE_USART3_PD89+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_USART3_PD89+0)
PUSH	(R0)
MOVW	R3, #0
MOVW	R2, #0
MOVW	R1, #0
MOV	R0, #115200
BL	_UART3_Init_Advanced+0
ADD	SP, SP, #4
;task1.c,95 :: 		Delay_ms(100);                // UART3 Init
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main30:
SUBS	R7, R7, #1
BNE	L_main30
NOP
NOP
NOP
NOP
;task1.c,98 :: 		BT_Configure();
BL	_BT_Configure+0
;task1.c,102 :: 		Delay_ms(4000);
MOVW	R7, #34131
MOVT	R7, #325
NOP
NOP
L_main32:
SUBS	R7, R7, #1
BNE	L_main32
NOP
NOP
NOP
NOP
;task1.c,107 :: 		while (1)
L_main34:
;task1.c,110 :: 		if(UART3_Data_Ready())
BL	_UART3_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_main36
;task1.c,112 :: 		TFT_Set_Font(TFT_defaultFont, CL_RED, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #63488
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;task1.c,113 :: 		TFT_Write_Char(i,150,150);
MOVS	R2, #150
MOVS	R1, #150
LDRH	R0, [SP, #0]
BL	_TFT_Write_Char+0
;task1.c,114 :: 		i= UART3_Read();
BL	_UART3_Read+0
STRH	R0, [SP, #0]
;task1.c,115 :: 		TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #0
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;task1.c,116 :: 		TFT_Write_Char(i,150,150);
MOVS	R2, #150
MOVS	R1, #150
LDRH	R0, [SP, #0]
BL	_TFT_Write_Char+0
;task1.c,117 :: 		}
L_main36:
;task1.c,120 :: 		}
IT	AL
BAL	L_main34
;task1.c,121 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
