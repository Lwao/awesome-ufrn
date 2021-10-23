#include <stdio.h>

main () {
    int matriz[2][3], vetor[2], i, j, coluna;

    for (i=0; i<=1; i++) {
        for (j=0; j<=2; j++) {
            scanf ("%d", &matriz[i][j]);
        }
    }

   for (j=0; j<=1; i++) {
        scanf ("%d", &vetor[j]);
    }

   printf ("Escolha uma coluna: ");
   scanf ("%d", &coluna);

   if (coluna>0 && coluna<4) {
       for (i=0; i<=1; i++) {
            matriz[i][coluna-1] = vetor[i];
       }

       for (i=0; i<=1; i++) {
            for (j=0; j<=2; j++) {
                 printf ("%d", matriz[i][j]);

            }
            printf ("\n");
       }

      // imprimir a matriz
