#include <stdio.h>
#include <math.h>

main () {
    int a, b, c, y;
    char x;

    printf ("Escolha o tipo de média a ser calculada:\n");
    printf ("(a) - Geométrica: \n");
    printf ("(b) - Ponderada: \n");
    printf ("(c) - Harmônica: \n");
    printf ("(d) - Aritmética: \n");
    scanf ("%c", &x);

    if (x == 'a') {
        printf ("Insira o x, y e z para a média geométrica: \n");
        scanf ("%d%d%d", &a, &b, &c);
        y = pow(a*b*c,1/3);
        printf ("O resultado do média é: %d", y);
    }
    if (x == 'b') {
        printf ("Insira o x, y e z para a média geométrica: \n");
        scanf ("%d%d%d", &a, &b, &c);
        y = pow(a*b*c,1/3);
        printf ("O resultado do média é: %d", y);
    }
}
