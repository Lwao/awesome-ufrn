#include <stdio.h>

main () {
    float a, b, c;
    printf ("Ler três números: ");
    scanf ("%f%f%f", &a, &b, &c);

    if ((a>b) && (b>c)) {
        printf ("O maior número é %f e o menor é %f\n", a, c);
    } else {
        if ((a>c) && (c>b)) {
            printf ("O maior número é %f e o menor é %f\n", a, b);
        } else {
            if ((b>c) && (c>a)) {
                printf ("O maior número é %f e o menor é %f\n", b, a);
            } else {
                if ((b>a) && (a>c)) {
                    printf ("O maior número é %f e o menor é %f\n", b, a);
                } else {
                    if ((c>a) && (a>b)) {
                        printf ("O maior número é %f e o menor é %f\n", c, b);
                    } else {
                        if ((c>b) && (b>a)) {
                            printf ("O maior número é %f e o menor é %f\n", c, a);
                        }
                    }
                }
            }
        }
    }
}
