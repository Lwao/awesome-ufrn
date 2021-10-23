#include <stdio.h>

main () {
    int n, a=1, s;

    scanf("%d", &n);

    s = a*(a+1)*(a+2);
    while (s<n) {
        a++;
        s = a*(a+1)*(a+2);
    }
    if (s==n) {
        printf("tri");
    }
    if (s>n) {
        printf("Ntri");
    }
}

