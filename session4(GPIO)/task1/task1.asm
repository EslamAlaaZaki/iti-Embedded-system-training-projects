_blank:
;task1.c,2 :: 		void blank(unsigned long* reg,int pin)
; pin start address is: 4 (R1)
; reg start address is: 0 (R0)
; pin end address is: 4 (R1)
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
; pin start address is: 4 (R1)
;task1.c,4 :: 		*reg&=~(1<<pin);
MOVS	R2, #1
SXTH	R2, R2
LSLS	R2, R1
SXTH	R2, R2
MVN	R3, R2
SXTH	R3, R3
LDR	R2, [R0, #0]
ANDS	R2, R3
STR	R2, [R0, #0]
;task1.c,5 :: 		Delay_ms(200);
MOVW	R7, #18089
MOVT	R7, #16
NOP
NOP
L_blank0:
SUBS	R7, R7, #1
BNE	L_blank0
NOP
NOP
;task1.c,6 :: 		*reg|=(1<<pin);
MOVS	R2, #1
SXTH	R2, R2
LSL	R3, R2, R1
SXTH	R3, R3
LDR	R2, [R0, #0]
ORRS	R2, R3
STR	R2, [R0, #0]
;task1.c,7 :: 		Delay_ms(200);
MOVW	R7, #18089
MOVT	R7, #16
NOP
NOP
L_blank2:
SUBS	R7, R7, #1
BNE	L_blank2
NOP
NOP
;task1.c,8 :: 		*reg&=~(1<<pin);
MOVS	R2, #1
SXTH	R2, R2
LSLS	R2, R1
SXTH	R2, R2
MVN	R3, R2
SXTH	R3, R3
LDR	R2, [R0, #0]
ANDS	R2, R3
STR	R2, [R0, #0]
;task1.c,9 :: 		Delay_ms(200);
MOVW	R7, #18089
MOVT	R7, #16
NOP
NOP
L_blank4:
SUBS	R7, R7, #1
BNE	L_blank4
NOP
NOP
;task1.c,10 :: 		*reg|=(1<<pin);
MOVS	R2, #1
SXTH	R2, R2
LSL	R3, R2, R1
SXTH	R3, R3
LDR	R2, [R0, #0]
ORRS	R2, R3
STR	R2, [R0, #0]
;task1.c,11 :: 		Delay_ms(200);
MOVW	R7, #18089
MOVT	R7, #16
NOP
NOP
L_blank6:
SUBS	R7, R7, #1
BNE	L_blank6
NOP
NOP
;task1.c,12 :: 		*reg&=~(1<<pin);
MOVS	R2, #1
SXTH	R2, R2
LSLS	R2, R1
SXTH	R2, R2
MVN	R3, R2
SXTH	R3, R3
LDR	R2, [R0, #0]
ANDS	R2, R3
STR	R2, [R0, #0]
;task1.c,13 :: 		Delay_ms(200);
MOVW	R7, #18089
MOVT	R7, #16
NOP
NOP
L_blank8:
SUBS	R7, R7, #1
BNE	L_blank8
NOP
NOP
;task1.c,14 :: 		*reg|=(1<<pin);
MOVS	R2, #1
SXTH	R2, R2
LSL	R3, R2, R1
SXTH	R3, R3
; pin end address is: 4 (R1)
LDR	R2, [R0, #0]
ORRS	R2, R3
STR	R2, [R0, #0]
; reg end address is: 0 (R0)
;task1.c,15 :: 		Delay_ms(200);
MOVW	R7, #18089
MOVT	R7, #16
NOP
NOP
L_blank10:
SUBS	R7, R7, #1
BNE	L_blank10
NOP
NOP
;task1.c,16 :: 		}
L_end_blank:
BX	LR
; end of _blank
_main:
;task1.c,17 :: 		void main()
SUB	SP, SP, #20
;task1.c,20 :: 		int index=0;
MOVW	R0, #0
STRH	R0, [SP, #0]
MOVW	R0, #15
STRH	R0, [SP, #2]
;task1.c,21 :: 		int b=15;
;task1.c,22 :: 		unsigned long* output[4]={&GPIOA_ODR,&GPIOB_ODR,&GPIOC_ODR,&GPIOD_ODR};
ADD	R11, SP, #4
ADD	R10, R11, #16
MOVW	R12, #lo_addr(?ICSmain_output_L0+0)
MOVT	R12, #hi_addr(?ICSmain_output_L0+0)
BL	___CC2DW+0
;task1.c,23 :: 		GPIO_Digital_Input(&GPIOE_IDR,_GPIO_PINMASK_11|_GPIO_PINMASK_12);
MOVW	R1, #6144
MOVW	R0, #lo_addr(GPIOE_IDR+0)
MOVT	R0, #hi_addr(GPIOE_IDR+0)
BL	_GPIO_Digital_Input+0
;task1.c,24 :: 		GPIO_Digital_Output(&GPIOA_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
BL	_GPIO_Digital_Output+0
;task1.c,25 :: 		GPIO_Digital_Output(&GPIOB_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
BL	_GPIO_Digital_Output+0
;task1.c,26 :: 		GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
BL	_GPIO_Digital_Output+0
;task1.c,27 :: 		GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;task1.c,28 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2|_GPIO_PINMASK_4);
MOVS	R1, #20
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;task1.c,29 :: 		GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;task1.c,30 :: 		GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_GPIO_Digital_Input+0
;task1.c,33 :: 		while(1)
L_main12:
;task1.c,35 :: 		if(Button(&GPIOE_IDR, 11, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #11
MOVW	R0, #lo_addr(GPIOE_IDR+0)
MOVT	R0, #hi_addr(GPIOE_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main14
;task1.c,37 :: 		*output[index]=0;
ADD	R1, SP, #4
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
LDR	R1, [R0, #0]
MOVS	R0, #0
STR	R0, [R1, #0]
;task1.c,38 :: 		b--;
LDRSH	R0, [SP, #2]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [SP, #2]
;task1.c,39 :: 		if(b==-1)
CMP	R0, #-1
IT	NE
BNE	L_main15
;task1.c,41 :: 		index++;
LDRSH	R0, [SP, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
;task1.c,42 :: 		index&=3;
AND	R0, R0, #3
SXTH	R0, R0
STRH	R0, [SP, #0]
;task1.c,43 :: 		if(index==0)b=15;
CMP	R0, #0
IT	NE
BNE	L_main16
MOVS	R0, #15
SXTH	R0, R0
STRH	R0, [SP, #2]
IT	AL
BAL	L_main17
L_main16:
;task1.c,44 :: 		else if(index==1)b=12;
LDRSH	R0, [SP, #0]
CMP	R0, #1
IT	NE
BNE	L_main18
MOVS	R0, #12
SXTH	R0, R0
STRH	R0, [SP, #2]
IT	AL
BAL	L_main19
L_main18:
;task1.c,45 :: 		else if(index==2)b=13;
LDRSH	R0, [SP, #0]
CMP	R0, #2
IT	NE
BNE	L_main20
MOVS	R0, #13
SXTH	R0, R0
STRH	R0, [SP, #2]
IT	AL
BAL	L_main21
L_main20:
;task1.c,46 :: 		else if(index==3)b=15;
LDRSH	R0, [SP, #0]
CMP	R0, #3
IT	NE
BNE	L_main22
MOVS	R0, #15
SXTH	R0, R0
STRH	R0, [SP, #2]
L_main22:
L_main21:
L_main19:
L_main17:
;task1.c,47 :: 		}
L_main15:
;task1.c,48 :: 		*output[index]|=1<<b;
ADD	R1, SP, #4
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
LDR	R2, [R0, #0]
LDRSH	R1, [SP, #2]
MOVS	R0, #1
SXTH	R0, R0
LSL	R1, R0, R1
SXTH	R1, R1
LDR	R0, [R2, #0]
ORRS	R0, R1
STR	R0, [R2, #0]
;task1.c,49 :: 		while(Button(&GPIOE_IDR, 11, 1, 1)) {}
L_main23:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #11
MOVW	R0, #lo_addr(GPIOE_IDR+0)
MOVT	R0, #hi_addr(GPIOE_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main24
IT	AL
BAL	L_main23
L_main24:
;task1.c,50 :: 		}
IT	AL
BAL	L_main25
L_main14:
;task1.c,51 :: 		else if(Button(&GPIOE_IDR, 12, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #12
MOVW	R0, #lo_addr(GPIOE_IDR+0)
MOVT	R0, #hi_addr(GPIOE_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main26
;task1.c,53 :: 		*output[index]=0;
ADD	R1, SP, #4
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
LDR	R1, [R0, #0]
MOVS	R0, #0
STR	R0, [R1, #0]
;task1.c,54 :: 		b++;
LDRSH	R0, [SP, #2]
ADDS	R0, R0, #1
STRH	R0, [SP, #2]
;task1.c,55 :: 		if(index==0 && b==16){b=0;index=3;}
LDRSH	R0, [SP, #0]
CMP	R0, #0
IT	NE
BNE	L__main83
LDRSH	R0, [SP, #2]
CMP	R0, #16
IT	NE
BNE	L__main82
L__main81:
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #2]
MOVS	R0, #3
SXTH	R0, R0
STRH	R0, [SP, #0]
IT	AL
BAL	L_main30
L__main83:
L__main82:
;task1.c,56 :: 		else if(index==1&&b==13){b=0;index=0;}
LDRSH	R0, [SP, #0]
CMP	R0, #1
IT	NE
BNE	L__main85
LDRSH	R0, [SP, #2]
CMP	R0, #13
IT	NE
BNE	L__main84
L__main80:
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #2]
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #0]
IT	AL
BAL	L_main34
L__main85:
L__main84:
;task1.c,57 :: 		else if(index==2&&b==14){b=0;index=1;}
LDRSH	R0, [SP, #0]
CMP	R0, #2
IT	NE
BNE	L__main87
LDRSH	R0, [SP, #2]
CMP	R0, #14
IT	NE
BNE	L__main86
L__main79:
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #2]
MOVS	R0, #1
SXTH	R0, R0
STRH	R0, [SP, #0]
IT	AL
BAL	L_main38
L__main87:
L__main86:
;task1.c,58 :: 		else if(index==3&&b==16){b=0;index=2;}
LDRSH	R0, [SP, #0]
CMP	R0, #3
IT	NE
BNE	L__main89
LDRSH	R0, [SP, #2]
CMP	R0, #16
IT	NE
BNE	L__main88
L__main78:
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #2]
MOVS	R0, #2
SXTH	R0, R0
STRH	R0, [SP, #0]
L__main89:
L__main88:
L_main38:
L_main34:
L_main30:
;task1.c,59 :: 		*output[index]|=1<<b;
ADD	R1, SP, #4
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
LDR	R2, [R0, #0]
LDRSH	R1, [SP, #2]
MOVS	R0, #1
SXTH	R0, R0
LSL	R1, R0, R1
SXTH	R1, R1
LDR	R0, [R2, #0]
ORRS	R0, R1
STR	R0, [R2, #0]
;task1.c,60 :: 		while(Button(&GPIOE_IDR, 12, 1, 1)) {}
L_main42:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #12
MOVW	R0, #lo_addr(GPIOE_IDR+0)
MOVT	R0, #hi_addr(GPIOE_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main43
IT	AL
BAL	L_main42
L_main43:
;task1.c,61 :: 		}
IT	AL
BAL	L_main44
L_main26:
;task1.c,62 :: 		else if(Button(&GPIOD_IDR, 4, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main45
;task1.c,64 :: 		while(Button(&GPIOD_IDR, 4, 1, 1)) {}
L_main46:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main47
IT	AL
BAL	L_main46
L_main47:
;task1.c,65 :: 		if(b==3||b==7||b==11||b==15)
LDRSH	R0, [SP, #2]
CMP	R0, #3
IT	EQ
BEQ	L__main93
LDRSH	R0, [SP, #2]
CMP	R0, #7
IT	EQ
BEQ	L__main92
LDRSH	R0, [SP, #2]
CMP	R0, #11
IT	EQ
BEQ	L__main91
LDRSH	R0, [SP, #2]
CMP	R0, #15
IT	EQ
BEQ	L__main90
IT	AL
BAL	L_main50
L__main93:
L__main92:
L__main91:
L__main90:
;task1.c,67 :: 		blank(output[index],b);
ADD	R1, SP, #4
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
LDR	R0, [R0, #0]
LDRSH	R1, [SP, #2]
BL	_blank+0
;task1.c,68 :: 		}
IT	AL
BAL	L_main51
L_main50:
;task1.c,71 :: 		*output[index]=0;
ADD	R2, SP, #4
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
LDR	R1, [R0, #0]
MOVS	R0, #0
STR	R0, [R1, #0]
;task1.c,72 :: 		b++;
LDRSH	R0, [SP, #2]
ADDS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [SP, #2]
;task1.c,73 :: 		*output[index]|=(1<<b);
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
LDR	R2, [R0, #0]
MOVS	R0, #1
SXTH	R0, R0
LSL	R1, R0, R1
SXTH	R1, R1
LDR	R0, [R2, #0]
ORRS	R0, R1
STR	R0, [R2, #0]
;task1.c,75 :: 		}
L_main51:
;task1.c,76 :: 		}
IT	AL
BAL	L_main52
L_main45:
;task1.c,77 :: 		else if(Button(&GPIOB_IDR, 5, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main53
;task1.c,79 :: 		while(Button(&GPIOB_IDR, 5, 1, 1)) {}
L_main54:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main55
IT	AL
BAL	L_main54
L_main55:
;task1.c,80 :: 		if(b==0||b==4||b==8||b==12)
LDRSH	R0, [SP, #2]
CMP	R0, #0
IT	EQ
BEQ	L__main97
LDRSH	R0, [SP, #2]
CMP	R0, #4
IT	EQ
BEQ	L__main96
LDRSH	R0, [SP, #2]
CMP	R0, #8
IT	EQ
BEQ	L__main95
LDRSH	R0, [SP, #2]
CMP	R0, #12
IT	EQ
BEQ	L__main94
IT	AL
BAL	L_main58
L__main97:
L__main96:
L__main95:
L__main94:
;task1.c,82 :: 		blank(output[index],b);
ADD	R1, SP, #4
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
LDR	R0, [R0, #0]
LDRSH	R1, [SP, #2]
BL	_blank+0
;task1.c,83 :: 		}
IT	AL
BAL	L_main59
L_main58:
;task1.c,86 :: 		*output[index]=0;
ADD	R2, SP, #4
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
LDR	R1, [R0, #0]
MOVS	R0, #0
STR	R0, [R1, #0]
;task1.c,87 :: 		b--;
LDRSH	R0, [SP, #2]
SUBS	R1, R0, #1
SXTH	R1, R1
STRH	R1, [SP, #2]
;task1.c,88 :: 		*output[index]|=(1<<b);
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
LDR	R2, [R0, #0]
MOVS	R0, #1
SXTH	R0, R0
LSL	R1, R0, R1
SXTH	R1, R1
LDR	R0, [R2, #0]
ORRS	R0, R1
STR	R0, [R2, #0]
;task1.c,90 :: 		}
L_main59:
;task1.c,91 :: 		}
IT	AL
BAL	L_main60
L_main53:
;task1.c,92 :: 		else if(Button(&GPIOD_IDR, 2, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main61
;task1.c,94 :: 		while(Button(&GPIOD_IDR, 2, 1, 1)) {}
L_main62:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main63
IT	AL
BAL	L_main62
L_main63:
;task1.c,95 :: 		if(b<12)
LDRSH	R0, [SP, #2]
CMP	R0, #12
IT	GE
BGE	L_main64
;task1.c,98 :: 		*output[index]=0;
ADD	R2, SP, #4
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
LDR	R1, [R0, #0]
MOVS	R0, #0
STR	R0, [R1, #0]
;task1.c,99 :: 		b=b+4;
LDRSH	R0, [SP, #2]
ADDS	R1, R0, #4
SXTH	R1, R1
STRH	R1, [SP, #2]
;task1.c,100 :: 		*output[index]|=(1<<b);
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
LDR	R2, [R0, #0]
MOVS	R0, #1
SXTH	R0, R0
LSL	R1, R0, R1
SXTH	R1, R1
LDR	R0, [R2, #0]
ORRS	R0, R1
STR	R0, [R2, #0]
;task1.c,101 :: 		}
IT	AL
BAL	L_main65
L_main64:
;task1.c,103 :: 		{      if(index==0)
LDRSH	R0, [SP, #0]
CMP	R0, #0
IT	NE
BNE	L_main66
;task1.c,105 :: 		blank(output[index],b);
ADD	R1, SP, #4
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
LDR	R0, [R0, #0]
LDRSH	R1, [SP, #2]
BL	_blank+0
;task1.c,106 :: 		}
IT	AL
BAL	L_main67
L_main66:
;task1.c,109 :: 		*output[index]=0;
ADD	R2, SP, #4
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
LDR	R1, [R0, #0]
MOVS	R0, #0
STR	R0, [R1, #0]
;task1.c,110 :: 		b=b-12;
LDRSH	R0, [SP, #2]
SUBW	R1, R0, #12
SXTH	R1, R1
STRH	R1, [SP, #2]
;task1.c,111 :: 		index--;
LDRSH	R0, [SP, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [SP, #0]
;task1.c,112 :: 		*output[index]|=(1<<b);
LSLS	R0, R0, #2
ADDS	R0, R2, R0
LDR	R2, [R0, #0]
MOVS	R0, #1
SXTH	R0, R0
LSL	R1, R0, R1
SXTH	R1, R1
LDR	R0, [R2, #0]
ORRS	R0, R1
STR	R0, [R2, #0]
;task1.c,113 :: 		}
L_main67:
;task1.c,114 :: 		}
L_main65:
;task1.c,115 :: 		}
IT	AL
BAL	L_main68
L_main61:
;task1.c,117 :: 		else if(Button(&GPIOA_IDR, 6, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main69
;task1.c,119 :: 		while(Button(&GPIOA_IDR, 6, 1, 1)) {}
L_main70:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main71
IT	AL
BAL	L_main70
L_main71:
;task1.c,120 :: 		if(b>3)
LDRSH	R0, [SP, #2]
CMP	R0, #3
IT	LE
BLE	L_main72
;task1.c,122 :: 		*output[index]=0;
ADD	R2, SP, #4
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
LDR	R1, [R0, #0]
MOVS	R0, #0
STR	R0, [R1, #0]
;task1.c,123 :: 		b=b-4;
LDRSH	R0, [SP, #2]
SUBS	R1, R0, #4
SXTH	R1, R1
STRH	R1, [SP, #2]
;task1.c,124 :: 		*output[index]|=(1<<b);
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
LDR	R2, [R0, #0]
MOVS	R0, #1
SXTH	R0, R0
LSL	R1, R0, R1
SXTH	R1, R1
LDR	R0, [R2, #0]
ORRS	R0, R1
STR	R0, [R2, #0]
;task1.c,125 :: 		}
IT	AL
BAL	L_main73
L_main72:
;task1.c,127 :: 		{      if(index==3)
LDRSH	R0, [SP, #0]
CMP	R0, #3
IT	NE
BNE	L_main74
;task1.c,129 :: 		blank(output[index],b);
ADD	R1, SP, #4
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R1, R0
LDR	R0, [R0, #0]
LDRSH	R1, [SP, #2]
BL	_blank+0
;task1.c,130 :: 		}
IT	AL
BAL	L_main75
L_main74:
;task1.c,133 :: 		*output[index]=0;
ADD	R2, SP, #4
LDRSH	R0, [SP, #0]
LSLS	R0, R0, #2
ADDS	R0, R2, R0
LDR	R1, [R0, #0]
MOVS	R0, #0
STR	R0, [R1, #0]
;task1.c,134 :: 		b=b+12;
LDRSH	R0, [SP, #2]
ADDW	R1, R0, #12
SXTH	R1, R1
STRH	R1, [SP, #2]
;task1.c,135 :: 		index++;
LDRSH	R0, [SP, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [SP, #0]
;task1.c,136 :: 		*output[index]|=(1<<b);
LSLS	R0, R0, #2
ADDS	R0, R2, R0
LDR	R2, [R0, #0]
MOVS	R0, #1
SXTH	R0, R0
LSL	R1, R0, R1
SXTH	R1, R1
LDR	R0, [R2, #0]
ORRS	R0, R1
STR	R0, [R2, #0]
;task1.c,137 :: 		}
L_main75:
;task1.c,138 :: 		}
L_main73:
;task1.c,139 :: 		}
L_main69:
L_main68:
L_main60:
L_main52:
L_main44:
L_main25:
;task1.c,140 :: 		}
IT	AL
BAL	L_main12
;task1.c,143 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
