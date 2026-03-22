/*
 * HONDANI Digital Clock - Commodore C64 / Ultimate 64
 */

#include <c64/vic.h>
#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <ultimate_lib.h>


int main(void)
{
    printf("%d\n", rand());
    uii_identify();
    printf("%s\n", (char *)uii_data);
    while (1) {
        getchar();
        uii_get_time();
        printf("%s\n", (char *)uii_data);

        // printf("TIME:  %02x:%02x:%02x  \n",
        //         (unsigned char)uii_data[3],
        //         (unsigned char)uii_data[4],
        //         (unsigned char)uii_data[5]);

        // printf("DATE:  %02x/%02x/20%02x\n",
        //         (unsigned char)uii_data[2],
        //         (unsigned char)uii_data[1],
        //         (unsigned char)uii_data[0]);
    }
    return 0;
}
