#include <stdio.h>

main () {
    float a1, n, r;
    int i;

    printf ("Insira a1, n, e r: ");
    scanf ("%f%f%f", &a1, &n, &r);

    for (i=0; i<n; i++) {
        printf ("%f", a1);
        a1 = a1+r;
    }
}
