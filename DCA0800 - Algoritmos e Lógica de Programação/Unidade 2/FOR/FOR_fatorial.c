#include <stdio.h>

main () {
    float fat=1, num, i;

    printf ("Insira um número para o cálculo do seu fatorial: ");
    scanf ("%f", &num);
    for (i=2; i<=num; i++) {
    fat = fat*i;
    }
    printf ("%.2f", fat);
}
