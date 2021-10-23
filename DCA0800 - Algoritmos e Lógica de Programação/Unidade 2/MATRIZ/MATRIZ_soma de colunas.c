#include <stdio.h>

main () {
    int num[2][3], i, j, coluna, soma=0;

    for (i=0; i<=1; i++) {
        for (j=0; j<=2; j++) {
            scanf ("%d", &num[i][j]);
        }
    }

    printf ("Escolha uma coluna: ");
    scanf ("%d", &coluna);

    if (coluna>0 && coluna<4) {
        for (i=0; i<=1; i++) {
        soma = soma + num[i][coluna-1];
        }
    }
        printf ("Soma: %d, soma);");}
