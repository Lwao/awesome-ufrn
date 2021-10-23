#include <stdio.h>

int main () {
    int la, lb, ca, cb, a, b, mul=0;

// Solicitar linhas e colunas

    printf ("INSERIR A DIMENSÃO DAS MATRIZES:\n\n");

    printf ("Insira o número de LINHAS da matriz A: ");
    scanf ("%d", &la);
    printf ("\n");
    printf ("Insira o número de COLUNAS da matriz A: ");
    scanf ("%d", &ca);
    printf ("\n");
    printf ("Insira o número de LINHAS da matriz B: ");
    scanf ("%d", &lb);
    printf ("\n");
    printf ("Insira o número de COLUNAS da matriz B: ");
    scanf ("%d", &cb);
    printf ("\n");

    int A[la][ca], B[lb][cb], M[ca][lb], i, j;

// Ler a matriz A

    printf ("INSERIR OS VALORES DA MATRIZ A:\n\n");

    for (i=0; i<la; i++) {
        for (j=0; j<ca; j++) {
            printf ("Insira na posição A[%d][%d]: ", i, j);
            scanf ("%d", &A[i][j]);
            printf ("\n");
        }
    }

// Ler a matriz B

    printf ("INSERIR OS VALORES DA MATRIZ B:\n\n");

    for (i=0; i<lb; i++) {
        for (j=0; j<cb; j++) {
            printf ("Insira na posição B[%d][%d]: ", i, j);
            scanf ("%d", &B[i][j]);
            printf ("\n");
        }
    }

// Testar se pode multiplicar

    if (ca!=lb) {
        printf ("Não se pode realziar a multiplicação!\n Número de colunas de A diferente do núemro de linhas de B.");
        return 0;
    }

// Multiplicação das matrizes

    for (a=0; a<la; a++) {
        for (b=0; b<cb; b++) {
            mul=0;
            for (i=0; i<ca; i++) {
                mul=mul+A[a][i]*B[i][b];
            }
            M[a][b]= mul;
        }
    }

// Impressão da nova matriz

    printf ("O RESULTADO DA MULTIPLICAÇÃO É: \n\n");

    for (i=0; i<ca; i++) {
        for (j=0; j<lb; j++) {
           printf ("%d ", M[i][j]);
        }
        printf ("\n");
    }
}
