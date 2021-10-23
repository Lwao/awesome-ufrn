#include <stdio.h>

main () {
    float peso, altura, IMC;

    printf ("Digite sua altura e peso: \n");
    scanf ("%f%f", &altura, &peso);
    IMC = peso/(pow(altura,2));
    printf ("Seu IMC é %f\n", IMC);

    if (IMC<18.5) {
        printf ("Abaixo do Peso!");
    }
    if ((IMC>18.6) && (IMC<24.9)) {
        printf ("Saudável!");
    }
    if ((IMC>25.0) && (IMC<29.9)) {
        printf ("Peso em excesso!");
    }
    if ((IMC>30.0) && (IMC<34.9)) {
        printf ("Obesidade Grau I!");
    }
    if ((IMC>35.0) && (IMC<39.9)) {
        printf ("Obesidade Grau II (severa)!");
    }
    if (IMC>40.0) {
        printf ("Obesidade Grau III(mórbida)!");
    }
}
