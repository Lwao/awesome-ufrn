#include <stdio.h>

int main () {
    float alt, peso;

    printf ("Insira sua altura e peso:");
    scanf ("%f%f", &alt, &peso);

    if (alt<1.2) {
        if (peso<60) {
        printf ("A sua classificação é A!");
        }
        if ((peso>=60) && (peso<=90)) {
            printf ("A sua classificação é D!");
        }
        if (peso>90){
            printf ("Sua classificação é G");
        }
    }
    if ((alt>=1.2) && (alt<=1.7)) {
        if (peso<60) {
        printf ("A sua classificação é B!");
        }
        if ((peso>=60) && (peso<=90)) {
            printf ("A sua classificação é E!");
        }
        if (peso>90){
            printf ("Sua classificação é H");
        }
    }
    if (alt>1.7) {
        if (peso<60) {
        printf ("A sua classificação é C!");
        }
        if ((peso>=60) && (peso<=90)) {
            printf ("A sua classificação é F!");
        }
        if (peso>90){
            printf ("Sua classificação é I");
        }
    }
    return 0;
}
