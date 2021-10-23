#include <stdio.h>

main () {
    int A[3][4], B[3][4], i, j, c1, c2, aux;

    for (i=0; i<3; i++) {
        for (j=0; j<4; j++) {
            scanf ("%d", &A[i][j]);
            scanf ("%d", &B[i][j]);
        }
    }
    for (i=0; i<3; i++) {
        for (j=0; j<4; j++) {
            printf ("%d ", A[i][j]-B[i][j]);
        }
        printf ("\n");
    }
}
