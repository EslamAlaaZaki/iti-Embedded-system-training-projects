#include <stdlib.h>
#include "interface.h"
void main() {

    GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
    while(1)
    {
         Set_Bit(GPIOD_ODR,12);
         Delay_ms(3000);
         Set_Half_Port_Low(GPIOD_ODR);
         Delay_ms(3000);
         Toggle_Half_Port_High(GPIOD_ODR);
         Delay_ms(3000);
         Clear_Bit(GPIOD_ODR,3);
         Delay_ms(3000);
         Clear_Port(GPIOD_ODR);
         Delay_ms(3000);
    }

}