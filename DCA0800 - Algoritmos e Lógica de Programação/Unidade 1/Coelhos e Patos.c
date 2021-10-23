#include <stdio.h>

main () {
    float cab, pat, coelhos, patos;

    printf ("Insira o número de cabeças:\n");
    scanf ("%f", &cab);
    printf ("Insira o número de pés:\n");
    scanf ("%f", &pat);
    coelhos = (pat-2*cab)/2;
    patos = cab-coelhos;
    printf ("O número de coelhos é: %f\nO número de patos é: %f\n", coelhos, patos);



    }
