#include <stdio.h>
#include <math.h>

main () {
    float x, a, b, c;

    printf ("Escolha a opção:\n1 - Soma de 2 números.\n2 - Diferença entre 2 números (maior pelo menor).\n3 - Produto entre 2 números.\n4 - Divisão entre 2 números (o denominador não pode ser zero).\nOpção\n");
    scanf ("%f", &x);

    if (x == 1) {
        printf ("Soma de 2 números.\nInsira os números:");
        scanf ("%f%f", &a, &b);
        c = a+b;
        printf ("O resultado da soma é: %f", c);
    }
    if (x == 2) {
        printf ("Diferença entre 2 números (maior pelo menor).\nInsira os dois números");
        scanf ("%f%f", &a, &b);
            if (a>b) {
                c = a-b;
                printf ("O resultado da diferença é %f", c);
            } else {
                c = b-a;
                printf ("O resultado da diferença é %f", c);
            }
    }
    if (x == 3) {
        printf ("Produto entre dois números\nInsira os números:");
        scanf ("%f%f", &a, &b);
        c = a*b;
        printf ("O resultado do produto é: %f", c);
    }
    if (x == 4) {
        printf ("Divisão entre 2 números (o denominador não pode ser zero).\nInsira o numerador e depois o denominador\n:");
        scanf ("%f%f", &a, &b);
        if (!b == 0) {
            c = a/b;
            printf ("O resultado do quociente é: %f\n", c);
        } else {
            printf ("Opção inválida!");
            }
                }
    if ((!x == 1) || (!x == 2) || (!x == 3) || (!x == 4)){
        printf ("Opção inválida");
    }
}


