#include <stdio.h>

main () {
    float cab, pat, coelhos, patos;

    printf ("Insira o n�mero de cabe�as:\n");
    scanf ("%f", &cab);
    printf ("Insira o n�mero de p�s:\n");
    scanf ("%f", &pat);
    coelhos = (pat-2*cab)/2;
    patos = cab-coelhos;
    printf ("O n�mero de coelhos �: %f\nO n�mero de patos �: %f\n", coelhos, patos);



    }
