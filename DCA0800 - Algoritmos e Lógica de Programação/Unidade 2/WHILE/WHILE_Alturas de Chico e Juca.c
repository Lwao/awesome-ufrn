#include <stdio.h>

main () {
    int hc=150, hj=110, a=0;

    while (hj<=hc) {
        hc = hc+2;
        hj = hj+3;
        a++;
    }

    printf ("hj=%d\nhc=%d\nANos=%d", hj, hc, a);
}
