#include <stdio.h>

main () {
    int ano;

    printf ("Insira a idade do Engenheiro e obtenha a sua classifica��o:\n");
    scanf ("%d", &ano);

    if ((ano < 4)) {
        printf ("O engenheiro � JUNIOR\n");
    } else {
        if ((ano >= 4) && (ano < 6)) {
            printf ("O engenheiro � PLENO\n");
        } else {
            if ((ano >= 6) && (ano < 8)) {
                printf ("O engenheiro � ADJUNTO\n");
            } else {
                if ((ano >=8) && (ano < 10)) {
                    printf ("O engenheiro � SENIOR\n");
                } else {
                    if (ano>=10)
                        printf ("O engenheiro � CONSULTOR\n");
                        }
                    }
                }
            }
        }
