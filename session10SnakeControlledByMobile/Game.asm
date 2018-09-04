_Game_Init:
;Game.c,3 :: 		void Game_Init(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Game.c,6 :: 		TFT_Fill_Screen(CL_BLACK);
MOVW	R0, #0
BL	_TFT_Fill_Screen+0
;Game.c,7 :: 		TFT_Set_Pen(CL_RED,10);
MOVS	R1, #10
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;Game.c,8 :: 		TFT_Circle(150,150,1);
MOVS	R2, #1
SXTH	R2, R2
MOVS	R1, #150
SXTH	R1, R1
MOVS	R0, #150
SXTH	R0, R0
BL	_TFT_Circle+0
;Game.c,9 :: 		TFT_Set_Pen(CL_SILVER,10);
MOVS	R1, #10
MOVW	R0, #50712
BL	_TFT_Set_Pen+0
;Game.c,10 :: 		TFT_Circle(25,120,1);
MOVS	R2, #1
SXTH	R2, R2
MOVS	R1, #120
SXTH	R1, R1
MOVS	R0, #25
SXTH	R0, R0
BL	_TFT_Circle+0
;Game.c,12 :: 		}
L_end_Game_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Game_Init
_Game:
;Game.c,13 :: 		void Game(u8 ch)
; ch start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
UXTB	R4, R0
; ch end address is: 0 (R0)
; ch start address is: 16 (R4)
;Game.c,17 :: 		s32 r =(X-Xtarget)*(X-Xtarget)+(Y-Ytarget)*(Y-Ytarget);
MOVW	R1, #lo_addr(Game_Xtarget_L0+0)
MOVT	R1, #hi_addr(Game_Xtarget_L0+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(Game_X_L0+0)
MOVT	R1, #hi_addr(Game_X_L0+0)
LDR	R1, [R1, #0]
SUB	R1, R1, R2
MUL	R3, R1, R1
MOVW	R1, #lo_addr(Game_Ytarget_L0+0)
MOVT	R1, #hi_addr(Game_Ytarget_L0+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(Game_Y_L0+0)
MOVT	R1, #hi_addr(Game_Y_L0+0)
LDR	R1, [R1, #0]
SUB	R1, R1, R2
MULS	R1, R1, R1
ADDS	R3, R3, R1
;Game.c,18 :: 		GPIOD_ODR^=1<<14;
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
LDR	R1, [R1, #0]
EOR	R2, R1, #16384
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R2, [R1, #0]
;Game.c,19 :: 		r=sqrt(r);
VMOV	S0, R3
VCVT.F32	#1, S0, S0
BL	_sqrt+0
VCVT	#1, .F32, S0, S0
VMOV	R3, S0
;Game.c,20 :: 		if(r<=((raduis+10)/2))
MOVW	R1, #lo_addr(Game_raduis_L0+0)
MOVT	R1, #hi_addr(Game_raduis_L0+0)
LDR	R1, [R1, #0]
ADDW	R2, R1, #10
MOVS	R1, #2
SDIV	R1, R2, R1
CMP	R3, R1
IT	GT
BGT	L_Game0
;Game.c,22 :: 		raduis+=2;
MOVW	R2, #lo_addr(Game_raduis_L0+0)
MOVT	R2, #hi_addr(Game_raduis_L0+0)
LDR	R1, [R2, #0]
ADDS	R1, R1, #2
STR	R1, [R2, #0]
;Game.c,23 :: 		step++;
MOVW	R2, #lo_addr(Game_step_L0+0)
MOVT	R2, #hi_addr(Game_step_L0+0)
LDR	R1, [R2, #0]
ADDS	R1, R1, #1
STR	R1, [R2, #0]
;Game.c,24 :: 		TFT_Set_Pen(CL_BLACK,10);
MOVS	R1, #10
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;Game.c,25 :: 		TFT_Circle(Xtarget,Ytarget,1);
MOVW	R1, #lo_addr(Game_Ytarget_L0+0)
MOVT	R1, #hi_addr(Game_Ytarget_L0+0)
STR	R1, [SP, #8]
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(Game_Xtarget_L0+0)
MOVT	R1, #hi_addr(Game_Xtarget_L0+0)
LDR	R1, [R1, #0]
STRB	R4, [SP, #4]
SXTH	R0, R1
SXTH	R1, R2
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
LDRB	R4, [SP, #4]
;Game.c,26 :: 		srand(Xtarget);
MOVW	R1, #lo_addr(Game_Xtarget_L0+0)
MOVT	R1, #hi_addr(Game_Xtarget_L0+0)
LDR	R1, [R1, #0]
UXTH	R0, R1
BL	_srand+0
;Game.c,27 :: 		Xtarget=rand()%320;
BL	_rand+0
MOVW	R1, #320
SXTH	R1, R1
SDIV	R2, R0, R1
MLS	R2, R1, R2, R0
SXTH	R2, R2
MOVW	R1, #lo_addr(Game_Xtarget_L0+0)
MOVT	R1, #hi_addr(Game_Xtarget_L0+0)
STR	R2, [R1, #0]
;Game.c,28 :: 		srand(Ytarget);
LDR	R1, [SP, #8]
LDR	R1, [R1, #0]
UXTH	R0, R1
BL	_srand+0
;Game.c,29 :: 		Ytarget=rand()%240;
BL	_rand+0
MOVS	R1, #240
SXTH	R1, R1
SDIV	R2, R0, R1
MLS	R2, R1, R2, R0
SXTH	R2, R2
MOVW	R1, #lo_addr(Game_Ytarget_L0+0)
MOVT	R1, #hi_addr(Game_Ytarget_L0+0)
STR	R2, [R1, #0]
;Game.c,30 :: 		TFT_Set_Pen(CL_SILVER,10);
MOVS	R1, #10
MOVW	R0, #50712
BL	_TFT_Set_Pen+0
;Game.c,31 :: 		TFT_Circle(Xtarget,Ytarget,1);
MOVW	R1, #lo_addr(Game_Ytarget_L0+0)
MOVT	R1, #hi_addr(Game_Ytarget_L0+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(Game_Xtarget_L0+0)
MOVT	R1, #hi_addr(Game_Xtarget_L0+0)
LDR	R1, [R1, #0]
STRB	R4, [SP, #4]
SXTH	R0, R1
SXTH	R1, R2
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
LDRB	R4, [SP, #4]
;Game.c,32 :: 		}
L_Game0:
;Game.c,33 :: 		if(ch=='F') flag=0;
CMP	R4, #70
IT	NE
BNE	L_Game1
; ch end address is: 16 (R4)
MOVS	R2, #0
MOVW	R1, #lo_addr(Game_flag_L0+0)
MOVT	R1, #hi_addr(Game_flag_L0+0)
STRB	R2, [R1, #0]
IT	AL
BAL	L_Game2
L_Game1:
;Game.c,34 :: 		else if(ch=='L') flag=1;
; ch start address is: 16 (R4)
CMP	R4, #76
IT	NE
BNE	L_Game3
; ch end address is: 16 (R4)
MOVS	R2, #1
MOVW	R1, #lo_addr(Game_flag_L0+0)
MOVT	R1, #hi_addr(Game_flag_L0+0)
STRB	R2, [R1, #0]
IT	AL
BAL	L_Game4
L_Game3:
;Game.c,35 :: 		else if(ch=='B') flag=2;
; ch start address is: 16 (R4)
CMP	R4, #66
IT	NE
BNE	L_Game5
; ch end address is: 16 (R4)
MOVS	R2, #2
MOVW	R1, #lo_addr(Game_flag_L0+0)
MOVT	R1, #hi_addr(Game_flag_L0+0)
STRB	R2, [R1, #0]
IT	AL
BAL	L_Game6
L_Game5:
;Game.c,36 :: 		else if(ch=='R') flag=3;
; ch start address is: 16 (R4)
CMP	R4, #82
IT	NE
BNE	L_Game7
; ch end address is: 16 (R4)
MOVS	R2, #3
MOVW	R1, #lo_addr(Game_flag_L0+0)
MOVT	R1, #hi_addr(Game_flag_L0+0)
STRB	R2, [R1, #0]
L_Game7:
L_Game6:
L_Game4:
L_Game2:
;Game.c,37 :: 		TFT_Set_Pen(CL_BLACK,raduis);
MOVW	R1, #lo_addr(Game_raduis_L0+0)
MOVT	R1, #hi_addr(Game_raduis_L0+0)
LDR	R1, [R1, #0]
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;Game.c,38 :: 		TFT_Circle(X,Y,1);
MOVW	R1, #lo_addr(Game_Y_L0+0)
MOVT	R1, #hi_addr(Game_Y_L0+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(Game_X_L0+0)
MOVT	R1, #hi_addr(Game_X_L0+0)
LDR	R1, [R1, #0]
SXTH	R0, R1
SXTH	R1, R2
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
;Game.c,39 :: 		if(flag==0)
MOVW	R1, #lo_addr(Game_flag_L0+0)
MOVT	R1, #hi_addr(Game_flag_L0+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_Game8
;Game.c,41 :: 		Y=Y-step;
MOVW	R1, #lo_addr(Game_step_L0+0)
MOVT	R1, #hi_addr(Game_step_L0+0)
LDR	R3, [R1, #0]
MOVW	R2, #lo_addr(Game_Y_L0+0)
MOVT	R2, #hi_addr(Game_Y_L0+0)
LDR	R1, [R2, #0]
SUB	R1, R1, R3
STR	R1, [R2, #0]
;Game.c,42 :: 		if(Y<0)Y=240;
CMP	R1, #0
IT	GE
BGE	L_Game9
MOVS	R2, #240
MOVW	R1, #lo_addr(Game_Y_L0+0)
MOVT	R1, #hi_addr(Game_Y_L0+0)
STR	R2, [R1, #0]
L_Game9:
;Game.c,43 :: 		TFT_Set_Pen(CL_RED,raduis);
MOVW	R1, #lo_addr(Game_raduis_L0+0)
MOVT	R1, #hi_addr(Game_raduis_L0+0)
LDR	R1, [R1, #0]
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;Game.c,44 :: 		TFT_Circle(X,Y,1);
MOVW	R1, #lo_addr(Game_Y_L0+0)
MOVT	R1, #hi_addr(Game_Y_L0+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(Game_X_L0+0)
MOVT	R1, #hi_addr(Game_X_L0+0)
LDR	R1, [R1, #0]
SXTH	R0, R1
SXTH	R1, R2
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
;Game.c,45 :: 		}
IT	AL
BAL	L_Game10
L_Game8:
;Game.c,46 :: 		else if(flag==1)
MOVW	R1, #lo_addr(Game_flag_L0+0)
MOVT	R1, #hi_addr(Game_flag_L0+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_Game11
;Game.c,48 :: 		X=X-step;
MOVW	R1, #lo_addr(Game_step_L0+0)
MOVT	R1, #hi_addr(Game_step_L0+0)
LDR	R3, [R1, #0]
MOVW	R2, #lo_addr(Game_X_L0+0)
MOVT	R2, #hi_addr(Game_X_L0+0)
LDR	R1, [R2, #0]
SUB	R1, R1, R3
STR	R1, [R2, #0]
;Game.c,49 :: 		if(X<0)X=320;
CMP	R1, #0
IT	GE
BGE	L_Game12
MOVW	R2, #320
MOVW	R1, #lo_addr(Game_X_L0+0)
MOVT	R1, #hi_addr(Game_X_L0+0)
STR	R2, [R1, #0]
L_Game12:
;Game.c,50 :: 		TFT_Set_Pen(CL_RED,raduis);
MOVW	R1, #lo_addr(Game_raduis_L0+0)
MOVT	R1, #hi_addr(Game_raduis_L0+0)
LDR	R1, [R1, #0]
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;Game.c,51 :: 		TFT_Circle(X,Y,1);
MOVW	R1, #lo_addr(Game_Y_L0+0)
MOVT	R1, #hi_addr(Game_Y_L0+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(Game_X_L0+0)
MOVT	R1, #hi_addr(Game_X_L0+0)
LDR	R1, [R1, #0]
SXTH	R0, R1
SXTH	R1, R2
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
;Game.c,52 :: 		}
IT	AL
BAL	L_Game13
L_Game11:
;Game.c,53 :: 		else if(flag==2)
MOVW	R1, #lo_addr(Game_flag_L0+0)
MOVT	R1, #hi_addr(Game_flag_L0+0)
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	NE
BNE	L_Game14
;Game.c,55 :: 		Y=Y+step;
MOVW	R1, #lo_addr(Game_step_L0+0)
MOVT	R1, #hi_addr(Game_step_L0+0)
LDR	R3, [R1, #0]
MOVW	R2, #lo_addr(Game_Y_L0+0)
MOVT	R2, #hi_addr(Game_Y_L0+0)
LDR	R1, [R2, #0]
ADDS	R1, R1, R3
STR	R1, [R2, #0]
;Game.c,56 :: 		if(Y>240)Y=0;
CMP	R1, #240
IT	LE
BLE	L_Game15
MOVS	R2, #0
MOVW	R1, #lo_addr(Game_Y_L0+0)
MOVT	R1, #hi_addr(Game_Y_L0+0)
STR	R2, [R1, #0]
L_Game15:
;Game.c,57 :: 		TFT_Set_Pen(CL_RED,raduis);
MOVW	R1, #lo_addr(Game_raduis_L0+0)
MOVT	R1, #hi_addr(Game_raduis_L0+0)
LDR	R1, [R1, #0]
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;Game.c,58 :: 		TFT_Circle(X,Y,1);
MOVW	R1, #lo_addr(Game_Y_L0+0)
MOVT	R1, #hi_addr(Game_Y_L0+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(Game_X_L0+0)
MOVT	R1, #hi_addr(Game_X_L0+0)
LDR	R1, [R1, #0]
SXTH	R0, R1
SXTH	R1, R2
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
;Game.c,59 :: 		}
IT	AL
BAL	L_Game16
L_Game14:
;Game.c,60 :: 		else if(flag==3)
MOVW	R1, #lo_addr(Game_flag_L0+0)
MOVT	R1, #hi_addr(Game_flag_L0+0)
LDRB	R1, [R1, #0]
CMP	R1, #3
IT	NE
BNE	L_Game17
;Game.c,62 :: 		X=X+step;
MOVW	R1, #lo_addr(Game_step_L0+0)
MOVT	R1, #hi_addr(Game_step_L0+0)
LDR	R3, [R1, #0]
MOVW	R2, #lo_addr(Game_X_L0+0)
MOVT	R2, #hi_addr(Game_X_L0+0)
LDR	R1, [R2, #0]
ADDS	R1, R1, R3
STR	R1, [R2, #0]
;Game.c,63 :: 		if(X>320)X=0;
CMP	R1, #320
IT	LE
BLE	L_Game18
MOVS	R2, #0
MOVW	R1, #lo_addr(Game_X_L0+0)
MOVT	R1, #hi_addr(Game_X_L0+0)
STR	R2, [R1, #0]
L_Game18:
;Game.c,64 :: 		TFT_Set_Pen(CL_RED,raduis);
MOVW	R1, #lo_addr(Game_raduis_L0+0)
MOVT	R1, #hi_addr(Game_raduis_L0+0)
LDR	R1, [R1, #0]
MOVW	R0, #63488
BL	_TFT_Set_Pen+0
;Game.c,65 :: 		TFT_Circle(X,Y,1);
MOVW	R1, #lo_addr(Game_Y_L0+0)
MOVT	R1, #hi_addr(Game_Y_L0+0)
LDR	R2, [R1, #0]
MOVW	R1, #lo_addr(Game_X_L0+0)
MOVT	R1, #hi_addr(Game_X_L0+0)
LDR	R1, [R1, #0]
SXTH	R0, R1
SXTH	R1, R2
MOVS	R2, #1
SXTH	R2, R2
BL	_TFT_Circle+0
;Game.c,66 :: 		}
L_Game17:
L_Game16:
L_Game13:
L_Game10:
;Game.c,69 :: 		}
L_end_Game:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Game
