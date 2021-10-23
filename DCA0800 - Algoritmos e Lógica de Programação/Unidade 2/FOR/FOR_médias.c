#include <stdio.h>

main () {
    int n1, n2, n3, m;
    int i, ap=0, total=0;

    for (i=0 ; i<10; i++) {
        printf ("Insira as notas do aluno %d: \n", i+1);
        scanf ("%d%d%d", &n1, &n2, &n3);
        m = (n1+n2+n3)/3;
        printf ("A média do aluno %d é: %d\n\n", i+1, m);

        if (m>=7) {
            ap++;
            total ++;
        }
        else {
            total++;
        }
    }
}
