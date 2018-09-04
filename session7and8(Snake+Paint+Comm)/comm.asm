_Comm_Init:
;comm.c,3 :: 		void Comm_Init(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;comm.c,5 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;comm.c,6 :: 		TFT_Fill_Screen(CL_AQUA);
MOVW	R0, #4095
BL	_TFT_Fill_Screen+0
;comm.c,7 :: 		UART1_Init(115200);
MOV	R0, #115200
BL	_UART1_Init+0
;comm.c,8 :: 		TFT_Set_Pen(CL_BLACK,3);
MOVS	R1, #3
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;comm.c,9 :: 		TFT_Rectangle(0,2,315,70);
MOVS	R3, #70
SXTH	R3, R3
MOVW	R2, #315
SXTH	R2, R2
MOVS	R1, #2
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;comm.c,10 :: 		TFT_Write_Text("cmd:",8,25);
MOVW	R0, #lo_addr(?lstr1_comm+0)
MOVT	R0, #hi_addr(?lstr1_comm+0)
MOVS	R2, #25
MOVS	R1, #8
BL	_TFT_Write_Text+0
;comm.c,11 :: 		TFT_Rectangle(0,70,315,140);
MOVS	R3, #140
SXTH	R3, R3
MOVW	R2, #315
SXTH	R2, R2
MOVS	R1, #70
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;comm.c,12 :: 		TFT_Write_Text("Start",150,105);
MOVW	R0, #lo_addr(?lstr2_comm+0)
MOVT	R0, #hi_addr(?lstr2_comm+0)
MOVS	R2, #105
MOVS	R1, #150
BL	_TFT_Write_Text+0
;comm.c,13 :: 		TFT_Rectangle(0,140,315,210);
MOVS	R3, #210
SXTH	R3, R3
MOVW	R2, #315
SXTH	R2, R2
MOVS	R1, #140
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;comm.c,14 :: 		TFT_Write_Text("Stop",150,175);
MOVW	R0, #lo_addr(?lstr3_comm+0)
MOVT	R0, #hi_addr(?lstr3_comm+0)
MOVS	R2, #175
MOVS	R1, #150
BL	_TFT_Write_Text+0
;comm.c,15 :: 		TFT_Write_Text("Back->",270,220);
MOVW	R0, #lo_addr(?lstr4_comm+0)
MOVT	R0, #hi_addr(?lstr4_comm+0)
MOVS	R2, #220
MOVW	R1, #270
BL	_TFT_Write_Text+0
;comm.c,17 :: 		}
L_end_Comm_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Comm_Init
_comm:
;comm.c,19 :: 		void comm(u32 X,u32 Y,u32 number, u32 flag)
; flag start address is: 12 (R3)
; number start address is: 8 (R2)
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; flag end address is: 12 (R3)
; number end address is: 8 (R2)
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
; number start address is: 8 (R2)
; flag start address is: 12 (R3)
;comm.c,24 :: 		if(flag==0)
CMP	R3, #0
IT	NE
BNE	L_comm0
; number end address is: 8 (R2)
; flag end address is: 12 (R3)
;comm.c,26 :: 		if((Y>70)&&(Y<140))
CMP	R1, #70
IT	LS
BLS	L__comm21
CMP	R1, #140
IT	CS
BCS	L__comm20
; X end address is: 0 (R0)
; Y end address is: 4 (R1)
L__comm19:
;comm.c,28 :: 		start=1;
MOVS	R5, #1
MOVW	R4, #lo_addr(comm_start_L0+0)
MOVT	R4, #hi_addr(comm_start_L0+0)
STRB	R5, [R4, #0]
;comm.c,29 :: 		}
IT	AL
BAL	L_comm4
;comm.c,26 :: 		if((Y>70)&&(Y<140))
L__comm21:
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
L__comm20:
;comm.c,30 :: 		else if((Y>140)&&(Y<210))
CMP	R1, #140
IT	LS
BLS	L__comm23
CMP	R1, #210
IT	CS
BCS	L__comm22
; X end address is: 0 (R0)
; Y end address is: 4 (R1)
L__comm18:
;comm.c,32 :: 		if(start)
MOVW	R4, #lo_addr(comm_start_L0+0)
MOVT	R4, #hi_addr(comm_start_L0+0)
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_comm8
;comm.c,33 :: 		{    start=0;
MOVS	R5, #0
MOVW	R4, #lo_addr(comm_start_L0+0)
MOVT	R4, #hi_addr(comm_start_L0+0)
STRB	R5, [R4, #0]
;comm.c,34 :: 		if(num!=0)
MOVW	R4, #lo_addr(comm_num_L0+0)
MOVT	R4, #hi_addr(comm_num_L0+0)
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_comm9
;comm.c,36 :: 		UART1_Write_Text(message);
MOVW	R0, #lo_addr(comm_message_L0+0)
MOVT	R0, #hi_addr(comm_message_L0+0)
BL	_UART1_Write_Text+0
;comm.c,37 :: 		num=0;
MOVS	R5, #0
MOVW	R4, #lo_addr(comm_num_L0+0)
MOVT	R4, #hi_addr(comm_num_L0+0)
STRB	R5, [R4, #0]
;comm.c,38 :: 		TFT_Set_Font(TFT_defaultFont,CL_AQUA,FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #4095
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;comm.c,39 :: 		TFT_Write_Text(message,40,25);
MOVS	R2, #25
MOVS	R1, #40
MOVW	R0, #lo_addr(comm_message_L0+0)
MOVT	R0, #hi_addr(comm_message_L0+0)
BL	_TFT_Write_Text+0
;comm.c,40 :: 		TFT_Set_Font(TFT_defaultFont,CL_BLACK,FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #0
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;comm.c,41 :: 		}
L_comm9:
;comm.c,42 :: 		}
L_comm8:
;comm.c,43 :: 		}
IT	AL
BAL	L_comm10
;comm.c,30 :: 		else if((Y>140)&&(Y<210))
L__comm23:
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
L__comm22:
;comm.c,44 :: 		else if(Y>210 && X>270)
CMP	R1, #210
IT	LS
BLS	L__comm25
; Y end address is: 4 (R1)
CMP	R0, #270
IT	LS
BLS	L__comm24
; X end address is: 0 (R0)
L__comm17:
;comm.c,46 :: 		start=0;
MOVS	R5, #0
MOVW	R4, #lo_addr(comm_start_L0+0)
MOVT	R4, #hi_addr(comm_start_L0+0)
STRB	R5, [R4, #0]
;comm.c,47 :: 		num=0;
MOVS	R5, #0
MOVW	R4, #lo_addr(comm_num_L0+0)
MOVT	R4, #hi_addr(comm_num_L0+0)
STRB	R5, [R4, #0]
;comm.c,48 :: 		Page=0;
MOVS	R5, #0
MOVW	R4, #lo_addr(_Page+0)
MOVT	R4, #hi_addr(_Page+0)
STRB	R5, [R4, #0]
;comm.c,49 :: 		Menu_Init();
BL	_Menu_Init+0
;comm.c,44 :: 		else if(Y>210 && X>270)
L__comm25:
L__comm24:
;comm.c,50 :: 		}
L_comm10:
L_comm4:
;comm.c,53 :: 		}
IT	AL
BAL	L_comm14
L_comm0:
;comm.c,55 :: 		{  if(start)
; number start address is: 8 (R2)
MOVW	R4, #lo_addr(comm_start_L0+0)
MOVT	R4, #hi_addr(comm_start_L0+0)
LDRB	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_comm15
;comm.c,56 :: 		if(num<9)
MOVW	R4, #lo_addr(comm_num_L0+0)
MOVT	R4, #hi_addr(comm_num_L0+0)
LDRB	R4, [R4, #0]
CMP	R4, #9
IT	CS
BCS	L_comm16
;comm.c,58 :: 		message[num]=number+48;
MOVW	R6, #lo_addr(comm_num_L0+0)
MOVT	R6, #hi_addr(comm_num_L0+0)
LDRB	R5, [R6, #0]
MOVW	R4, #lo_addr(comm_message_L0+0)
MOVT	R4, #hi_addr(comm_message_L0+0)
ADDS	R5, R4, R5
ADDW	R4, R2, #48
; number end address is: 8 (R2)
STRB	R4, [R5, #0]
;comm.c,59 :: 		message[num+1]=0;
MOV	R4, R6
LDRB	R4, [R4, #0]
ADDS	R5, R4, #1
SXTH	R5, R5
MOVW	R4, #lo_addr(comm_message_L0+0)
MOVT	R4, #hi_addr(comm_message_L0+0)
ADDS	R5, R4, R5
MOVS	R4, #0
STRB	R4, [R5, #0]
;comm.c,60 :: 		TFT_Write_Text(message,40,25);
MOVS	R2, #25
MOVS	R1, #40
MOVW	R0, #lo_addr(comm_message_L0+0)
MOVT	R0, #hi_addr(comm_message_L0+0)
BL	_TFT_Write_Text+0
;comm.c,61 :: 		num++;
MOVW	R5, #lo_addr(comm_num_L0+0)
MOVT	R5, #hi_addr(comm_num_L0+0)
LDRB	R4, [R5, #0]
ADDS	R4, R4, #1
STRB	R4, [R5, #0]
;comm.c,62 :: 		}
L_comm16:
L_comm15:
;comm.c,63 :: 		}
L_comm14:
;comm.c,65 :: 		}
L_end_comm:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _comm
