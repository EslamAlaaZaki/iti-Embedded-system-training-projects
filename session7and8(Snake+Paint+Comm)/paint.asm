_Screen_init:
;paint.c,19 :: 		void Screen_init(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;paint.c,21 :: 		PenColor=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenColor+0)
MOVT	R0, #hi_addr(_PenColor+0)
STR	R1, [R0, #0]
;paint.c,22 :: 		shape=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_shape+0)
MOVT	R0, #hi_addr(_shape+0)
STRB	R1, [R0, #0]
;paint.c,23 :: 		painted=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_painted+0)
MOVT	R0, #hi_addr(_painted+0)
STRB	R1, [R0, #0]
;paint.c,24 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;paint.c,26 :: 		TFT_Init_ILI9341_8bit(320,240);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;paint.c,27 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9);
MOVW	R0, #768
BL	_ADC_Set_Input_Channel+0
;paint.c,28 :: 		ADC1_Init();
BL	_ADC1_Init+0
;paint.c,29 :: 		TP_TFT_Init(320, 240, 8, 9);
MOVS	R3, #9
MOVS	R2, #8
MOVS	R1, #240
MOVW	R0, #320
BL	_TP_TFT_Init+0
;paint.c,30 :: 		TP_TFT_Set_ADC_Threshold(600);
MOVW	R0, #600
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;paint.c,31 :: 		TFT_Fill_Screen(colors[14]);
MOVW	R0, #lo_addr(_colors+56)
MOVT	R0, #hi_addr(_colors+56)
LDR	R0, [R0, #0]
BL	_TFT_Fill_Screen+0
;paint.c,32 :: 		TP_TFT_Calibrate_Min();
BL	_TP_TFT_Calibrate_Min+0
;paint.c,33 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Screen_init0:
SUBS	R7, R7, #1
BNE	L_Screen_init0
NOP
NOP
;paint.c,34 :: 		TP_TFT_Calibrate_Max();
BL	_TP_TFT_Calibrate_Max+0
;paint.c,35 :: 		}
L_end_Screen_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Screen_init
_Paint_Init:
;paint.c,36 :: 		void Paint_Init(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;paint.c,38 :: 		TFT_Fill_Screen(colors[14]);
MOVW	R0, #lo_addr(_colors+56)
MOVT	R0, #hi_addr(_colors+56)
LDR	R0, [R0, #0]
BL	_TFT_Fill_Screen+0
;paint.c,39 :: 		TFT_Set_Pen(colors[14],20);
MOVW	R0, #lo_addr(_colors+56)
MOVT	R0, #hi_addr(_colors+56)
LDR	R0, [R0, #0]
MOVS	R1, #20
BL	_TFT_Set_Pen+0
;paint.c,40 :: 		TFT_Rectangle(0,0,20,20);
MOVS	R3, #20
SXTH	R3, R3
MOVS	R2, #20
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;paint.c,41 :: 		TFT_Write_Text("Clear",2,8);
MOVW	R0, #lo_addr(?lstr1_paint+0)
MOVT	R0, #hi_addr(?lstr1_paint+0)
MOVS	R2, #8
MOVS	R1, #2
BL	_TFT_Write_Text+0
;paint.c,42 :: 		TFT_Set_Pen(colors[1],20);
MOVW	R0, #lo_addr(_colors+4)
MOVT	R0, #hi_addr(_colors+4)
LDR	R0, [R0, #0]
MOVS	R1, #20
BL	_TFT_Set_Pen+0
;paint.c,43 :: 		TFT_Rectangle(50,0,70,20);
MOVS	R3, #20
SXTH	R3, R3
MOVS	R2, #70
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #50
SXTH	R0, R0
BL	_TFT_Rectangle+0
;paint.c,44 :: 		TFT_Set_Pen(colors[2],20);
MOVW	R0, #lo_addr(_colors+8)
MOVT	R0, #hi_addr(_colors+8)
LDR	R0, [R0, #0]
MOVS	R1, #20
BL	_TFT_Set_Pen+0
;paint.c,45 :: 		TFT_Rectangle(100,0,120,20);
MOVS	R3, #20
SXTH	R3, R3
MOVS	R2, #120
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #100
SXTH	R0, R0
BL	_TFT_Rectangle+0
;paint.c,46 :: 		TFT_Set_Pen(colors[3],20);
MOVW	R0, #lo_addr(_colors+12)
MOVT	R0, #hi_addr(_colors+12)
LDR	R0, [R0, #0]
MOVS	R1, #20
BL	_TFT_Set_Pen+0
;paint.c,47 :: 		TFT_Rectangle(150,0,170,20);
MOVS	R3, #20
SXTH	R3, R3
MOVS	R2, #170
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #150
SXTH	R0, R0
BL	_TFT_Rectangle+0
;paint.c,48 :: 		TFT_Set_Pen(colors[4],20);
MOVW	R0, #lo_addr(_colors+16)
MOVT	R0, #hi_addr(_colors+16)
LDR	R0, [R0, #0]
MOVS	R1, #20
BL	_TFT_Set_Pen+0
;paint.c,49 :: 		TFT_Rectangle(200,0,220,20);
MOVS	R3, #20
SXTH	R3, R3
MOVS	R2, #220
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #200
SXTH	R0, R0
BL	_TFT_Rectangle+0
;paint.c,50 :: 		TFT_Set_Pen(colors[5],20);
MOVW	R0, #lo_addr(_colors+20)
MOVT	R0, #hi_addr(_colors+20)
LDR	R0, [R0, #0]
MOVS	R1, #20
BL	_TFT_Set_Pen+0
;paint.c,51 :: 		TFT_Rectangle(250,0,270,20);
MOVS	R3, #20
SXTH	R3, R3
MOVW	R2, #270
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #250
SXTH	R0, R0
BL	_TFT_Rectangle+0
;paint.c,52 :: 		TFT_Set_Pen(colors[6],20);
MOVW	R0, #lo_addr(_colors+24)
MOVT	R0, #hi_addr(_colors+24)
LDR	R0, [R0, #0]
MOVS	R1, #20
BL	_TFT_Set_Pen+0
;paint.c,53 :: 		TFT_Rectangle(300,0,320,20);
MOVS	R3, #20
SXTH	R3, R3
MOVW	R2, #320
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #300
SXTH	R0, R0
BL	_TFT_Rectangle+0
;paint.c,55 :: 		TFT_Set_Pen(colors[2],1);
MOVW	R0, #lo_addr(_colors+8)
MOVT	R0, #hi_addr(_colors+8)
LDR	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;paint.c,56 :: 		TFT_Rectangle(5,50,45,90);
MOVS	R3, #90
SXTH	R3, R3
MOVS	R2, #45
SXTH	R2, R2
MOVS	R1, #50
SXTH	R1, R1
MOVS	R0, #5
SXTH	R0, R0
BL	_TFT_Rectangle+0
;paint.c,57 :: 		TFT_Set_Pen(colors[1],10);
MOVW	R0, #lo_addr(_colors+4)
MOVT	R0, #hi_addr(_colors+4)
LDR	R0, [R0, #0]
MOVS	R1, #10
BL	_TFT_Set_Pen+0
;paint.c,58 :: 		TFT_Circle(25,70,1);
MOVS	R2, #1
SXTH	R2, R2
MOVS	R1, #70
SXTH	R1, R1
MOVS	R0, #25
SXTH	R0, R0
BL	_TFT_Circle+0
;paint.c,59 :: 		TFT_Set_Pen(colors[2],1);
MOVW	R0, #lo_addr(_colors+8)
MOVT	R0, #hi_addr(_colors+8)
LDR	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;paint.c,60 :: 		TFT_Rectangle(5,100,45,140);
MOVS	R3, #140
SXTH	R3, R3
MOVS	R2, #45
SXTH	R2, R2
MOVS	R1, #100
SXTH	R1, R1
MOVS	R0, #5
SXTH	R0, R0
BL	_TFT_Rectangle+0
;paint.c,61 :: 		TFT_Set_Pen(colors[1],20);
MOVW	R0, #lo_addr(_colors+4)
MOVT	R0, #hi_addr(_colors+4)
LDR	R0, [R0, #0]
MOVS	R1, #20
BL	_TFT_Set_Pen+0
;paint.c,62 :: 		TFT_Circle(25,120,1);
MOVS	R2, #1
SXTH	R2, R2
MOVS	R1, #120
SXTH	R1, R1
MOVS	R0, #25
SXTH	R0, R0
BL	_TFT_Circle+0
;paint.c,63 :: 		TFT_Set_Pen(colors[2],1);
MOVW	R0, #lo_addr(_colors+8)
MOVT	R0, #hi_addr(_colors+8)
LDR	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;paint.c,64 :: 		TFT_Rectangle(5,150,45,190);
MOVS	R3, #190
SXTH	R3, R3
MOVS	R2, #45
SXTH	R2, R2
MOVS	R1, #150
SXTH	R1, R1
MOVS	R0, #5
SXTH	R0, R0
BL	_TFT_Rectangle+0
;paint.c,65 :: 		TFT_Set_Pen(colors[1],3);
MOVW	R0, #lo_addr(_colors+4)
MOVT	R0, #hi_addr(_colors+4)
LDR	R0, [R0, #0]
MOVS	R1, #3
BL	_TFT_Set_Pen+0
;paint.c,66 :: 		TFT_Circle(25,170,15);
MOVS	R2, #15
SXTH	R2, R2
MOVS	R1, #170
SXTH	R1, R1
MOVS	R0, #25
SXTH	R0, R0
BL	_TFT_Circle+0
;paint.c,67 :: 		TFT_Set_Pen(colors[2],1);
MOVW	R0, #lo_addr(_colors+8)
MOVT	R0, #hi_addr(_colors+8)
LDR	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;paint.c,68 :: 		TFT_Rectangle(5,200,45,240);
MOVS	R3, #240
SXTH	R3, R3
MOVS	R2, #45
SXTH	R2, R2
MOVS	R1, #200
SXTH	R1, R1
MOVS	R0, #5
SXTH	R0, R0
BL	_TFT_Rectangle+0
;paint.c,69 :: 		TFT_Set_Pen(colors[1],3);
MOVW	R0, #lo_addr(_colors+4)
MOVT	R0, #hi_addr(_colors+4)
LDR	R0, [R0, #0]
MOVS	R1, #3
BL	_TFT_Set_Pen+0
;paint.c,70 :: 		TFT_Rectangle(10,210,40,230);
MOVS	R3, #230
SXTH	R3, R3
MOVS	R2, #40
SXTH	R2, R2
MOVS	R1, #210
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_TFT_Rectangle+0
;paint.c,71 :: 		TFT_Set_Pen(colors[1],1);
MOVW	R0, #lo_addr(_colors+4)
MOVT	R0, #hi_addr(_colors+4)
LDR	R0, [R0, #0]
MOVS	R1, #1
BL	_TFT_Set_Pen+0
;paint.c,72 :: 		TFT_Rectangle(50,45,310,215);
MOVS	R3, #215
SXTH	R3, R3
MOVW	R2, #310
SXTH	R2, R2
MOVS	R1, #45
SXTH	R1, R1
MOVS	R0, #50
SXTH	R0, R0
BL	_TFT_Rectangle+0
;paint.c,74 :: 		TFT_Write_Text("Back->",270,220);
MOVW	R0, #lo_addr(?lstr2_paint+0)
MOVT	R0, #hi_addr(?lstr2_paint+0)
MOVS	R2, #220
MOVW	R1, #270
BL	_TFT_Write_Text+0
;paint.c,75 :: 		}
L_end_Paint_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Paint_Init
_Paint:
;paint.c,76 :: 		void Paint(u32 X,u32 Y)
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;paint.c,79 :: 		if(Y<30)
CMP	R1, #30
IT	CS
BCS	L_Paint2
; Y end address is: 4 (R1)
;paint.c,81 :: 		if((X<50)&&(painted)){painted=0;Paint_Init();}
CMP	R0, #50
IT	CS
BCS	L__Paint43
MOVW	R2, #lo_addr(_painted+0)
MOVT	R2, #hi_addr(_painted+0)
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Paint42
; X end address is: 0 (R0)
L__Paint41:
MOVS	R3, #0
MOVW	R2, #lo_addr(_painted+0)
MOVT	R2, #hi_addr(_painted+0)
STRB	R3, [R2, #0]
BL	_Paint_Init+0
IT	AL
BAL	L_Paint6
L__Paint43:
; X start address is: 0 (R0)
L__Paint42:
;paint.c,82 :: 		else if(X<100)PenColor=1;
CMP	R0, #100
IT	CS
BCS	L_Paint7
; X end address is: 0 (R0)
MOVS	R3, #1
MOVW	R2, #lo_addr(_PenColor+0)
MOVT	R2, #hi_addr(_PenColor+0)
STR	R3, [R2, #0]
IT	AL
BAL	L_Paint8
L_Paint7:
;paint.c,83 :: 		else if(X<150)PenColor=2;
; X start address is: 0 (R0)
CMP	R0, #150
IT	CS
BCS	L_Paint9
; X end address is: 0 (R0)
MOVS	R3, #2
MOVW	R2, #lo_addr(_PenColor+0)
MOVT	R2, #hi_addr(_PenColor+0)
STR	R3, [R2, #0]
IT	AL
BAL	L_Paint10
L_Paint9:
;paint.c,84 :: 		else if(X<200)PenColor=3;
; X start address is: 0 (R0)
CMP	R0, #200
IT	CS
BCS	L_Paint11
; X end address is: 0 (R0)
MOVS	R3, #3
MOVW	R2, #lo_addr(_PenColor+0)
MOVT	R2, #hi_addr(_PenColor+0)
STR	R3, [R2, #0]
IT	AL
BAL	L_Paint12
L_Paint11:
;paint.c,85 :: 		else if(X<250)PenColor=4;
; X start address is: 0 (R0)
CMP	R0, #250
IT	CS
BCS	L_Paint13
; X end address is: 0 (R0)
MOVS	R3, #4
MOVW	R2, #lo_addr(_PenColor+0)
MOVT	R2, #hi_addr(_PenColor+0)
STR	R3, [R2, #0]
IT	AL
BAL	L_Paint14
L_Paint13:
;paint.c,86 :: 		else if(X<300)PenColor=5;
; X start address is: 0 (R0)
CMP	R0, #300
IT	CS
BCS	L_Paint15
; X end address is: 0 (R0)
MOVS	R3, #5
MOVW	R2, #lo_addr(_PenColor+0)
MOVT	R2, #hi_addr(_PenColor+0)
STR	R3, [R2, #0]
IT	AL
BAL	L_Paint16
L_Paint15:
;paint.c,87 :: 		else PenColor=6;
MOVS	R3, #6
MOVW	R2, #lo_addr(_PenColor+0)
MOVT	R2, #hi_addr(_PenColor+0)
STR	R3, [R2, #0]
L_Paint16:
L_Paint14:
L_Paint12:
L_Paint10:
L_Paint8:
L_Paint6:
;paint.c,88 :: 		}
IT	AL
BAL	L_Paint17
L_Paint2:
;paint.c,89 :: 		else if(X<50)
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
CMP	R0, #50
IT	CS
BCS	L_Paint18
; X end address is: 0 (R0)
;paint.c,91 :: 		if(Y<100){shape=0;}
CMP	R1, #100
IT	CS
BCS	L_Paint19
; Y end address is: 4 (R1)
MOVS	R3, #0
MOVW	R2, #lo_addr(_shape+0)
MOVT	R2, #hi_addr(_shape+0)
STRB	R3, [R2, #0]
IT	AL
BAL	L_Paint20
L_Paint19:
;paint.c,92 :: 		else if(Y<150){shape=4;}
; Y start address is: 4 (R1)
CMP	R1, #150
IT	CS
BCS	L_Paint21
; Y end address is: 4 (R1)
MOVS	R3, #4
MOVW	R2, #lo_addr(_shape+0)
MOVT	R2, #hi_addr(_shape+0)
STRB	R3, [R2, #0]
IT	AL
BAL	L_Paint22
L_Paint21:
;paint.c,93 :: 		else if(Y<200){shape=1;}
; Y start address is: 4 (R1)
CMP	R1, #200
IT	CS
BCS	L_Paint23
; Y end address is: 4 (R1)
MOVS	R3, #1
MOVW	R2, #lo_addr(_shape+0)
MOVT	R2, #hi_addr(_shape+0)
STRB	R3, [R2, #0]
IT	AL
BAL	L_Paint24
L_Paint23:
;paint.c,94 :: 		else{shape=2;}
MOVS	R3, #2
MOVW	R2, #lo_addr(_shape+0)
MOVT	R2, #hi_addr(_shape+0)
STRB	R3, [R2, #0]
L_Paint24:
L_Paint22:
L_Paint20:
;paint.c,95 :: 		}
IT	AL
BAL	L_Paint25
L_Paint18:
;paint.c,96 :: 		else if((X>60)&&(Y>55)&&(X<290)&&(Y<195))
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
CMP	R0, #60
IT	LS
BLS	L__Paint47
CMP	R1, #55
IT	LS
BLS	L__Paint46
CMP	R0, #290
IT	CS
BCS	L__Paint45
CMP	R1, #195
IT	CS
BCS	L__Paint44
L__Paint40:
;paint.c,97 :: 		{  painted++;
MOVW	R3, #lo_addr(_painted+0)
MOVT	R3, #hi_addr(_painted+0)
LDRB	R2, [R3, #0]
ADDS	R2, R2, #1
STRB	R2, [R3, #0]
;paint.c,98 :: 		if(shape==0){TFT_Set_Pen(colors[PenColor],10);TFT_Circle(X,Y,1);}
MOVW	R2, #lo_addr(_shape+0)
MOVT	R2, #hi_addr(_shape+0)
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	NE
BNE	L_Paint29
MOVW	R2, #lo_addr(_PenColor+0)
MOVT	R2, #hi_addr(_PenColor+0)
LDR	R2, [R2, #0]
LSLS	R3, R2, #2
MOVW	R2, #lo_addr(_colors+0)
MOVT	R2, #hi_addr(_colors+0)
ADDS	R2, R2, R3
LDR	R2, [R2, #0]
UXTH	R2, R2
STR	R1, [SP, #4]
STR	R0, [SP, #8]
MOVS	R1, #10
UXTH	R0, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #8]
LDR	R1, [SP, #4]
MOVS	R2, #1
SXTH	R2, R2
SXTH	R1, R1
; Y end address is: 4 (R1)
SXTH	R0, R0
; X end address is: 0 (R0)
BL	_TFT_Circle+0
IT	AL
BAL	L_Paint30
L_Paint29:
;paint.c,99 :: 		else if(shape==1){TFT_Set_Pen(colors[PenColor],3);TFT_Circle(X,Y,20);}
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
MOVW	R2, #lo_addr(_shape+0)
MOVT	R2, #hi_addr(_shape+0)
LDRB	R2, [R2, #0]
CMP	R2, #1
IT	NE
BNE	L_Paint31
MOVW	R2, #lo_addr(_PenColor+0)
MOVT	R2, #hi_addr(_PenColor+0)
LDR	R2, [R2, #0]
LSLS	R3, R2, #2
MOVW	R2, #lo_addr(_colors+0)
MOVT	R2, #hi_addr(_colors+0)
ADDS	R2, R2, R3
LDR	R2, [R2, #0]
UXTH	R2, R2
STR	R1, [SP, #4]
STR	R0, [SP, #8]
MOVS	R1, #3
UXTH	R0, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #8]
LDR	R1, [SP, #4]
MOVS	R2, #20
SXTH	R2, R2
SXTH	R1, R1
; Y end address is: 4 (R1)
SXTH	R0, R0
; X end address is: 0 (R0)
BL	_TFT_Circle+0
IT	AL
BAL	L_Paint32
L_Paint31:
;paint.c,100 :: 		else if(shape==2){TFT_Set_Pen(colors[PenColor],3); TFT_Rectangle(X,Y,X+20,Y+20);}
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
MOVW	R2, #lo_addr(_shape+0)
MOVT	R2, #hi_addr(_shape+0)
LDRB	R2, [R2, #0]
CMP	R2, #2
IT	NE
BNE	L_Paint33
MOVW	R2, #lo_addr(_PenColor+0)
MOVT	R2, #hi_addr(_PenColor+0)
LDR	R2, [R2, #0]
LSLS	R3, R2, #2
MOVW	R2, #lo_addr(_colors+0)
MOVT	R2, #hi_addr(_colors+0)
ADDS	R2, R2, R3
LDR	R2, [R2, #0]
UXTH	R2, R2
STR	R1, [SP, #4]
STR	R0, [SP, #8]
MOVS	R1, #3
UXTH	R0, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #8]
LDR	R1, [SP, #4]
ADDW	R3, R1, #20
ADDW	R2, R0, #20
SXTH	R3, R3
SXTH	R2, R2
SXTH	R1, R1
; Y end address is: 4 (R1)
SXTH	R0, R0
; X end address is: 0 (R0)
BL	_TFT_Rectangle+0
IT	AL
BAL	L_Paint34
L_Paint33:
;paint.c,101 :: 		else  {TFT_Set_Pen(colors[PenColor],20);TFT_Circle(X,Y,1);}
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
MOVW	R2, #lo_addr(_PenColor+0)
MOVT	R2, #hi_addr(_PenColor+0)
LDR	R2, [R2, #0]
LSLS	R3, R2, #2
MOVW	R2, #lo_addr(_colors+0)
MOVT	R2, #hi_addr(_colors+0)
ADDS	R2, R2, R3
LDR	R2, [R2, #0]
UXTH	R2, R2
STR	R1, [SP, #4]
STR	R0, [SP, #8]
MOVS	R1, #20
UXTH	R0, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #8]
LDR	R1, [SP, #4]
MOVS	R2, #1
SXTH	R2, R2
SXTH	R1, R1
; Y end address is: 4 (R1)
SXTH	R0, R0
; X end address is: 0 (R0)
BL	_TFT_Circle+0
L_Paint34:
L_Paint32:
L_Paint30:
;paint.c,102 :: 		}
IT	AL
BAL	L_Paint35
;paint.c,96 :: 		else if((X>60)&&(Y>55)&&(X<290)&&(Y<195))
L__Paint47:
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
L__Paint46:
L__Paint45:
L__Paint44:
;paint.c,103 :: 		else if(Y>210 && X>270)
CMP	R1, #210
IT	LS
BLS	L__Paint49
; Y end address is: 4 (R1)
CMP	R0, #270
IT	LS
BLS	L__Paint48
; X end address is: 0 (R0)
L__Paint39:
;paint.c,105 :: 		Page=0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_Page+0)
MOVT	R2, #hi_addr(_Page+0)
STRB	R3, [R2, #0]
;paint.c,106 :: 		Menu_Init();
BL	_Menu_Init+0
;paint.c,103 :: 		else if(Y>210 && X>270)
L__Paint49:
L__Paint48:
;paint.c,107 :: 		}
L_Paint35:
L_Paint25:
L_Paint17:
;paint.c,108 :: 		}
L_end_Paint:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Paint
