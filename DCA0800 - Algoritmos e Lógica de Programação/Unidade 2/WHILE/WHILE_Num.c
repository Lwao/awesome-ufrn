#include <stdio.h>

main () {
    int n, i=0;


    while (n!=0) {
        scanf("%d", &n);
        if ((n>=100) && (n<=200)) {
        i++;
        }
    }
    printf ("qnt foi: %d", i);
}
