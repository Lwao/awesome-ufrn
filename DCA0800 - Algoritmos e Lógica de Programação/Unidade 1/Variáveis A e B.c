#include <stdio.h>

main () {
    int A, B, A1, B1;
    printf("Insira uma vari�vel A e uma B, respectivamente\n");
    scanf("%d%d", &A, &B);
    printf("Agora os valores ser�o invertidos\n");
    A1 = B;
    B1 = A;
    printf("O valor da vari�vel A e B, s�o agora, respectivamente: %d e %d\n", A1, B1);
    }
