_main:
;task1.c,1 :: 		void main()
;task1.c,3 :: 		GPIO_Digital_Output(&GPIOA_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
BL	_GPIO_Digital_Output+0
;task1.c,4 :: 		GPIOA_ODR=0xffffffff;
MOV	R1, #-1
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
STR	R1, [R0, #0]
;task1.c,5 :: 		while(1){}
L_main0:
IT	AL
BAL	L_main0
;task1.c,6 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
