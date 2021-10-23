#include <stdio.h>

main () {
    int n, i, fib=0, a=0, b=1;

    printf ("Insira a quantidade de termos da sequência de fibonacci a ser mostrada:");
    scanf ("%d", &n);

    if (n>0) {
        printf ("%d ", a);
    }
    if (n>1) {
        printf ("%d ", b);
    }
    if (n>2) {
        for (i=1; i<=(n-2); i++) {

            fib = a+b;
            printf("%d ", fib);
            a=b;
            b=fib;

        }
    }
}
