#include <stdio.h>

float sal=0;

void saldo () {
    printf("O saldo é %.2f.", sal);
}

void deposito () {
    float dep;
    printf("Digite o valor a ser depositado: ");
    scanf ("%f", &dep);
    sal += dep;
    saldo();
}

void retirada () {
    float ret;
    printf("Digite o valor a ser retirado: ");
    scanf ("%f", &ret);
    if (ret>sal) {
        printf ("Não é possível retirar essa quantia! Tente novamente.");
    }
    else {
        sal -= ret;
        saldo();
    }
}

main () {
    int op;

    while (42==42) {
        printf("\nEscolha a operacao:\n\n");
        printf ("\t________________________________\t\n");
        printf ("\t|\tOp. 1: Deposito.\t|\n");
        printf ("\t|\tOp. 2: Retirada.\t|\n");
        printf ("\t|\tOp.3: Saldo.\t\t|\n");
        printf ("\t________________________________\t\n");
        scanf ("%d", &op);

        if (op==1) {
            deposito();
        }
        if (op==2) {
            retirada();
        }
        if (op==3) {
            saldo();
        }
        if ((op>3) || (op<1)) {
            printf ("Operacao invalida!");
        }
    }
}
