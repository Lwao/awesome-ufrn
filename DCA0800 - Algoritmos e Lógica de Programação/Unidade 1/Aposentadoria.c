#include <stdio.h>

main () {
    int idade, tempo;

    printf ("Insira a idade:\n");
    scanf ("%d", &idade);
    printf ("Insira o tempo de serviço:", &tempo);
    scanf ("%d", &tempo);

    if ((idade >= 65) || (tempo >= 30) || ((idade >= 60) && (tempo >= 25))) {
        printf ("Pode se aposentar!");
    } else {
        printf ("Não pode se aposentar!");
        }
    }
