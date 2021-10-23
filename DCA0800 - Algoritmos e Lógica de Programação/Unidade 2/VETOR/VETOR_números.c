#include <stdio.h>

main () {
    int numeros[5], i;

    for (i=0; i<=4; i++) {
        printf ("Insira o valor da posição %d: ", i+1);
        scanf ("%d", &numeros[i]);
    }

    for (i=0; i<=4; i++) {
        printf ("Vetor na posição %d: %d\n", i+1, numeros[i]);
    }
}
