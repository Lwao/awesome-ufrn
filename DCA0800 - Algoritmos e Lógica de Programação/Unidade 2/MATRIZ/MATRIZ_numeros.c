#include <stdio.h>

main () {
    int num[2][3], i, j;

    for (i=0; i<=1; i++) {
        for (j=0; j<=2; j++) {
            scanf ("%d", &num[i][j]);
        }
    }
   printf("----------------\n");
    for (i=0; i<=1; i++) {
        for (j=0; j<=2; j++) {
            printf ("| %d", num[i][j]);
        }
        printf ("|\n");
        printf ("------------------\n");
    }
}
