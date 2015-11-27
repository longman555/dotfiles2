#include <stdio.h>
#include <stdlib.h>

int sum(int a, int b) { return a + b; }

int main(void) {

    printf("Hello, world!\n");
    printf("1 + 2 = %d\n", sum(1, 2));

    return EXIT_SUCCESS;
}
