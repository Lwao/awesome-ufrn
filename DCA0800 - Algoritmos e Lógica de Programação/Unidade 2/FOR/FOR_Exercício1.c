#include <stdio.h>

main () {
    int i;
    float n1, n2, n3, media, maiormedia=0, menormedia=10;
    int aprovados=0;

    for (i=0; i<10; i++) {
        printf ("Entre com as notas: ");
        scanf ("%f%f%f", &n1, &n2, &n3);
        media = (n1+n2+n3)/3;
        printf ("Media do aluno %d foi %.1f.\n\n", i+1, media);

        if (media>=7) {
            aprovados++;
        }

        if (media>maiormedia) {
                maiormedia = media;
        }

        if (media<menormedia) {
                menormedia = media;
        }
    }

    printf("Maior média: %.1f\n\n", maiormedia);
    printf("Menor média: %.1f\n\n", menormedia);
    printf("Perc. aprovados: %.2f", 100.*aprovados/10);
}
