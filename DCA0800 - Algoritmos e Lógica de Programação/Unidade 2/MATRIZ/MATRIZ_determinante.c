#include <stdio.h>

main () {
    int i, j, o, det;

    printf ("C�LCULO DA DETERMINANTE DE UMA MATRIZ AT� 2X2\n\n");

// Solicitar a ordem da matriz

    printf ("DIGITE A ORDEM DA MATRIZ: ");
    scanf ("%d", &o);
    printf ("\n\n");
    int matriz[o][o];

// Leitura e c�lculos

    if (o==1) {
        //Leitura
        printf ("Insira na posi��o matriz[%d][%d]: ", o, o);
        scanf ("%d", &matriz[o][o]);
        printf ("\n\n");
        //Impress�o da matriz
        printf("%d\n\n", matriz[o][o]);
        //C�lculo
        printf ("O determinante �: %d", matriz[o][o]);

    }
    if (o==2){
        //Leitura
        for (i=0; i<o; i++){
            for (j=0; j<o; j++){
                printf("Insira na posi��o matriz[%d][%d]: ", i+1, j+1);
                scanf("%d", &matriz[i][j]);
                printf("\n");
            }
        }
        //Impress�o
        for (i=0; i<o; i++){
            for (j=0; j<o; j++){
                printf("%d ", matriz[i][j]);
            }
            printf("\n");
        }
        //C�lculo
        det=(matriz[0][0]*matriz[1][1])-(matriz[0][1]*matriz[1][0]);
        printf ("O determinante �: %d", det);
    }
}
