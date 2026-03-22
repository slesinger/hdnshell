/*
 * untitled - Commodore C64
 */

#include <stdio.h>
#include <ultimate_lib.h>
#include <c64/vic.h>

int main(void)
{
    vic.color_border = 4; // Set border color to cyan
    // Print "Hondani rulez!" to the screen
    printf("Hondani rulez!\n");
    return 0;
}
