#include <stdio.h>

int main () {
    float alt, peso;

    printf ("Insira sua altura e peso:");
    scanf ("%f%f", &alt, &peso);

    if (alt<1.2) {
        if (peso<60) {
        printf ("A sua classifica��o � A!");
        }
        if ((peso>=60) && (peso<=90)) {
            printf ("A sua classifica��o � D!");
        }
        if (peso>90){
            printf ("Sua classifica��o � G");
        }
    }
    if ((alt>=1.2) && (alt<=1.7)) {
        if (peso<60) {
        printf ("A sua classifica��o � B!");
        }
        if ((peso>=60) && (peso<=90)) {
            printf ("A sua classifica��o � E!");
        }
        if (peso>90){
            printf ("Sua classifica��o � H");
        }
    }
    if (alt>1.7) {
        if (peso<60) {
        printf ("A sua classifica��o � C!");
        }
        if ((peso>=60) && (peso<=90)) {
            printf ("A sua classifica��o � F!");
        }
        if (peso>90){
            printf ("Sua classifica��o � I");
        }
    }
    return 0;
}
