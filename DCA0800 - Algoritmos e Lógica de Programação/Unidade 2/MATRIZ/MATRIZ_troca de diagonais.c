#include <stdio.h>

int main () {
    int o, i, j, a;
// Solicitar a ordem da matriz

    printf ("INSERIR A ORDEM DA MATRIZ A:\n\n");

    printf ("Insira a ordem da matriz A: ");
    scanf ("%d", &o);
    printf ("\n");

    int A[o][o], p[o], s[o], temp[o];

// Ler a matriz A

    printf ("INSERIR OS VALORES DA MATRIZ A:\n\n");

    for (i=0; i<o; i++) {
        for (j=0; j<o; j++) {
            printf ("Insira na posição A[%d][%d]: ", i+1, j+1);
            scanf ("%d", &A[i][j]);
            printf ("\n");
        }
    }

// Impressão da matriz A

    printf ("A MATRIZ A É: \n\n");

    for (i=0; i<o; i++) {
        for (j=0; j<o; j++) {
           printf ("%d ", A[i][j]);
        }
        printf ("\n");
    }
    printf ("\n\n)");

// Ler diagonais

    for (i=0; i<o; i++){
        p[i]=A[i][i];
        }
    for (i=0; i<o; i++) {
        s[i]=A[i][o-1-i];
        }

// Imprimir diagonais

    printf("A diagonal principal é: ");
    for (i=0; i<o; i++) {
        printf("%d, ", p[i]);
    }
    printf("\n\n");
    printf("A diagonal secundária é: ");
    for (j=0; j<o; j++) {
        printf("%d, ", s[j]);
    }
    printf("\n\n");

// Troca de diagonais

    for (i=0; i<o; i++) {
        temp[i]=p[i];
        p[i]=s[i];
        s[i]=temp[i];
    }

// Re-ler matriz

    for (i=0; i<o; i++){
        A[i][i]=p[i];
    }
    for (i=0; i<o; i++) {
        A[i][o-1-i]=s[i];
    }

// Re-imprimir matriz

    printf ("A MATRIZ A COM DIAGONAIS TROCADAS É: \n\n");

    for (i=0; i<o; i++) {
        for (j=0; j<o; j++) {
           printf ("%d ", A[i][j]);
        }
        printf ("\n");
    }
    printf ("\n\n)");

}
