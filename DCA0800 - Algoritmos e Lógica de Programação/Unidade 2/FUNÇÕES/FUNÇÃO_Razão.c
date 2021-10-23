#include <stdio.h>

float divisao(float q, float w) {
    float r;
    r = q/w;
    return r;
}

main () {
    float a, b;

    scanf("%f%f", &a, &b);

    printf("%f", divisao(a, b));

}
