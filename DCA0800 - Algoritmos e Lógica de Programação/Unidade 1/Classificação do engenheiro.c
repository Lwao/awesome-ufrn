#include <stdio.h>

main () {
    int ano;

    printf ("Insira a idade do Engenheiro e obtenha a sua classificação:\n");
    scanf ("%d", &ano);

    if ((ano < 4)) {
        printf ("O engenheiro é JUNIOR\n");
    } else {
        if ((ano >= 4) && (ano < 6)) {
            printf ("O engenheiro é PLENO\n");
        } else {
            if ((ano >= 6) && (ano < 8)) {
                printf ("O engenheiro é ADJUNTO\n");
            } else {
                if ((ano >=8) && (ano < 10)) {
                    printf ("O engenheiro é SENIOR\n");
                } else {
                    if (ano>=10)
                        printf ("O engenheiro é CONSULTOR\n");
                        }
                    }
                }
            }
        }
