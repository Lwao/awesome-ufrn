#include <stdio.h>

main () {
    int a1, n, r, i;

    printf ("Insira o primeiro termo da PA: \n");
    scanf ("%d", &a1);
    printf ("Insira quantos termos possui essa PA: \n");
    scanf ("%d", &n);
    printf ("Insira a razão dessa PA: \n");
    scanf ("%d", &r);

    for (i=0; i<n; i++) {
        printf ("%d\n", a1);
        a1 = a1+r;
    }

}
