#include <stdio.h>
#include <math.h>

main () {
    int a, b, c, y;
    char x;

    printf ("Escolha o tipo de m�dia a ser calculada:\n");
    printf ("(a) - Geom�trica: \n");
    printf ("(b) - Ponderada: \n");
    printf ("(c) - Harm�nica: \n");
    printf ("(d) - Aritm�tica: \n");
    scanf ("%c", &x);

    if (x == 'a') {
        printf ("Insira o x, y e z para a m�dia geom�trica: \n");
        scanf ("%d%d%d", &a, &b, &c);
        y = pow(a*b*c,1/3);
        printf ("O resultado do m�dia �: %d", y);
    }
    if (x == 'b') {
        printf ("Insira o x, y e z para a m�dia geom�trica: \n");
        scanf ("%d%d%d", &a, &b, &c);
        y = pow(a*b*c,1/3);
        printf ("O resultado do m�dia �: %d", y);
    }
}
