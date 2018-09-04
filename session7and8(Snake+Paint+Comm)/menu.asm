_Menu_Init:
;menu.c,5 :: 		void Menu_Init(void)
SUB	SP, SP, #4
STR	LR, [SP, #0]
;menu.c,7 :: 		TFT_Fill_Screen(CL_GRAY);
MOVW	R0, #33808
BL	_TFT_Fill_Screen+0
;menu.c,8 :: 		TFT_Set_Pen(CL_NAVY,3);
MOVS	R1, #3
MOVW	R0, #16
BL	_TFT_Set_Pen+0
;menu.c,9 :: 		TFT_Rectangle(0,2,315,80);
MOVS	R3, #80
SXTH	R3, R3
MOVW	R2, #315
SXTH	R2, R2
MOVS	R1, #2
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;menu.c,10 :: 		TFT_Write_Text("Game",150,30);
MOVW	R0, #lo_addr(?lstr1_menu+0)
MOVT	R0, #hi_addr(?lstr1_menu+0)
MOVS	R2, #30
MOVS	R1, #150
BL	_TFT_Write_Text+0
;menu.c,11 :: 		TFT_Rectangle(0,80,315,160);
MOVS	R3, #160
SXTH	R3, R3
MOVW	R2, #315
SXTH	R2, R2
MOVS	R1, #80
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;menu.c,12 :: 		TFT_Write_Text("Communication",130,110);
MOVW	R0, #lo_addr(?lstr2_menu+0)
MOVT	R0, #hi_addr(?lstr2_menu+0)
MOVS	R2, #110
MOVS	R1, #130
BL	_TFT_Write_Text+0
;menu.c,13 :: 		TFT_Rectangle(0,160,315,235);
MOVS	R3, #235
SXTH	R3, R3
MOVW	R2, #315
SXTH	R2, R2
MOVS	R1, #160
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Rectangle+0
;menu.c,14 :: 		TFT_Write_Text("Paint",150,180);
MOVW	R0, #lo_addr(?lstr3_menu+0)
MOVT	R0, #hi_addr(?lstr3_menu+0)
MOVS	R2, #180
MOVS	R1, #150
BL	_TFT_Write_Text+0
;menu.c,15 :: 		}
L_end_Menu_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Menu_Init
_Menu:
;menu.c,17 :: 		void Menu(u32 Y)
; Y start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 0 (R0)
; Y start address is: 0 (R0)
;menu.c,20 :: 		if((Y>80)&&(Y<160)){Page=2;Comm_Init();}
CMP	R0, #80
IT	LS
BLS	L__Menu12
CMP	R0, #160
IT	CS
BCS	L__Menu11
; Y end address is: 0 (R0)
L__Menu10:
MOVS	R2, #2
MOVW	R1, #lo_addr(_Page+0)
MOVT	R1, #hi_addr(_Page+0)
STRB	R2, [R1, #0]
BL	_Comm_Init+0
IT	AL
BAL	L_Menu3
L__Menu12:
; Y start address is: 0 (R0)
L__Menu11:
;menu.c,21 :: 		else if((Y>160)&&(Y<240)){Page=3;Paint_Init(void);}
CMP	R0, #160
IT	LS
BLS	L__Menu14
CMP	R0, #240
IT	CS
BCS	L__Menu13
; Y end address is: 0 (R0)
L__Menu9:
MOVS	R2, #3
MOVW	R1, #lo_addr(_Page+0)
MOVT	R1, #hi_addr(_Page+0)
STRB	R2, [R1, #0]
BL	_Paint_Init+0
IT	AL
BAL	L_Menu7
L__Menu14:
; Y start address is: 0 (R0)
L__Menu13:
;menu.c,22 :: 		else if(Y<80) {Page=1;Game_Init();}
CMP	R0, #80
IT	CS
BCS	L_Menu8
; Y end address is: 0 (R0)
MOVS	R2, #1
MOVW	R1, #lo_addr(_Page+0)
MOVT	R1, #hi_addr(_Page+0)
STRB	R2, [R1, #0]
BL	_Game_Init+0
L_Menu8:
L_Menu7:
L_Menu3:
;menu.c,23 :: 		}
L_end_Menu:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Menu
