#include <stdio.h>
#include <math.h>
main () {
    float i, vi, n, vf;
    printf ("C�lculo do valor final de uma aplica��o � juros compostos\nDigite o valor inicial da aplica��o: ");
    scanf ("%f", &vi);
    printf ("Digite o per�odo da aplica��o em meses: \n");
    scanf ("%f", &n);
    printf ("Digite o valor da taxa de juros ao m�s em decimal: \n");
    scanf ("%f", &i);
    vf = pow(1+i,n)*vi;
    printf ("O valor final da aplica��o em juros compostos �: %f", vf);
    }
