_main:
;task1.c,12 :: 		void main() {
SUB	SP, SP, #8
;task1.c,15 :: 		Screen_Init();
BL	_Screen_init+0
;task1.c,16 :: 		Menu_Init();
BL	_Menu_Init+0
;task1.c,17 :: 		while(1)
L_main0:
;task1.c,20 :: 		if(Page==0)
MOVW	R0, #lo_addr(_Page+0)
MOVT	R0, #hi_addr(_Page+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_main2
;task1.c,22 :: 		if(TP_TFT_Press_Detect())
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_main3
;task1.c,24 :: 		for(i=0;i<10;i++)TP_TFT_Get_Coordinates(&x,&y);
MOVS	R0, #0
STRB	R0, [SP, #4]
L_main4:
LDRB	R0, [SP, #4]
CMP	R0, #10
IT	CS
BCS	L_main5
ADD	R1, SP, #2
ADD	R0, SP, #0
BL	_TP_TFT_Get_Coordinates+0
LDRB	R0, [SP, #4]
ADDS	R0, R0, #1
STRB	R0, [SP, #4]
IT	AL
BAL	L_main4
L_main5:
;task1.c,25 :: 		Menu(y);
LDRH	R0, [SP, #2]
BL	_Menu+0
;task1.c,26 :: 		}
L_main3:
;task1.c,27 :: 		}
IT	AL
BAL	L_main7
L_main2:
;task1.c,28 :: 		else if(Page==1)
MOVW	R0, #lo_addr(_Page+0)
MOVT	R0, #hi_addr(_Page+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main8
;task1.c,31 :: 		Game();
BL	_Game+0
;task1.c,34 :: 		}
IT	AL
BAL	L_main9
L_main8:
;task1.c,35 :: 		else if(Page==2)
MOVW	R0, #lo_addr(_Page+0)
MOVT	R0, #hi_addr(_Page+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_main10
;task1.c,37 :: 		if(TP_TFT_Press_Detect())
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_main11
;task1.c,39 :: 		for(i=0;i<10;i++)TP_TFT_Get_Coordinates(&x,&y);
MOVS	R0, #0
STRB	R0, [SP, #4]
L_main12:
LDRB	R0, [SP, #4]
CMP	R0, #10
IT	CS
BCS	L_main13
ADD	R1, SP, #2
ADD	R0, SP, #0
BL	_TP_TFT_Get_Coordinates+0
LDRB	R0, [SP, #4]
ADDS	R0, R0, #1
STRB	R0, [SP, #4]
IT	AL
BAL	L_main12
L_main13:
;task1.c,40 :: 		comm(x,y,0, 0);
MOVS	R3, #0
MOVS	R2, #0
LDRH	R1, [SP, #2]
LDRH	R0, [SP, #0]
BL	_comm+0
;task1.c,41 :: 		}
L_main11:
;task1.c,42 :: 		if(Button(&GPIOD_IDR, 0, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main15
;task1.c,44 :: 		while(Button(&GPIOD_IDR, 0, 1, 1)){}
L_main16:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main17
IT	AL
BAL	L_main16
L_main17:
;task1.c,45 :: 		comm(0,0,0, 1);
MOVS	R3, #1
MOVS	R2, #0
MOVS	R1, #0
MOVS	R0, #0
BL	_comm+0
;task1.c,47 :: 		}
L_main15:
;task1.c,48 :: 		if(Button(&GPIOD_IDR, 1, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main18
;task1.c,50 :: 		while(Button(&GPIOD_IDR, 1, 1, 1)){}
L_main19:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main20
IT	AL
BAL	L_main19
L_main20:
;task1.c,51 :: 		comm(0,0,1, 1);
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #0
MOVS	R0, #0
BL	_comm+0
;task1.c,53 :: 		}
L_main18:
;task1.c,54 :: 		if(Button(&GPIOD_IDR, 2, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main21
;task1.c,56 :: 		while(Button(&GPIOD_IDR, 2, 1, 1)){}
L_main22:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main23
IT	AL
BAL	L_main22
L_main23:
;task1.c,57 :: 		comm(0,0,2, 1);
MOVS	R3, #1
MOVS	R2, #2
MOVS	R1, #0
MOVS	R0, #0
BL	_comm+0
;task1.c,59 :: 		}
L_main21:
;task1.c,60 :: 		if(Button(&GPIOD_IDR, 3, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main24
;task1.c,62 :: 		while(Button(&GPIOD_IDR, 3, 1, 1)){}
L_main25:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main26
IT	AL
BAL	L_main25
L_main26:
;task1.c,63 :: 		comm(0,0,3, 1);
MOVS	R3, #1
MOVS	R2, #3
MOVS	R1, #0
MOVS	R0, #0
BL	_comm+0
;task1.c,65 :: 		}
L_main24:
;task1.c,66 :: 		if(Button(&GPIOD_IDR, 4, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main27
;task1.c,68 :: 		while(Button(&GPIOD_IDR, 4, 1, 1)){}
L_main28:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main29
IT	AL
BAL	L_main28
L_main29:
;task1.c,69 :: 		comm(0,0,4, 1);
MOVS	R3, #1
MOVS	R2, #4
MOVS	R1, #0
MOVS	R0, #0
BL	_comm+0
;task1.c,71 :: 		}
L_main27:
;task1.c,72 :: 		if(Button(&GPIOD_IDR, 5, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main30
;task1.c,74 :: 		while(Button(&GPIOD_IDR, 5, 1, 1)){}
L_main31:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main32
IT	AL
BAL	L_main31
L_main32:
;task1.c,75 :: 		comm(0,0,5, 1);
MOVS	R3, #1
MOVS	R2, #5
MOVS	R1, #0
MOVS	R0, #0
BL	_comm+0
;task1.c,77 :: 		}
L_main30:
;task1.c,78 :: 		if(Button(&GPIOD_IDR, 6, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main33
;task1.c,80 :: 		while(Button(&GPIOD_IDR, 6, 1, 1)){}
L_main34:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main35
IT	AL
BAL	L_main34
L_main35:
;task1.c,81 :: 		comm(0,0,6, 1);
MOVS	R3, #1
MOVS	R2, #6
MOVS	R1, #0
MOVS	R0, #0
BL	_comm+0
;task1.c,83 :: 		}
L_main33:
;task1.c,84 :: 		if(Button(&GPIOD_IDR, 7, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #7
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main36
;task1.c,86 :: 		while(Button(&GPIOD_IDR, 7, 1, 1)){}
L_main37:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #7
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main38
IT	AL
BAL	L_main37
L_main38:
;task1.c,87 :: 		comm(0,0,7, 1);
MOVS	R3, #1
MOVS	R2, #7
MOVS	R1, #0
MOVS	R0, #0
BL	_comm+0
;task1.c,89 :: 		}
L_main36:
;task1.c,90 :: 		if(Button(&GPIOD_IDR, 8, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #8
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main39
;task1.c,92 :: 		while(Button(&GPIOD_IDR, 8, 1, 1)){}
L_main40:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #8
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main41
IT	AL
BAL	L_main40
L_main41:
;task1.c,93 :: 		comm(0,0,8, 1);
MOVS	R3, #1
MOVS	R2, #8
MOVS	R1, #0
MOVS	R0, #0
BL	_comm+0
;task1.c,95 :: 		}
L_main39:
;task1.c,96 :: 		if(Button(&GPIOD_IDR, 9, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #9
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main42
;task1.c,98 :: 		while(Button(&GPIOD_IDR, 9, 1, 1)){}
L_main43:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #9
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main44
IT	AL
BAL	L_main43
L_main44:
;task1.c,99 :: 		comm(0,0,9, 1);
MOVS	R3, #1
MOVS	R2, #9
MOVS	R1, #0
MOVS	R0, #0
BL	_comm+0
;task1.c,101 :: 		}
L_main42:
;task1.c,103 :: 		}
IT	AL
BAL	L_main45
L_main10:
;task1.c,104 :: 		else if(Page==3)
MOVW	R0, #lo_addr(_Page+0)
MOVT	R0, #hi_addr(_Page+0)
LDRB	R0, [R0, #0]
CMP	R0, #3
IT	NE
BNE	L_main46
;task1.c,106 :: 		if(TP_TFT_Press_Detect())
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_main47
;task1.c,108 :: 		for(i=0;i<10;i++)TP_TFT_Get_Coordinates(&x,&y);
MOVS	R0, #0
STRB	R0, [SP, #4]
L_main48:
LDRB	R0, [SP, #4]
CMP	R0, #10
IT	CS
BCS	L_main49
ADD	R1, SP, #2
ADD	R0, SP, #0
BL	_TP_TFT_Get_Coordinates+0
LDRB	R0, [SP, #4]
ADDS	R0, R0, #1
STRB	R0, [SP, #4]
IT	AL
BAL	L_main48
L_main49:
;task1.c,109 :: 		Paint(x,y);
LDRH	R1, [SP, #2]
LDRH	R0, [SP, #0]
BL	_Paint+0
;task1.c,110 :: 		}
L_main47:
;task1.c,111 :: 		}
L_main46:
L_main45:
L_main9:
L_main7:
;task1.c,113 :: 		}
IT	AL
BAL	L_main0
;task1.c,115 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
