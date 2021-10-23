#include <stdio.h>

main () {
    int n1, n2, n3, a, b, c, i, x=1, y=1, z=1;

    printf("Insira o valor de a, b e c: ");
    scanf("%d%d%d", &a, &b, &c);

    for (i=0; i<a; i++) {
        n1 = x*a;
        printf ("%d x %d = %d\n", x, a, n1);
        x = x+1;
    }
    printf("\n\n");
    for (i=0; i<b; i++) {
        n2 = y*b;
        printf ("%d x %d = %d\n", y, b, n2);
        y = y+1;
    }
    printf("\n\n");
    for (i=0; i<c; i++) {
        n3 = z*c;
        printf ("%d x %d = %d\n", z, c, n3);
        z = z+1;
    }
}

