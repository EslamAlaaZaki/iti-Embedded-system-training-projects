_Game_Init:
;Game.c,4 :: 		void Game_Init(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Game.c,7 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2|_GPIO_PINMASK_4);
MOVS	R1, #20
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;Game.c,8 :: 		GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;Game.c,9 :: 		GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_GPIO_Digital_Input+0
;Game.c,10 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_15);
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;Game.c,11 :: 		TFT_Fill_Screen(CL_BLACK);
MOVW	R0, #0
BL	_TFT_Fill_Screen+0
;Game.c,12 :: 		TFT_Set_Pen(CL_RED,10);
MOVS	R1, #10
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;Game.c,13 :: 		TFT_Circle(150,150,1);
MOVS	R2, #1
SXTH	R2, R2
MOVS	R1, #150
SXTH	R1, R1
MOVS	R0, #150
SXTH	R0, R0
BL	_TFT_Circle+0
;Game.c,14 :: 		TFT_Set_Pen(CL_SILVER,10);
MOVS	R1, #10
MOVW	R0, #50712
BL	_TFT_Set_Pen+0
;Game.c,15 :: 		TFT_Circle(25,120,1);
MOVS	R2, #1
SXTH	R2, R2
MOVS	R1, #120
SXTH	R1, R1
MOVS	R0, #25
SXTH	R0, R0
BL	_TFT_Circle+0
;Game.c,17 :: 		}
L_end_Game_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Game_Init
_Game:
;Game.c,18 :: 		void Game(void)
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Game.c,23 :: 		s32 r =(X-Xtarget)*(X-Xtarget)+(Y-Ytarget)*(Y-Ytarget);
MOVW	R0, #lo_addr(Game_Xtarget_L0+0)
MOVT	R0, #hi_addr(Game_Xtarget_L0+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(Game_X_L0+0)
MOVT	R0, #hi_addr(Game_X_L0+0)
LDR	R0, [R0, #0]
SUB	R0, R0, R1
MUL	R2, R0, R0
MOVW	R0, #lo_addr(Game_Ytarget_L0+0)
MOVT	R0, #hi_addr(Game_Ytarget_L0+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(Game_Y_L0+0)
MOVT	R0, #hi_addr(Game_Y_L0+0)
LDR	R0, [R0, #0]
SUB	R0, R0, R1
MULS	R0, R0, R0
ADDS	R2, R2, R0
;Game.c,24 :: 		GPIOD_ODR^=1<<14;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
EOR	R1, R0, #16384
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;Game.c,25 :: 		r=sqrt(r);
VMOV	S0, R2
VCVT.F32	#1, S0, S0
BL	_sqrt+0
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
;Game.c,26 :: 		if(r<=((raduis+10)/2))
MOVW	R0, #lo_addr(Game_raduis_L0+0)
MOVT	R0, #hi_addr(Game_raduis_L0+0)
LDR	R0, [R0, #0]
ADDW	R1, R0, #10
MOVS	R0, #2
SDIV	R0, R1, R0
CMP	R2, R0
IT	GT
BGT	L_Game0
;Game.c,28 :: 		raduis+=2;
MOVW	R1, #lo_addr(Game_raduis_L0+0)
MOVT	R1, #hi_addr(Game_raduis_L0+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #2
STR	R0, [R1, #0]
;Game.c,29 :: 		step++;
MOVW	R1, #lo_addr(Game_step_L0+0)
MOVT	R1, #hi_addr(Game_step_L0+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;Game.c,30 :: 		TFT_Set_Pen(CL_BLACK,10);
MOVS	R1, #10
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;Game.c,31 :: 		TFT_Circle(Xtarget,Ytarget,1);
MOVW	R0, #lo_addr(Game_Ytarget_L0+0)
MOVT	R0, #hi_addr(Game_Ytarget_L0+0)
STR	R0, [SP, #4]
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(Game_Xtarget_L0+0)
MOVT	R0, #hi_addr(Game_Xtarget_L0+0)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
;Game.c,32 :: 		srand(Xtarget);
MOVW	R0, #lo_addr(Game_Xtarget_L0+0)
MOVT	R0, #hi_addr(Game_Xtarget_L0+0)
LDR	R0, [R0, #0]
BL	_srand+0
;Game.c,33 :: 		Xtarget=rand()%320;
BL	_rand+0
MOVW	R2, #320
SXTH	R2, R2
SDIV	R1, R0, R2
MLS	R1, R2, R1, R0
SXTH	R1, R1
MOVW	R0, #lo_addr(Game_Xtarget_L0+0)
MOVT	R0, #hi_addr(Game_Xtarget_L0+0)
STR	R1, [R0, #0]
;Game.c,34 :: 		srand(Ytarget);
LDR	R0, [SP, #4]
LDR	R0, [R0, #0]
BL	_srand+0
;Game.c,35 :: 		Ytarget=rand()%240;
BL	_rand+0
MOVS	R2, #240
SXTH	R2, R2
SDIV	R1, R0, R2
MLS	R1, R2, R1, R0
SXTH	R1, R1
MOVW	R0, #lo_addr(Game_Ytarget_L0+0)
MOVT	R0, #hi_addr(Game_Ytarget_L0+0)
STR	R1, [R0, #0]
;Game.c,36 :: 		TFT_Set_Pen(CL_SILVER,10);
MOVS	R1, #10
MOVW	R0, #50712
BL	_TFT_Set_Pen+0
;Game.c,37 :: 		TFT_Circle(Xtarget,Ytarget,1);
MOVW	R0, #lo_addr(Game_Ytarget_L0+0)
MOVT	R0, #hi_addr(Game_Ytarget_L0+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(Game_Xtarget_L0+0)
MOVT	R0, #hi_addr(Game_Xtarget_L0+0)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
;Game.c,38 :: 		}
L_Game0:
;Game.c,39 :: 		if(Button(&GPIOD_IDR, 4, 1, 0)) flag=0;
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_Game1
MOVS	R1, #0
MOVW	R0, #lo_addr(Game_flag_L0+0)
MOVT	R0, #hi_addr(Game_flag_L0+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_Game2
L_Game1:
;Game.c,40 :: 		else if(Button(&GPIOD_IDR, 2, 1, 0)) flag=1;
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_Game3
MOVS	R1, #1
MOVW	R0, #lo_addr(Game_flag_L0+0)
MOVT	R0, #hi_addr(Game_flag_L0+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_Game4
L_Game3:
;Game.c,41 :: 		else if(Button(&GPIOB_IDR, 5, 1, 0)) flag=2;
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_Game5
MOVS	R1, #2
MOVW	R0, #lo_addr(Game_flag_L0+0)
MOVT	R0, #hi_addr(Game_flag_L0+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_Game6
L_Game5:
;Game.c,42 :: 		else if(Button(&GPIOA_IDR, 6, 1, 0)) flag=3;
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_Game7
MOVS	R1, #3
MOVW	R0, #lo_addr(Game_flag_L0+0)
MOVT	R0, #hi_addr(Game_flag_L0+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_Game8
L_Game7:
;Game.c,43 :: 		else if(Button(&GPIOD_IDR, 15, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #15
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_Game9
;Game.c,45 :: 		while(Button(&GPIOD_IDR, 15, 1, 1)){}
L_Game10:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #15
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_Game11
IT	AL
BAL	L_Game10
L_Game11:
;Game.c,46 :: 		Page=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Page+0)
MOVT	R0, #hi_addr(_Page+0)
STRB	R1, [R0, #0]
;Game.c,47 :: 		flag=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(Game_flag_L0+0)
MOVT	R0, #hi_addr(Game_flag_L0+0)
STRB	R1, [R0, #0]
;Game.c,48 :: 		X=150,Y=150,Xtarget=25,Ytarget=120,raduis=10,step=1;
MOVS	R1, #150
MOVW	R0, #lo_addr(Game_X_L0+0)
MOVT	R0, #hi_addr(Game_X_L0+0)
STR	R1, [R0, #0]
MOVS	R1, #150
MOVW	R0, #lo_addr(Game_Y_L0+0)
MOVT	R0, #hi_addr(Game_Y_L0+0)
STR	R1, [R0, #0]
MOVS	R1, #25
MOVW	R0, #lo_addr(Game_Xtarget_L0+0)
MOVT	R0, #hi_addr(Game_Xtarget_L0+0)
STR	R1, [R0, #0]
MOVS	R1, #120
MOVW	R0, #lo_addr(Game_Ytarget_L0+0)
MOVT	R0, #hi_addr(Game_Ytarget_L0+0)
STR	R1, [R0, #0]
MOVS	R1, #10
MOVW	R0, #lo_addr(Game_raduis_L0+0)
MOVT	R0, #hi_addr(Game_raduis_L0+0)
STR	R1, [R0, #0]
MOVS	R1, #1
MOVW	R0, #lo_addr(Game_step_L0+0)
MOVT	R0, #hi_addr(Game_step_L0+0)
STR	R1, [R0, #0]
;Game.c,49 :: 		TFT_Set_Pen(CL_BLACK,10);
MOVS	R1, #10
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;Game.c,50 :: 		TFT_Circle(Xtarget,Ytarget,1);
MOVW	R0, #lo_addr(Game_Ytarget_L0+0)
MOVT	R0, #hi_addr(Game_Ytarget_L0+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(Game_Xtarget_L0+0)
MOVT	R0, #hi_addr(Game_Xtarget_L0+0)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
;Game.c,51 :: 		Menu_Init();
BL	_Menu_Init+0
;Game.c,52 :: 		return;
IT	AL
BAL	L_end_Game
;Game.c,53 :: 		}
L_Game9:
L_Game8:
L_Game6:
L_Game4:
L_Game2:
;Game.c,54 :: 		TFT_Set_Pen(CL_BLACK,raduis);
MOVW	R0, #lo_addr(Game_raduis_L0+0)
MOVT	R0, #hi_addr(Game_raduis_L0+0)
LDR	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;Game.c,55 :: 		TFT_Circle(X,Y,1);
MOVW	R0, #lo_addr(Game_Y_L0+0)
MOVT	R0, #hi_addr(Game_Y_L0+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(Game_X_L0+0)
MOVT	R0, #hi_addr(Game_X_L0+0)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
;Game.c,56 :: 		if(flag==0)
MOVW	R0, #lo_addr(Game_flag_L0+0)
MOVT	R0, #hi_addr(Game_flag_L0+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Game12
;Game.c,58 :: 		Y=Y-step;
MOVW	R0, #lo_addr(Game_step_L0+0)
MOVT	R0, #hi_addr(Game_step_L0+0)
LDR	R2, [R0, #0]
MOVW	R1, #lo_addr(Game_Y_L0+0)
MOVT	R1, #hi_addr(Game_Y_L0+0)
LDR	R0, [R1, #0]
SUB	R0, R0, R2
STR	R0, [R1, #0]
;Game.c,59 :: 		if(Y<0)Y=240;
CMP	R0, #0
IT	GE
BGE	L_Game13
MOVS	R1, #240
MOVW	R0, #lo_addr(Game_Y_L0+0)
MOVT	R0, #hi_addr(Game_Y_L0+0)
STR	R1, [R0, #0]
L_Game13:
;Game.c,60 :: 		TFT_Set_Pen(CL_RED,raduis);
MOVW	R0, #lo_addr(Game_raduis_L0+0)
MOVT	R0, #hi_addr(Game_raduis_L0+0)
LDR	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;Game.c,61 :: 		TFT_Circle(X,Y,1);
MOVW	R0, #lo_addr(Game_Y_L0+0)
MOVT	R0, #hi_addr(Game_Y_L0+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(Game_X_L0+0)
MOVT	R0, #hi_addr(Game_X_L0+0)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
;Game.c,62 :: 		}
IT	AL
BAL	L_Game14
L_Game12:
;Game.c,63 :: 		else if(flag==1)
MOVW	R0, #lo_addr(Game_flag_L0+0)
MOVT	R0, #hi_addr(Game_flag_L0+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Game15
;Game.c,65 :: 		X=X-step;
MOVW	R0, #lo_addr(Game_step_L0+0)
MOVT	R0, #hi_addr(Game_step_L0+0)
LDR	R2, [R0, #0]
MOVW	R1, #lo_addr(Game_X_L0+0)
MOVT	R1, #hi_addr(Game_X_L0+0)
LDR	R0, [R1, #0]
SUB	R0, R0, R2
STR	R0, [R1, #0]
;Game.c,66 :: 		if(X<0)X=320;
CMP	R0, #0
IT	GE
BGE	L_Game16
MOVW	R1, #320
MOVW	R0, #lo_addr(Game_X_L0+0)
MOVT	R0, #hi_addr(Game_X_L0+0)
STR	R1, [R0, #0]
L_Game16:
;Game.c,67 :: 		TFT_Set_Pen(CL_RED,raduis);
MOVW	R0, #lo_addr(Game_raduis_L0+0)
MOVT	R0, #hi_addr(Game_raduis_L0+0)
LDR	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;Game.c,68 :: 		TFT_Circle(X,Y,1);
MOVW	R0, #lo_addr(Game_Y_L0+0)
MOVT	R0, #hi_addr(Game_Y_L0+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(Game_X_L0+0)
MOVT	R0, #hi_addr(Game_X_L0+0)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
;Game.c,69 :: 		}
IT	AL
BAL	L_Game17
L_Game15:
;Game.c,70 :: 		else if(flag==2)
MOVW	R0, #lo_addr(Game_flag_L0+0)
MOVT	R0, #hi_addr(Game_flag_L0+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_Game18
;Game.c,72 :: 		Y=Y+step;
MOVW	R0, #lo_addr(Game_step_L0+0)
MOVT	R0, #hi_addr(Game_step_L0+0)
LDR	R2, [R0, #0]
MOVW	R1, #lo_addr(Game_Y_L0+0)
MOVT	R1, #hi_addr(Game_Y_L0+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, R2
STR	R0, [R1, #0]
;Game.c,73 :: 		if(Y>240)Y=0;
CMP	R0, #240
IT	LE
BLE	L_Game19
MOVS	R1, #0
MOVW	R0, #lo_addr(Game_Y_L0+0)
MOVT	R0, #hi_addr(Game_Y_L0+0)
STR	R1, [R0, #0]
L_Game19:
;Game.c,74 :: 		TFT_Set_Pen(CL_RED,raduis);
MOVW	R0, #lo_addr(Game_raduis_L0+0)
MOVT	R0, #hi_addr(Game_raduis_L0+0)
LDR	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;Game.c,75 :: 		TFT_Circle(X,Y,1);
MOVW	R0, #lo_addr(Game_Y_L0+0)
MOVT	R0, #hi_addr(Game_Y_L0+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(Game_X_L0+0)
MOVT	R0, #hi_addr(Game_X_L0+0)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
;Game.c,76 :: 		}
IT	AL
BAL	L_Game20
L_Game18:
;Game.c,77 :: 		else if(flag==3)
MOVW	R0, #lo_addr(Game_flag_L0+0)
MOVT	R0, #hi_addr(Game_flag_L0+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	NE
BNE	L_Game21
;Game.c,79 :: 		X=X+step;
MOVW	R0, #lo_addr(Game_step_L0+0)
MOVT	R0, #hi_addr(Game_step_L0+0)
LDR	R2, [R0, #0]
MOVW	R1, #lo_addr(Game_X_L0+0)
MOVT	R1, #hi_addr(Game_X_L0+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, R2
STR	R0, [R1, #0]
;Game.c,80 :: 		if(X>320)X=0;
CMP	R0, #320
IT	LE
BLE	L_Game22
MOVS	R1, #0
MOVW	R0, #lo_addr(Game_X_L0+0)
MOVT	R0, #hi_addr(Game_X_L0+0)
STR	R1, [R0, #0]
L_Game22:
;Game.c,81 :: 		TFT_Set_Pen(CL_RED,raduis);
MOVW	R0, #lo_addr(Game_raduis_L0+0)
MOVT	R0, #hi_addr(Game_raduis_L0+0)
LDR	R0, [R0, #0]
UXTB	R1, R0
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;Game.c,82 :: 		TFT_Circle(X,Y,1);
MOVW	R0, #lo_addr(Game_Y_L0+0)
MOVT	R0, #hi_addr(Game_Y_L0+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(Game_X_L0+0)
MOVT	R0, #hi_addr(Game_X_L0+0)
LDR	R0, [R0, #0]
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
;Game.c,83 :: 		}
L_Game21:
L_Game20:
L_Game17:
L_Game14:
;Game.c,86 :: 		}
L_end_Game:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Game
