#include <stdio.h>

main () {
    float c, f;
    printf("Insira uma temperatura em graus cent�grados para a convers�o em graus Fahrenheit\n");
    scanf("%f", &c);
    f = 1.8*c+32;
    printf("A temperatura em graus Farenheit �: %f", f);
    }
