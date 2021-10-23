#include <stdio.h>

char tab[6][7];
char jogador = 'X';
int emp_cont=0;

void limparTabuleiro() {
    int i, j;
    //Limpa todas as lacunas da matriz
    for (i=0; i<6; i++){
        for (j=0; j<7; j++){
            tab[i][j]= ' ';
        }
    }
}

void mostrarTabuleiro() {
    int i, j;
    //Imprime o tabuleiro com os devidos espa�amentos
    printf ("-----------------------------\n");
    for (i=0; i<6; i++){
        for (j=0; j<7; j++){
            if (j==0) {
                printf("| %c ", tab[i][j]);
            }
            if (j==6) {
                printf("| %c |\n", tab[i][j]);
            }
            if ((j!=0) && (j!=6)) {
                printf("| %c ", tab[i][j]);
            }
        }
    }
    printf ("-----------------------------\n");
    printf ("  1   2   3   4   5   6   7  \n\n");
}

void trocarJogador() {
    //Se um jogador realizou a jogada, troca para o outro
    if (jogador == 'X') {
        jogador = 'O';
    }
    else {
        jogador = 'X';
    }
}

void reiniciarJogo() {
   //Limpa o tabuleiro e indica o in�cio de um novo jogo com o jogador que ganhou anteriormente
    limparTabuleiro();
    printf("Um novo jogo sera iniciado!\n\n\n");
    mostrarTabuleiro();
    //O contador dever� ser zerado antes de um novo jogo para que o empate seja contado do in�cio do novo jogo
    emp_cont=0;
}

void realizarJogada() {
    //Pede para o jogador X|O escolher a jogada (coluna)
    printf ("Jogador %c: escolha sua jogada!\n", jogador);
    int coluna, a=0;
    printf ("Escolha a coluna: ");
    scanf ("%d", &coluna);
    //Verifica se a posi��o � inv�lida
    if ((coluna<1) || (coluna>7)) {
        printf ("Posi��o inv�lida!\n");
        realizarJogada();
    } else {
        //O 'a' passa pelas linhas verificando se j� est�o preenchidas para a coluna escolhida
        while (tab[5-a][coluna-1]!= ' ') {
            a++;
            if (a>5){//Significa que j� leu todas as linhas daquela coluna escolhida
                //Identifica se a coluna j� est� completada ao verificar todas as linhas
                printf ("Coluna ja completada!\n");
                realizarJogada();
                a=0;
            }
        }
        //Se a posi��o for v�lida e a coluna n�o estiver completada, realiza a jogada na linha que mais ao fundo est� vazia
        tab[5-a][coluna-1]=jogador;
        emp_cont++; //O contador de empate sempre conta ap�s as jogadas
        mostrarTabuleiro();
        if (fimDeJogo()==1) {
                //Se algu�m ganhar ou houver empate, um novo jogo � iniciado
                reiniciarJogo();
            }
            else {
                //Se o jogo n�o finalizar, troca de jogador
                trocarJogador();
            }
    }
}

int verificarEmpate() {
    if (emp_cont==42){
        //Se o contador de empate chegar no n�mero m�ximo de jogadas, ocorre empate
        return 1;
    }
    else {
        return 0;
    }
}

int verificarVitoria() {
    int i, j;
    //Vit�ria na horizontal
    for (i=0; i<6; i++) {
        for (j=0; j<4; j++) {
            if (tab[i][j]==tab[i][j+1] && tab[i][j+1]==tab[i][j+2] && tab[i][j+2]==tab[i][j+3] && tab[i][j]!=' ') {
                return 1;
            }
        }
    }
    //Vit�ria na vertical
    for (j=0; j<7; j++) {
        for (i=0; i<3; i++) {
            if (tab[i][j]==tab[i+1][j] && tab[i+1][j]==tab[i+2][j] && tab[i+2][j]==tab[i+3][j] && tab[i][j]!=' ') {
                return 1;
            }
        }
    }
    //Vit�ria na diagonal principal
    for (i=0; i<3; i++) {
        for (j=0; j<4; j++) {
            if (tab[i][j]==tab[i+1][j+1] && tab[i+1][j+1]==tab[i+2][j+2] && tab[i+2][j+2]==tab[i+3][j+3] && tab[i][j]!=' ') {
                return 1;
            }
        }
    }
    //Vit�ria na diagonal secund�ria
    for (i=0; i<3; i++) {
        for (j=0; j<4; j++) {
            if (tab[i][6-j]==tab[i+1][6-(j+1)] && tab[i+1][6-(j+1)]==tab[i+2][6-(j+2)] && tab[i+2][6-(j+2)]==tab[i+3][6-(j+3)] && tab[i][6-j]!=' ') {
                return 1;
            }
        }
    }
    return 0;
}

int fimDeJogo() {
    //Se ocorrer vit�ria, imprime a vit�ria do �ltimo jogador a jogar
    if (verificarVitoria()==1) {
        printf ("Vitoria do jogador %c!\n\n", jogador);
        return 1;
    }
    else {
    //Se ocorrer empate, imprime empate
        if (verificarEmpate()==1) {
            printf ("Empate!\n\n");
            return 1;
        }
        else {
            return 0;
        }
    }
}

main () {
    //Ao iniciar o programa, o tabuleiro � limpado e impresso
    limparTabuleiro();
    mostrarTabuleiro();
    //Dentro do while ocorre o looping infinito de jogos
    while (42==42) {
        realizarJogada();
    }
}
