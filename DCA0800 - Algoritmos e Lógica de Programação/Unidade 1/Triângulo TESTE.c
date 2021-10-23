#include <stdio.h>

main () {
    float a, b, c;

    printf("Inserir os lados a, b e c de um triângulo, respectivamente: \n");
    scanf ("%f%f%f", &a, &b, &c);

    if (((a + b) < c) || ((a + c) < b) || ((b + c) < a)){
        printf ("Não é um triângulo!\n");
    } else {
        if ((a==b) && (b==c)) {
            printf ("O seu triângulo é EQUILÁTERO\n");
        } else {
            if (!(a==b) && !(b==c) && !(a==c)) {
                printf ("O seu triângulo é ESCALENO\n");
            } else {
                if (!(a==b) && (b==c) || !(b==c) && (c==a) || !(c==a) && (a==b)) {
                    printf ("O seu triângulo é ISÓCELES\n");
                }
            }
        }
    }
}
