#include <stdio.h>
#include <stdlib.h>

int add(int a, int b);
int sub(int a, int b);
int mul(int a, int b);
int dev(int a, int b);

int add(int a, int b) { return a + b; }
int sub(int a, int b) { return a - b; }
int mul(int a, int b) { return a * b; }
int dev(int a, int b) { return a / b; }

int main(void) {

    printf("1 + 2 = %d\n", add(1, 2));
    printf("4 - 3 = %d\n", sub(4, 3));
    printf("5 * 6 = %d\n", mul(5, 6));
    printf("8 / 2 = %d\n", dev(8, 2));

    return EXIT_SUCCESS;
}
