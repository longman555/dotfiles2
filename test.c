#include <stdio.h>
#include <stdlib.h>

int sum(int a, int b) { return a + b; }
int sub(int a, int b) { return a - b; }

int main(void) {

    printf("Hello, world!\n");
    printf("1 + 2 = %d\n", sum(1, 2));
    printf("4 - 3 = %d\n", sub(4, 3));

    return EXIT_SUCCESS;
}
