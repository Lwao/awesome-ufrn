#include <stdio.h>

main () {
    float ent1, ent2, premiot, premio2, q1, q2;
    printf ("Insira a quantia que o primeiro amigo entrou:\n");
    scanf ("%f", &ent1);
    printf ("Insira a quantia que o segundo amigo entrou:\n");
    scanf ("%f", &ent2);
    printf ("Escreva o valor do prêmio\n");
    scanf ("%f", &premiot);
    q1 = ent1/(ent1+ent2)*premiot;
    q2 = ent2/(ent1+ent2)*premiot;
    printf ("O valor que o primeiro amigo recebe é: %f\nO valor que o segundo amigo recebe é: %f\n", q1, q2);
}
