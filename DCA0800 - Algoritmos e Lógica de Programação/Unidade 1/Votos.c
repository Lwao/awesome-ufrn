#include <stdio.h>
main () {
    int vb, vn, vv, eleitores;
    float pb, pn, pv;
    printf ("Digite o n�mero de votos brancos: \n");
    scanf ("%d", &vb);
    printf ("Digite o n�mero de votos nulos: \n");
    scanf ("%d", &vn);
    printf ("Digite o n�mero de votos v�lidos: \n");
    scanf ("%d", &vv);
    pb = 100.*(vb)/(vb+vn+vv);
    pn = 100.*(vn)/(vb+vn+vv);
    pv = 100.*(vv)/(vb+vn+vv);
    printf ("O percentual para os votos brancos �: %f\n", pb);
    printf ("O percentual para os votos nulos �: %f\n", pn);
    printf ("O percentual para os votos v�lidos �: %f\n", pv);
        }
