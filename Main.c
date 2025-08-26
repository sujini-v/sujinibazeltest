#include <stdio.h>
#include "spi/spi.h"
#include "can/can.h"

const float d=0;
static can;

int main(void)
{
    printf("Hello From main Bazel_stack");
    spi_function();
    can_function();
    return 0;
}
