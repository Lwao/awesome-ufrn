#include <stdio.h>

main () {
    int i, j, o, det;

    printf ("CÁLCULO DA DETERMINANTE DE UMA MATRIZ ATÉ 2X2\n\n");

// Solicitar a ordem da matriz

    printf ("DIGITE A ORDEM DA MATRIZ: ");
    scanf ("%d", &o);
    printf ("\n\n");
    int matriz[o][o];

// Leitura e cálculos

    if (o==1) {
        //Leitura
        printf ("Insira na posição matriz[%d][%d]: ", o, o);
        scanf ("%d", &matriz[o][o]);
        printf ("\n\n");
        //Impressão da matriz
        printf("%d\n\n", matriz[o][o]);
        //Cálculo
        printf ("O determinante é: %d", matriz[o][o]);

    }
    if (o==2){
        //Leitura
        for (i=0; i<o; i++){
            for (j=0; j<o; j++){
                printf("Insira na posição matriz[%d][%d]: ", i+1, j+1);
                scanf("%d", &matriz[i][j]);
                printf("\n");
            }
        }
        //Impressão
        for (i=0; i<o; i++){
            for (j=0; j<o; j++){
                printf("%d ", matriz[i][j]);
            }
            printf("\n");
        }
        //Cálculo
        det=(matriz[0][0]*matriz[1][1])-(matriz[0][1]*matriz[1][0]);
        printf ("O determinante é: %d", det);
    }
}
