#line 1 "C:/Users/lab3/Desktop/Eslam_Alaa/session5/task1.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdlib.h"







 typedef struct divstruct {
 int quot;
 int rem;
 } div_t;

 typedef struct ldivstruct {
 long quot;
 long rem;
 } ldiv_t;

 typedef struct uldivstruct {
 unsigned long quot;
 unsigned long rem;
 } uldiv_t;

int abs(int a);
float atof(char * s);
int atoi(char * s);
long atol(char * s);
div_t div(int number, int denom);
ldiv_t ldiv(long number, long denom);
uldiv_t uldiv(unsigned long number, unsigned long denom);
long labs(long x);
long int max(long int a, long int b);
long int min(long int a, long int b);
void srand(unsigned x);
int rand();
int xtoi(char * s);
#line 1 "c:/users/lab3/desktop/eslam_alaa/session5/types.h"


typedef unsigned char u8;
typedef char s8;
typedef unsigned int u16;
typedef int s16;
typedef unsigned long u32;
typedef long s32;
typedef unsigned long long u64;
typedef long long s64;
typedef float f32;
#line 1 "c:/users/lab3/desktop/eslam_alaa/session5/interface.h"
#line 4 "C:/Users/lab3/Desktop/Eslam_Alaa/session5/task1.c"
void main() {

 GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
 while(1)
 {
  GPIOD_ODR|=(1<<12) ;
 Delay_ms(500);
  GPIOD_ODR|=(0xff) ;
 Delay_ms(500);
  GPIOD_ODR^=(0xff00) ;
 Delay_ms(500);
  GPIOD_ODR&=~(1<<3) ;
 Delay_ms(500);
  GPIOD_ODR=0 ;

 }

}
