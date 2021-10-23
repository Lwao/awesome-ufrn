#include <stdio.h>

main () {
    float a, b, c;

    printf("Inserir os lados a, b e c de um tri�ngulo, respectivamente: \n");
    scanf ("%f%f%f", &a, &b, &c);

    if (((a + b) < c) || ((a + c) < b) || ((b + c) < a)){
        printf ("N�o � um tri�ngulo!\n");
    } else {
        if ((a==b) && (b==c)) {
            printf ("O seu tri�ngulo � EQUIL�TERO\n");
        } else {
            if (!(a==b) && !(b==c) && !(a==c)) {
                printf ("O seu tri�ngulo � ESCALENO\n");
            } else {
                if (!(a==b) && (b==c) || !(b==c) && (c==a) || !(c==a) && (a==b)) {
                    printf ("O seu tri�ngulo � IS�CELES\n");
                }
            }
        }
    }
}
