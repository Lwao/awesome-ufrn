#include <stdio.h>

char tab [3][3];
char jogador = 'X';
int qnt=0;



void limpar () {
    int i, j;
    for (i=0; i<3; i++){
        for (j=0; j<3; j++){
            tab[i][j]= ' ';
        }
    }
    jogador = 'X';
    qnt=0;
    imprimir();
}

void imprimir () {
    int i, j;
    for (i=0; i<3; i++){
        for (j=0; j<3; j++){
            printf(" %c ", tab[i][j]);
            if (j!=2) {
                printf ("| ");
            }
        }
        printf ("\n");
        if (i!=2){
            printf ("-------------\n");
        }

    }
}

void escolher_jogada() {
    printf ("Jogador %c: escolha sua jogada!\n", jogador);
    int linha, coluna;
    printf ("Escolha a linha: ");
    scanf ("%d", &linha);
    printf ("Escolha a coluna: ");
    scanf ("%d", &coluna);

    if ((linha<1) || (linha>3) || (coluna<1) || (coluna>3)) {
        printf ("Posição inválida!\n");
        escolher_jogada();
    }
    else {
        if (tab[linha-1][coluna-1]!= ' ') {
            printf ("Posição ocupada!\n");
            escolher_jogada();
        }
        else {
            tab[linha-1][coluna-1]=jogador;
            qnt++;
            imprimir();
            if (fim_jogo()==1) {
                limpar();
            }
            else {
                trocarJogador();
            }
        }
    }
}

void trocarJogador() {
    if (jogador == 'X') {
        jogador = 'O';
    }
    else {
        jogador = 'X';
    }
}

int fim_jogo () {
    if (vitoria()==1) {
        printf ("Vitoria do jogador %c!\n\n", jogador);
        return 1;
    }
    else {
        if (empate()==1) {
            printf ("Empate!\n\n");
            return 1;
        }
        else {
            return 0;
        }
    }
}

int vitoria () {
    int i;
    for (i=0; i<3; i++) {
        if (tab[i][0]==tab[i][1] && tab[i][1]==tab[i][2] && tab[i][0]!=' ') {
            return 1;
        }
        if (tab[0][i]==tab[1][i] && tab[1][i]==tab[2][i] && tab[0][i]!=' ') {
            return 1;
        }
    }
    if (tab[0][0]==tab[1][1] && tab[1][1]==tab[2][2] && tab[0][0]!=' ') {
        return 1;
    }
    if (tab[0][2]==tab[1][1] && tab[1][1]==tab[2][0] && tab[2][0]!=' ') {
        return 1;
    }
    return 0;
}

int empate () {
    if (qnt==9) {
        return 1;
    }
    else {
        return 0;
    }

}

main () {
    limpar();
    while (1==1) {
        escolher_jogada();
    }
}
