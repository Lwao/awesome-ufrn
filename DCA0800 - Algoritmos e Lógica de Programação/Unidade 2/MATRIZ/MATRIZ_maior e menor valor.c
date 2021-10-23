#include <stdio.h>

int main () {
    int la, ca, i, j;

// Solicitar linhas e colunas

    printf ("INSERIR A DIMENSÃO DA MATRIZ:\n\n");

    printf ("Insira o número de LINHAS da matriz A: ");
    scanf ("%d", &la);
    printf ("\n");
    printf ("Insira o número de COLUNAS da matriz A: ");
    scanf ("%d", &ca);
    printf ("\n");

    int A[la][ca];

// Ler a matriz A

    printf ("INSERIR OS VALORES DA MATRIZ A:\n\n");

    for (i=0; i<la; i++) {
        for (j=0; j<ca; j++) {
            printf ("Insira na posição A[%d][%d]: ", i, j);
            scanf ("%d", &A[i][j]);
            printf ("\n");
        }
    }

// Impressão da matriz A

    printf ("A MATRIZ É: \n\n");

    for (i=0; i<la; i++) {
        for (j=0; j<ca; j++) {
           printf ("%d ", A[i][j]);
        }
        printf ("\n");
    }

// Menor e maior número

    int maior=0, menor=99999;
    for (i=0; i<la; i++) {
        for (j=0; j<ca; j++) {
           if (A[i][j]>maior) {
                maior = A[i][j];
           }
           if (A[i][j]<menor) {
                menor = A[i][j];
           }
        }
    }
    printf("O maior número é %d!", maior);
    printf("O menor número é %d!", menor);
}
