_main:
;task1.c,10 :: 		void main() {
SUB	SP, SP, #88
;task1.c,11 :: 		u32 x=105,x1=120,y=152,y1=160,xold,x1old,yold,y1old;
ADD	R11, SP, #8
ADD	R10, R11, #78
MOVW	R12, #lo_addr(?ICSmain_x1_L0+0)
MOVT	R12, #hi_addr(?ICSmain_x1_L0+0)
BL	___CC2DW+0
;task1.c,12 :: 		u8 flag=0;
;task1.c,13 :: 		u32 colors[16]={CL_AQUA,CL_BLACK,CL_BLUE,CL_FUCHSIA,CL_GRAY,CL_GREEN,CL_LIME,CL_MAROON,CL_NAVY,CL_OLIVE,CL_PURPLE,CL_RED,CL_SILVER,CL_TEAL,CL_WHITE,CL_YELLOW};
;task1.c,14 :: 		u8 font=14;
;task1.c,15 :: 		u8 background=1;
;task1.c,16 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2|_GPIO_PINMASK_4|_GPIO_PINMASK_12|_GPIO_PINMASK_13|_GPIO_PINMASK_14|_GPIO_PINMASK_15);
MOVW	R1, #61460
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;task1.c,17 :: 		GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;task1.c,18 :: 		GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_GPIO_Digital_Input+0
;task1.c,19 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;task1.c,20 :: 		TFT_Init_ILI9341_8bit(240,320);
MOVW	R1, #320
MOVS	R0, #240
BL	_TFT_Init_ILI9341_8bit+0
;task1.c,21 :: 		TFT_Fill_Screen(colors[background]);
ADD	R1, SP, #20
LDRB	R0, [SP, #85]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
LDR	R0, [R0, #0]
UXTH	R0, R0
BL	_TFT_Fill_Screen+0
;task1.c,22 :: 		TFT_Set_Pen(CL_WHITE, 5);
MOVS	R1, #5
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;task1.c,23 :: 		TFT_Circle(x1, y1, 2);
MOVS	R2, #2
SXTH	R2, R2
LDR	R1, [SP, #12]
LDR	R0, [SP, #8]
BL	_TFT_Circle+0
;task1.c,24 :: 		while(1)
L_main0:
;task1.c,29 :: 		x1old=x1;
LDR	R0, [SP, #8]
STR	R0, [SP, #0]
;task1.c,30 :: 		y1old=y1;
LDR	R0, [SP, #12]
STR	R0, [SP, #4]
;task1.c,31 :: 		if(Button(&GPIOD_IDR, 4, 1, 1)){if(x1<240){x++;x1++;flag=1;}}
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main2
LDR	R0, [SP, #8]
CMP	R0, #240
IT	CS
BCS	L_main3
LDR	R0, [SP, #8]
ADDS	R0, R0, #1
STR	R0, [SP, #8]
MOVS	R0, #1
STRB	R0, [SP, #16]
L_main3:
IT	AL
BAL	L_main4
L_main2:
;task1.c,32 :: 		else if(Button(&GPIOB_IDR, 5, 1, 1)){if(x1>0){x--;x1--;flag=1;}}
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main5
LDR	R0, [SP, #8]
CMP	R0, #0
IT	LS
BLS	L_main6
LDR	R0, [SP, #8]
SUBS	R0, R0, #1
STR	R0, [SP, #8]
MOVS	R0, #1
STRB	R0, [SP, #16]
L_main6:
IT	AL
BAL	L_main7
L_main5:
;task1.c,33 :: 		else if(Button(&GPIOD_IDR, 2, 1, 1)){if(y1>0){y1--;y--;flag=1;}}
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main8
LDR	R0, [SP, #12]
CMP	R0, #0
IT	LS
BLS	L_main9
LDR	R0, [SP, #12]
SUBS	R0, R0, #1
STR	R0, [SP, #12]
MOVS	R0, #1
STRB	R0, [SP, #16]
L_main9:
IT	AL
BAL	L_main10
L_main8:
;task1.c,34 :: 		else if(Button(&GPIOA_IDR, 6, 1, 1)){if(y1<320){y++;y1++;flag=1;}}
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main11
LDR	R0, [SP, #12]
CMP	R0, #320
IT	CS
BCS	L_main12
LDR	R0, [SP, #12]
ADDS	R0, R0, #1
STR	R0, [SP, #12]
MOVS	R0, #1
STRB	R0, [SP, #16]
L_main12:
L_main11:
L_main10:
L_main7:
L_main4:
;task1.c,35 :: 		if(Button(&GPIOD_IDR, 12, 1, 1)){flag=1;font=(font+1);if(font==16)font=0;}
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #12
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main13
MOVS	R0, #1
STRB	R0, [SP, #16]
LDRB	R0, [SP, #84]
ADDS	R0, R0, #1
STRB	R0, [SP, #84]
UXTB	R0, R0
CMP	R0, #16
IT	NE
BNE	L_main14
MOVS	R0, #0
STRB	R0, [SP, #84]
L_main14:
IT	AL
BAL	L_main15
L_main13:
;task1.c,36 :: 		else if(Button(&GPIOD_IDR, 13, 1, 1)){flag=1;;font=(font-1);if(font>16)font=16;}
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #13
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main16
MOVS	R0, #1
STRB	R0, [SP, #16]
LDRB	R0, [SP, #84]
SUBS	R0, R0, #1
STRB	R0, [SP, #84]
UXTB	R0, R0
CMP	R0, #16
IT	LS
BLS	L_main17
MOVS	R0, #16
STRB	R0, [SP, #84]
L_main17:
IT	AL
BAL	L_main18
L_main16:
;task1.c,37 :: 		else if(Button(&GPIOD_IDR, 14, 1, 1)){background=(background+1);if(background==16)background=0;TFT_Fill_Screen(colors[background]);flag=1;}
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #14
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main19
LDRB	R0, [SP, #85]
ADDS	R0, R0, #1
STRB	R0, [SP, #85]
UXTB	R0, R0
CMP	R0, #16
IT	NE
BNE	L_main20
MOVS	R0, #0
STRB	R0, [SP, #85]
L_main20:
ADD	R1, SP, #20
LDRB	R0, [SP, #85]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
LDR	R0, [R0, #0]
UXTH	R0, R0
BL	_TFT_Fill_Screen+0
MOVS	R0, #1
STRB	R0, [SP, #16]
IT	AL
BAL	L_main21
L_main19:
;task1.c,38 :: 		else if(Button(&GPIOD_IDR, 15, 1, 1)){background=(background-1);if(background>16)background=16;TFT_Fill_Screen(colors[background]);flag=1;}
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #15
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main22
LDRB	R0, [SP, #85]
SUBS	R0, R0, #1
STRB	R0, [SP, #85]
UXTB	R0, R0
CMP	R0, #16
IT	LS
BLS	L_main23
MOVS	R0, #16
STRB	R0, [SP, #85]
L_main23:
ADD	R1, SP, #20
LDRB	R0, [SP, #85]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
LDR	R0, [R0, #0]
UXTH	R0, R0
BL	_TFT_Fill_Screen+0
MOVS	R0, #1
STRB	R0, [SP, #16]
L_main22:
L_main21:
L_main18:
L_main15:
;task1.c,39 :: 		if(flag)
LDRB	R0, [SP, #16]
CMP	R0, #0
IT	EQ
BEQ	L_main24
;task1.c,41 :: 		flag=0;
MOVS	R0, #0
STRB	R0, [SP, #16]
;task1.c,42 :: 		TFT_Set_Pen(colors[background], 5);
ADD	R1, SP, #20
LDRB	R0, [SP, #85]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
LDR	R0, [R0, #0]
UXTH	R0, R0
MOVS	R1, #5
BL	_TFT_Set_Pen+0
;task1.c,43 :: 		TFT_Circle(x1old, y1old, 2);
MOVS	R2, #2
SXTH	R2, R2
LDR	R1, [SP, #4]
LDR	R0, [SP, #0]
BL	_TFT_Circle+0
;task1.c,44 :: 		Delay_ms(10);
MOVW	R7, #53331
MOVT	R7, #0
NOP
NOP
L_main25:
SUBS	R7, R7, #1
BNE	L_main25
NOP
NOP
NOP
NOP
;task1.c,47 :: 		TFT_Set_Pen(colors[font], 5);
ADD	R1, SP, #20
LDRB	R0, [SP, #84]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
LDR	R0, [R0, #0]
UXTH	R0, R0
MOVS	R1, #5
BL	_TFT_Set_Pen+0
;task1.c,48 :: 		TFT_Circle(x1, y1, 2);
MOVS	R2, #2
SXTH	R2, R2
LDR	R1, [SP, #12]
LDR	R0, [SP, #8]
BL	_TFT_Circle+0
;task1.c,49 :: 		Delay_ms(10);
MOVW	R7, #53331
MOVT	R7, #0
NOP
NOP
L_main27:
SUBS	R7, R7, #1
BNE	L_main27
NOP
NOP
NOP
NOP
;task1.c,52 :: 		}
L_main24:
;task1.c,58 :: 		}
IT	AL
BAL	L_main0
;task1.c,63 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
