#include <stdio.h>

main () {
    int numeros[10], i;

    for (i=0; i<=9; i++) {
        scanf ("%d", &numeros[i]);
    }

    for (i=0; i<=9; i++) {
        if (numeros[i] > 0) {
        printf("%d \n", numeros[i]);
        }
    }
}
