#include <stdio.h>

int main () {
    int la, ca, i, j;

// Solicitar linhas e colunas

    printf ("INSERIR A DIMENS�O DA MATRIZ:\n\n");

    printf ("Insira o n�mero de LINHAS da matriz A: ");
    scanf ("%d", &la);
    printf ("\n");
    printf ("Insira o n�mero de COLUNAS da matriz A: ");
    scanf ("%d", &ca);
    printf ("\n");

    int A[la][ca];

// Ler a matriz A

    printf ("INSERIR OS VALORES DA MATRIZ A:\n\n");

    for (i=0; i<la; i++) {
        for (j=0; j<ca; j++) {
            printf ("Insira na posi��o A[%d][%d]: ", i, j);
            scanf ("%d", &A[i][j]);
            printf ("\n");
        }
    }

// Impress�o da matriz A

    printf ("A MATRIZ �: \n\n");

    for (i=0; i<la; i++) {
        for (j=0; j<ca; j++) {
           printf ("%d ", A[i][j]);
        }
        printf ("\n");
    }

// Menor e maior n�mero

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
    printf("O maior n�mero � %d!", maior);
    printf("O menor n�mero � %d!", menor);
}
