#include <stdio.h>

int main () {
    int la, ca, i, j, l, c;

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
    printf ("\n\n)");

// Procurar o valor na matriz

    printf ("A sua matriz possui %d LINHAA e %d COLUNAS.\n\n", la, ca);
    printf ("Digite a linha e coluna que você quer procurar:\n");
    printf ("\tLINHA: ");
    scanf ("%d", &l);
    printf ("\n\tCOLUNA: ");
    scanf ("%d", &c);
    printf ("O valor procurado é: %d\n\n\n\n", A[l-1][c-1]);
}
