#include <stdio.h>

main () {
    float p_m, d, v, p;
    printf ("Cálculo do preço médio do quilômetro rodado\n");
    printf ("Insira a distância percorrida\n");
    scanf ("%f", &d);
    printf ("Insira o volume gasto de combustível\n");
    scanf ("%f", &v);
    printf ("Insira o preço do combustível por litro\n");
    scanf ("%f", &p);
    p_m = v*p/d;
    printf ("O preço médio é: %f", p_m);
    }
