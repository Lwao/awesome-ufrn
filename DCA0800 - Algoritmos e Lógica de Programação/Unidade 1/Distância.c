#include <stdio.h>
#include <math.h>
main () {
    float x1, x2, y1, y2, d;
    printf ("Calcular a distância entre dois pontos.\nDigite o primeiro par ordenado, sequencialmente (x1,y1):\n");
    scanf ("%f%f", &x1, &y1);
    printf ("Digite o segundo par ordenado, sequencialmente (x2,y2):\n");
    scanf("%f%f", &x2, &y2);
    d = sqrt(pow(x2-x1,2))+ sqrt(pow(y2-y1,2));
    printf ("A distância entre os dois pontos e: %f", d);
    }
