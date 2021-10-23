#include <stdio.h>

float deposito(float saldo_atual) {
    printf("Quanto quer depositar? ");
    float valor_dep = 0;
    scanf ("%f", &valor_dep);
    return saldo_atual + valor_dep;
}

float retirada(float saldo_atual) {
    printf("Quanto quer retirar? ");
    float valor_ret;
    scanf ("%f", &valor_ret);
    if (saldo_atual>=valor_ret) {
        return saldo_atual - valor_ret;
    }
    else {
        printf("Nao consegue sacar!");
        return saldo_atual;
    }
}

void verSaldo(float saldo_atual) {
    printf ("O seu saldo atual eh: %f\n\n", saldo_atual);
}

main () {
    int op;
    float saldo = 0;

    while (1==1) {
        printf ("Escolha a sua operacao: ");
        scanf ("%d", &op);

        if (op==1){
            saldo = deposito(saldo);
        }
        else {
            if (op==2){
                saldo = retirada(saldo);
            }
            else {
                if (op==3) {
                    verSaldo(saldo);
                }
                else {
                    printf ("Operacao invalida!\n\n");
                }
            }
        }
    }
}
