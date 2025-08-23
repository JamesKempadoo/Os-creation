#include "print.h"

void kernel_main(){
    print_clear();
    print_set_color(PRINT_COLOR_RED, PRINT_COLOR_BROWN);
    print_str("Welcome to our 64-bit kernel!");
}