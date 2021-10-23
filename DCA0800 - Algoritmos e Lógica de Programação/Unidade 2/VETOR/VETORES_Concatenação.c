#include <stdio.h>

main () {
    int a[5], b[5], c[10], i;

    for (i=0; i<5; i++) {
        scanf("%d", &a[i]);
        scanf("%d", &b[i]);
    }
    for (i=0; i<5; i++) {
        printf("%d", a[i]);
    }
    printf("\n");
    for (i=0; i<5; i++) {
        printf("%d", b[i]);
    }
    printf("\n");
    for (i=0; i<5; i++){
        c[i+i]=a[i];
        c[i+i+1]=b[i];
    }
    for (i=0; i<10; i++){
        printf("%d", c[i]);
    }
}
