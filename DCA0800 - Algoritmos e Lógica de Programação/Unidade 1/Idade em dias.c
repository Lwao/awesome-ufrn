#include <stdio.h>

main () {
    float anos, meses, dias, idade;
    printf ("C�lculo da idade em dias\nInsira a idade em anos, em meses e em dias, respectivamente:\n");
    scanf ("%f%f%f", &anos, &meses, &dias);
    idade = (anos*365.25)+(meses*30.4375)+dias;
    printf ("A sua idade em dias �: %f\n", idade);
    }
