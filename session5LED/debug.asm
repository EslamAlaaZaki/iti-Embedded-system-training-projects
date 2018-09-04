_blank:
;debug.c,2 :: 		void blank(unsigned long* reg,int pin)
; pin start address is: 4 (R1)
; reg start address is: 0 (R0)
SXTH	R2, R1
MOV	R1, R0
; pin end address is: 4 (R1)
; reg end address is: 0 (R0)
; reg start address is: 4 (R1)
; pin start address is: 8 (R2)
;debug.c,3 :: 		{       unsigned long counter=0;
; counter start address is: 0 (R0)
MOV	R0, #0
; pin end address is: 8 (R2)
; counter end address is: 0 (R0)
MOV	R4, R0
SXTH	R0, R2
;debug.c,4 :: 		for(;counter<Times;counter++)
L_blank0:
; counter start address is: 16 (R4)
; pin start address is: 0 (R0)
; pin start address is: 0 (R0)
; pin end address is: 0 (R0)
; reg start address is: 4 (R1)
; reg end address is: 4 (R1)
CMP	R4, #5
IT	CS
BCS	L_blank1
; pin end address is: 0 (R0)
; reg end address is: 4 (R1)
;debug.c,6 :: 		*reg|=(1<<pin);
; reg start address is: 4 (R1)
; pin start address is: 0 (R0)
MOVS	R2, #1
SXTH	R2, R2
LSL	R3, R2, R0
SXTH	R3, R3
LDR	R2, [R1, #0]
ORRS	R2, R3
STR	R2, [R1, #0]
;debug.c,7 :: 		Delay_ms(200);
MOVW	R7, #18089
MOVT	R7, #16
NOP
NOP
L_blank3:
SUBS	R7, R7, #1
BNE	L_blank3
NOP
NOP
;debug.c,8 :: 		*reg&=~(1<<pin);
MOVS	R2, #1
SXTH	R2, R2
LSLS	R2, R0
SXTH	R2, R2
MVN	R3, R2
SXTH	R3, R3
LDR	R2, [R1, #0]
ANDS	R2, R3
STR	R2, [R1, #0]
;debug.c,9 :: 		Delay_ms(200);
MOVW	R7, #18089
MOVT	R7, #16
NOP
NOP
L_blank5:
SUBS	R7, R7, #1
BNE	L_blank5
NOP
NOP
;debug.c,4 :: 		for(;counter<Times;counter++)
ADDS	R4, R4, #1
;debug.c,10 :: 		}
; pin end address is: 0 (R0)
; reg end address is: 4 (R1)
; counter end address is: 16 (R4)
IT	AL
BAL	L_blank0
L_blank1:
;debug.c,11 :: 		}
L_end_blank:
BX	LR
; end of _blank
_blank_port:
;debug.c,12 :: 		void blank_port(unsigned long* reg,unsigned long value)
; value start address is: 4 (R1)
; reg start address is: 0 (R0)
MOV	R2, R1
MOV	R1, R0
; value end address is: 4 (R1)
; reg end address is: 0 (R0)
; reg start address is: 4 (R1)
; value start address is: 8 (R2)
;debug.c,14 :: 		unsigned long counter=0;
; counter start address is: 0 (R0)
MOV	R0, #0
; value end address is: 8 (R2)
; counter end address is: 0 (R0)
MOV	R3, R0
MOV	R0, R2
;debug.c,15 :: 		for(;counter<Times;counter++)
L_blank_port7:
; counter start address is: 12 (R3)
; value start address is: 0 (R0)
; value start address is: 0 (R0)
; value end address is: 0 (R0)
; reg start address is: 4 (R1)
; reg end address is: 4 (R1)
CMP	R3, #5
IT	CS
BCS	L_blank_port8
; value end address is: 0 (R0)
; reg end address is: 4 (R1)
;debug.c,17 :: 		*reg=value;
; reg start address is: 4 (R1)
; value start address is: 0 (R0)
STR	R0, [R1, #0]
;debug.c,18 :: 		Delay_ms(200);
MOVW	R7, #18089
MOVT	R7, #16
NOP
NOP
L_blank_port10:
SUBS	R7, R7, #1
BNE	L_blank_port10
NOP
NOP
;debug.c,19 :: 		*reg=0;
MOVS	R2, #0
STR	R2, [R1, #0]
;debug.c,20 :: 		Delay_ms(200);
MOVW	R7, #18089
MOVT	R7, #16
NOP
NOP
L_blank_port12:
SUBS	R7, R7, #1
BNE	L_blank_port12
NOP
NOP
;debug.c,15 :: 		for(;counter<Times;counter++)
ADDS	R3, R3, #1
;debug.c,22 :: 		}
; value end address is: 0 (R0)
; reg end address is: 4 (R1)
; counter end address is: 12 (R3)
IT	AL
BAL	L_blank_port7
L_blank_port8:
;debug.c,24 :: 		}
L_end_blank_port:
BX	LR
; end of _blank_port
_blank_port_all_pins:
;debug.c,25 :: 		void blank_port_all_pins(unsigned long* reg)
; reg start address is: 0 (R0)
MOV	R1, R0
; reg end address is: 0 (R0)
; reg start address is: 4 (R1)
;debug.c,27 :: 		unsigned long counter=0;
; counter start address is: 0 (R0)
MOV	R0, #0
; reg end address is: 4 (R1)
; counter end address is: 0 (R0)
MOV	R2, R0
MOV	R0, R1
;debug.c,28 :: 		for(;counter<Times;counter++)
L_blank_port_all_pins14:
; counter start address is: 8 (R2)
; reg start address is: 0 (R0)
; reg start address is: 0 (R0)
; reg end address is: 0 (R0)
CMP	R2, #5
IT	CS
BCS	L_blank_port_all_pins15
; reg end address is: 0 (R0)
;debug.c,30 :: 		*reg=0xffff;
; reg start address is: 0 (R0)
MOVW	R1, #65535
STR	R1, [R0, #0]
;debug.c,31 :: 		Delay_ms(200);
MOVW	R7, #18089
MOVT	R7, #16
NOP
NOP
L_blank_port_all_pins17:
SUBS	R7, R7, #1
BNE	L_blank_port_all_pins17
NOP
NOP
;debug.c,32 :: 		*reg=0x0;
MOVS	R1, #0
STR	R1, [R0, #0]
;debug.c,33 :: 		Delay_ms(200);
MOVW	R7, #18089
MOVT	R7, #16
NOP
NOP
L_blank_port_all_pins19:
SUBS	R7, R7, #1
BNE	L_blank_port_all_pins19
NOP
NOP
;debug.c,28 :: 		for(;counter<Times;counter++)
ADDS	R2, R2, #1
;debug.c,35 :: 		}
; reg end address is: 0 (R0)
; counter end address is: 8 (R2)
IT	AL
BAL	L_blank_port_all_pins14
L_blank_port_all_pins15:
;debug.c,37 :: 		}
L_end_blank_port_all_pins:
BX	LR
; end of _blank_port_all_pins
