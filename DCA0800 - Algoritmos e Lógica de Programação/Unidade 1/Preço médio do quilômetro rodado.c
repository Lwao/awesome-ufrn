#include <stdio.h>

main () {
    float p_m, d, v, p;
    printf ("C�lculo do pre�o m�dio do quil�metro rodado\n");
    printf ("Insira a dist�ncia percorrida\n");
    scanf ("%f", &d);
    printf ("Insira o volume gasto de combust�vel\n");
    scanf ("%f", &v);
    printf ("Insira o pre�o do combust�vel por litro\n");
    scanf ("%f", &p);
    p_m = v*p/d;
    printf ("O pre�o m�dio �: %f", p_m);
    }
