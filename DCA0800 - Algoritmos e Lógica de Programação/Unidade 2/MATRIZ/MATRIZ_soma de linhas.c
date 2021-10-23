#include <stdio.h>

main () {
    int num[2][3], i, j, linha, soma=0;

    for (i=0; i<=1; i++) {
        for (j=0; j<=2; j++) {
            scanf ("%d", &num[i][j]);
        }
    }

    printf ("Escolha uma linha: ");
    scanf ("%d", &linha);

    if (linha>0 && linha<3) {
        for (i=0; i<=2; i++) {
        soma = soma + num[linha-1][i];
        }
    }
        printf ("Soma: %d, soma);");}
