#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

int add(int a, int b);
int sub(int a, int b);
int mul(int a, int b);
int dev(int a, int b);
void test_funcs(void);

int add(int a, int b) { return a + b; }
int sub(int a, int b) { return a - b; }
int mul(int a, int b) { return a * b; }
int dev(int a, int b) { return a / b; }

void test_funcs(void) {
    assert(add(1, 2) == 3);
    assert(add(2, 1) == 3);

    assert(sub(2, 3) == -1);
    assert(sub(3, 2) == 1);

    assert(mul(1, 2) == 2);
    assert(mul(2, 1) == 2);

    assert(dev(6, 2) == 3);
    assert(dev(2, 6) == 0);
}

int main(void) {

    test_funcs();

    printf("1 + 2 = %d\n", add(1, 2));
    printf("4 - 3 = %d\n", sub(4, 3));
    printf("5 * 6 = %d\n", mul(5, 6));
    printf("8 / 2 = %d\n", dev(8, 2));

    return EXIT_SUCCESS;
}
