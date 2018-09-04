_main:
;task2.c,3 :: 		void main() {
;task2.c,5 :: 		GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;task2.c,6 :: 		while(1)
L_main0:
;task2.c,8 :: 		Set_Bit(GPIOD_ODR,12);
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #4096
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;task2.c,9 :: 		Delay_ms(3000);
MOVW	R7, #9214
MOVT	R7, #244
NOP
NOP
L_main2:
SUBS	R7, R7, #1
BNE	L_main2
NOP
NOP
NOP
;task2.c,10 :: 		Set_Half_Port_Low(GPIOD_ODR);
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #255
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;task2.c,11 :: 		Delay_ms(3000);
MOVW	R7, #9214
MOVT	R7, #244
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
;task2.c,12 :: 		Toggle_Half_Port_High(GPIOD_ODR);
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
EOR	R1, R0, #65280
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;task2.c,13 :: 		Delay_ms(3000);
MOVW	R7, #9214
MOVT	R7, #244
NOP
NOP
L_main6:
SUBS	R7, R7, #1
BNE	L_main6
NOP
NOP
NOP
;task2.c,14 :: 		Clear_Bit(GPIOD_ODR,3);
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R1, [R0, #0]
MVN	R0, #8
ANDS	R1, R0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;task2.c,15 :: 		Delay_ms(3000);
MOVW	R7, #9214
MOVT	R7, #244
NOP
NOP
L_main8:
SUBS	R7, R7, #1
BNE	L_main8
NOP
NOP
NOP
;task2.c,16 :: 		Clear_Port(GPIOD_ODR);
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;task2.c,17 :: 		Delay_ms(3000);
MOVW	R7, #9214
MOVT	R7, #244
NOP
NOP
L_main10:
SUBS	R7, R7, #1
BNE	L_main10
NOP
NOP
NOP
;task2.c,18 :: 		}
IT	AL
BAL	L_main0
;task2.c,20 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
