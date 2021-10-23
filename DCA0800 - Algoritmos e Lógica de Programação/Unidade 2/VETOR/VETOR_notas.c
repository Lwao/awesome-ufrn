#include <stdio.h>

main () {
    float nota1[10], nota2[10], nota3[10];
    int i;

    for (i=0; i<=9; i++) {
        printf ("Insira a primeira nota do aluno %d: ", i+1);
        scanf ("%f", &nota1[i]);
        printf ("Insira a primeira nota do aluno %d: ", i+1);
        scanf ("%f", &nota2[i]);
        printf ("Insira a primeira nota do aluno %d: ", i+1);
        scanf ("%f", &nota3[i]);
    }

    for (i=0; i<=9; i++) {
        printf("Media do aluno %d: %f\n", i+1, (nota1[i]+nota2[i]+nota2[i])/3);
    }
}
