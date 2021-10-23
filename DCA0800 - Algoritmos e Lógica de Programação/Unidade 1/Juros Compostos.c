#include <stdio.h>
#include <math.h>
main () {
    float i, vi, n, vf;
    printf ("Cálculo do valor final de uma aplicação à juros compostos\nDigite o valor inicial da aplicação: ");
    scanf ("%f", &vi);
    printf ("Digite o período da aplicação em meses: \n");
    scanf ("%f", &n);
    printf ("Digite o valor da taxa de juros ao mês em decimal: \n");
    scanf ("%f", &i);
    vf = pow(1+i,n)*vi;
    printf ("O valor final da aplicação em juros compostos é: %f", vf);
    }
