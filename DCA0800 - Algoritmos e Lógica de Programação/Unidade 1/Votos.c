#include <stdio.h>
main () {
    int vb, vn, vv, eleitores;
    float pb, pn, pv;
    printf ("Digite o número de votos brancos: \n");
    scanf ("%d", &vb);
    printf ("Digite o número de votos nulos: \n");
    scanf ("%d", &vn);
    printf ("Digite o número de votos válidos: \n");
    scanf ("%d", &vv);
    pb = 100.*(vb)/(vb+vn+vv);
    pn = 100.*(vn)/(vb+vn+vv);
    pv = 100.*(vv)/(vb+vn+vv);
    printf ("O percentual para os votos brancos é: %f\n", pb);
    printf ("O percentual para os votos nulos é: %f\n", pn);
    printf ("O percentual para os votos válidos é: %f\n", pv);
        }
