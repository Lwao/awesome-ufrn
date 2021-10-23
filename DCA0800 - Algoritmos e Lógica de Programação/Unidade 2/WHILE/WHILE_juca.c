#include <stdio.h>

main () {
    int juca=110, chico=150, anos=0;

    do {while (juca<=chico) {
        anos++;
        chico += 2;
        juca += 3;
    }
    printf ("Qnt tempo passou foi: %d", anos);
}
