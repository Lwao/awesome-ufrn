#include <stdio.h>

main () {
    float fat=1, num, i;

    printf ("Insira um n�mero para o c�lculo do seu fatorial: ");
    scanf ("%f", &num);
    for (i=2; i<=num; i++) {
    fat = fat*i;
    }
    printf ("%.2f", fat);
}
