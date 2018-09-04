_buzzer:
;task3.c,4 :: 		void buzzer(u8 frequency_KHz,f32 Duty,u32 Time_s )
; Time_s start address is: 4 (R1)
; Duty start address is: 0 (R0)
SUB	SP, SP, #28
STR	LR, [SP, #0]
; frequency_KHz start address is: 0 (R0)
VMOV.F32	S3, S0
; Time_s end address is: 4 (R1)
; Duty end address is: 0 (R0)
; frequency_KHz end address is: 0 (R0)
; frequency_KHz start address is: 0 (R0)
; Duty start address is: 12 (R3)
; Time_s start address is: 4 (R1)
;task3.c,6 :: 		f32 Period_Time_us=1000.0/frequency_KHz;
VMOV	S1, R0
VCVT.F32	#0, S1, S1
; frequency_KHz end address is: 0 (R0)
MOVW	R2, #0
MOVT	R2, #17530
VMOV	S0, R2
VDIV.F32	S1, S0, S1
; Period_Time_us start address is: 8 (R2)
VMOV.F32	S2, S1
;task3.c,7 :: 		u32 high=Period_Time_us*Duty;
VMUL.F32	S0, S1, S3
; Duty end address is: 12 (R3)
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
; high start address is: 40 (R10)
MOV	R10, R2
;task3.c,8 :: 		u32 low= Period_Time_us-high;
VMOV	S0, R2
VCVT.F32	#0, S0, S0
VSUB.F32	S0, S1, S0
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
; low start address is: 44 (R11)
MOV	R11, R2
;task3.c,9 :: 		u32 counter=0;
;task3.c,11 :: 		u64 num_of_cycles=((u64)Time_s*1000000)/(u64)Period_Time_us;
MOV	R6, R1
MOVS	R7, #0
; Time_s end address is: 4 (R1)
MOVW	R4, #16960
MOVT	R4, #15
MOVS	R5, #0
UMULL	R2, R3, R6, R4
MLA	R3, R7, R4, R3
MLA	R3, R6, R5, R3
STRD	R2, R3, [SP, #20]
VMOV	R0, S2
BL	__FloatToUnsignedLongLong+0
; Period_Time_us end address is: 8 (R2)
STRD	R0, R1, [SP, #12]
LDRD	R0, R1, [SP, #20]
STRD	R2, R3, [SP, #4]
LDRD	R2, R3, [SP, #12]
BL	__Div_64x64_U+0
LDRD	R2, R3, [SP, #4]
; num_of_cycles start address is: 0 (R0)
;task3.c,12 :: 		for(counter1=0;counter1<num_of_cycles;counter1++)
; counter1 start address is: 24 (R6)
MOVS	R6, #0
MOVS	R7, #0
; high end address is: 40 (R10)
; low end address is: 44 (R11)
; num_of_cycles end address is: 0 (R0)
; counter1 end address is: 24 (R6)
MOV	R5, R10
MOV	R4, R11
L_buzzer0:
; counter1 start address is: 24 (R6)
; num_of_cycles start address is: 0 (R0)
; low start address is: 16 (R4)
; high start address is: 20 (R5)
SUBS	R2, R6, R0
SBCS	R2, R7, R1, LSL #0
IT	CS
BCS	L_buzzer1
;task3.c,14 :: 		GPIOE_ODR|=1<<14;
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
LDR	R2, [R2, #0]
ORR	R3, R2, #16384
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
;task3.c,15 :: 		for(counter=0;counter<high;counter++)Delay_us(1);
; counter start address is: 12 (R3)
MOVS	R3, #0
; num_of_cycles end address is: 0 (R0)
; low end address is: 16 (R4)
; high end address is: 20 (R5)
; counter end address is: 12 (R3)
; counter1 end address is: 24 (R6)
L_buzzer3:
; counter start address is: 12 (R3)
; high start address is: 20 (R5)
; low start address is: 16 (R4)
; num_of_cycles start address is: 0 (R0)
; counter1 start address is: 24 (R6)
CMP	R3, R5
IT	CS
BCS	L_buzzer4
STRD	R6, R7, [SP, #4]
MOVW	R7, #3
MOVT	R7, #0
NOP
NOP
L_buzzer6:
SUBS	R7, R7, #1
BNE	L_buzzer6
NOP
NOP
NOP
NOP
LDRD	R6, R7, [SP, #4]
ADDS	R3, R3, #1
; counter end address is: 12 (R3)
IT	AL
BAL	L_buzzer3
L_buzzer4:
;task3.c,16 :: 		GPIOE_ODR&=~(1<<14);
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
LDR	R3, [R2, #0]
MVN	R2, #16384
ANDS	R3, R2
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
STR	R3, [R2, #0]
;task3.c,17 :: 		for(counter=0;counter<low;counter++)Delay_us(1);
; counter start address is: 12 (R3)
MOVS	R3, #0
; num_of_cycles end address is: 0 (R0)
; low end address is: 16 (R4)
; high end address is: 20 (R5)
; counter end address is: 12 (R3)
; counter1 end address is: 24 (R6)
L_buzzer8:
; counter start address is: 12 (R3)
; counter1 start address is: 24 (R6)
; num_of_cycles start address is: 0 (R0)
; low start address is: 16 (R4)
; high start address is: 20 (R5)
CMP	R3, R4
IT	CS
BCS	L_buzzer9
STRD	R6, R7, [SP, #4]
MOVW	R7, #3
MOVT	R7, #0
NOP
NOP
L_buzzer11:
SUBS	R7, R7, #1
BNE	L_buzzer11
NOP
NOP
NOP
NOP
LDRD	R6, R7, [SP, #4]
ADDS	R3, R3, #1
; counter end address is: 12 (R3)
IT	AL
BAL	L_buzzer8
L_buzzer9:
;task3.c,12 :: 		for(counter1=0;counter1<num_of_cycles;counter1++)
ADDS	R6, R6, #1
ADC	R7, R7, #0
;task3.c,18 :: 		}
; num_of_cycles end address is: 0 (R0)
; low end address is: 16 (R4)
; high end address is: 20 (R5)
; counter1 end address is: 24 (R6)
IT	AL
BAL	L_buzzer0
L_buzzer1:
;task3.c,19 :: 		}
L_end_buzzer:
LDR	LR, [SP, #0]
ADD	SP, SP, #28
BX	LR
; end of _buzzer
_main:
;task3.c,20 :: 		void main() {
;task3.c,21 :: 		GPIO_Digital_Output(&GPIOE_ODR,_GPIO_PINMASK_14);
MOVW	R1, #16384
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
BL	_GPIO_Digital_Output+0
;task3.c,22 :: 		buzzer(25,0.5,5);
MOVS	R1, #5
VMOV.F32	S0, #0.5
MOVS	R0, #25
BL	_buzzer+0
;task3.c,23 :: 		Delay_ms(5000);
MOVW	R7, #59049
MOVT	R7, #406
NOP
NOP
L_main13:
SUBS	R7, R7, #1
BNE	L_main13
NOP
NOP
;task3.c,26 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
