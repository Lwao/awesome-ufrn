#include <stdio.h>
#include <math.h>

main () {
    float x, a, b, c;

    printf ("Escolha a op��o:\n1 - Soma de 2 n�meros.\n2 - Diferen�a entre 2 n�meros (maior pelo menor).\n3 - Produto entre 2 n�meros.\n4 - Divis�o entre 2 n�meros (o denominador n�o pode ser zero).\nOp��o\n");
    scanf ("%f", &x);

    if (x == 1) {
        printf ("Soma de 2 n�meros.\nInsira os n�meros:");
        scanf ("%f%f", &a, &b);
        c = a+b;
        printf ("O resultado da soma �: %f", c);
    }
    if (x == 2) {
        printf ("Diferen�a entre 2 n�meros (maior pelo menor).\nInsira os dois n�meros");
        scanf ("%f%f", &a, &b);
            if (a>b) {
                c = a-b;
                printf ("O resultado da diferen�a � %f", c);
            } else {
                c = b-a;
                printf ("O resultado da diferen�a � %f", c);
            }
    }
    if (x == 3) {
        printf ("Produto entre dois n�meros\nInsira os n�meros:");
        scanf ("%f%f", &a, &b);
        c = a*b;
        printf ("O resultado do produto �: %f", c);
    }
    if (x == 4) {
        printf ("Divis�o entre 2 n�meros (o denominador n�o pode ser zero).\nInsira o numerador e depois o denominador\n:");
        scanf ("%f%f", &a, &b);
        if (!b == 0) {
            c = a/b;
            printf ("O resultado do quociente �: %f\n", c);
        } else {
            printf ("Op��o inv�lida!");
            }
                }
    if ((!x == 1) || (!x == 2) || (!x == 3) || (!x == 4)){
        printf ("Op��o inv�lida");
    }
}


