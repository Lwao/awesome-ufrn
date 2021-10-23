#include <stdio.h>

main () {
    int n, s, a;
    printf("Insira um número inteiro para receber o seu antecessor e o seu sucessor, respectivamente");
    scanf("%d", &n);
    s = n+1;
    a = n-1;
    printf("O seu antecessor é: %d\n O seu sucessor é: %d\n", a, s);
    }
