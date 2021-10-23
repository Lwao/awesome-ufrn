#include <stdio.h>

main () {
    int m[3][4], i, j, c1, c2, aux;

    for (i=0; i<3; i++) {
        for (j=0; j<4; j++) {
            scanf ("%d", &m[i][j]);
        }
    }
    for (i=0; i<3; i++) {
        for (j=0; j<4; j++) {
            printf ("%d ", m[i][j]);
        }
        printf ("\n");
    }

    scanf ("%d%d",&c1, &c2);
    for (i=0; i<3; i++) {
        aux = m[i][c1-1];
        m[i][c1-1]=m[i][c2-1];
        m[i][c2-1]= aux;
    }
}
