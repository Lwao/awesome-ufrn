#include <stdio.h>

main () {
    int A, B, A1, B1;
    printf("Insira uma variável A e uma B, respectivamente\n");
    scanf("%d%d", &A, &B);
    printf("Agora os valores serão invertidos\n");
    A1 = B;
    B1 = A;
    printf("O valor da variável A e B, são agora, respectivamente: %d e %d\n", A1, B1);
    }
