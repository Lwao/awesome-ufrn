#include <stdio.h>

main () {
    int num, entre=0;

    while (num!=0) {
        printf ("Digite: ");
        scanf ("%d", &num);

        if ((num<200) && (num>100)) {
        entre++;
        }
    }
    printf ("N�meros entre 100 e 200 � %d", entre);
}
