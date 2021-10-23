#include <stdio.h>
#include <math.h>

main () {
    int a, b, c;
    float y;
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
        y = pow(a*b*c,1.0/3.0);
        printf ("O resultado do m�dia �: %f", y);
    }
    if (x == 'b') {
        printf ("Insira o x, y e z para a m�dia ponderada: \n");
        scanf ("%d%d%d", &a, &b, &c);
        y = (a*1.0+b*2.0+c*3.0)/6;
        printf ("O resultado do m�dia �: %f", y);
    }
    if (x == 'c') {
        printf ("Insira o x, y e z para a m�dia harm�nica: \n");
        scanf ("%d%d%d", &a, &b, &c);
        y = 1.0/((1.0/a)+(1.0/b)+(1.0/c));
        printf ("O resultado do m�dia �: %f", y);
    }
    if (x == 'd') {
        printf ("Insira o x, y e z para a m�dia aritim�tica: \n");
        scanf ("%d%d%d", &a, &b, &c);
        y = (a+b+c)/3.0;
        printf ("O resultado do m�dia �: %f", y);
    }
    if ((!x == 'a') || (!x == 'b') || (!x == 'c') || (!x == 'd')) {
        printf ("Opera��o inv�lida!");
    }
}

