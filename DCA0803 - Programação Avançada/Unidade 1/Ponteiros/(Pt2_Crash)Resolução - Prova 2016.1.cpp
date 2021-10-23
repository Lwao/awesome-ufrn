/*
DCA0803 - PROGRAMA��O AVAN�ADA

PROVA - 1a UNIDADE
DATA: 08/03/2016

NOME: _____________________________________________________

MATR�CULA: ___________________________


Inicialmente, coloque no espa�o acima o seu nome e n�mero de matr�cula e salve o arquivo.

Caso queira acrescentar alguma observa��o para o professor, utilize o espa�o de coment�rio ao final do
arquivo. N�o acrescente texto neste espa�o inicial de coment�rio, pois ele poder� n�o ser considerado.

N�O ESQUE�A: envie frequentemente uma vers�o do arquivo da avalia��o pelo SIGAA. N�o espere at� o
�ltimo momento para fazer o envio, para n�o correr o risco do tempo se encerrar e voc� ter uma nota
0 (zero) por n�o ter enviado nada. O sistema permite m�ltiplos envios, sendo v�lido apenas o �ltimo.

Nesta avalia��o, voc� dever� programar fun��es que fa�am o seguinte:

1) novaMatriz: aloca e retorna uma matriz din�mica (bidimensional) de floats cujas dimens�es s�o passadas
   como par�metro.

2) leMatriz: solicita ao usu�rio que digite os valores dos elementos de uma matriz de floats passada como
   par�metro.

3) diagonal: a partir de uma matriz de floats passada como par�metro, aloca e retorna um vetor no qual
   cada elemento corresponde ao elemento correspondente na diagonal principal da matriz.
   Por exemplo:
   | 1.0  2.0  3.0  4.0 |  diagonal  |  1.0 |
   | 5.0 -0.2  6.0  7.0 | ---------> | -0.2 |
   | 8.0  9.0 10.0 -1.0 |            | 10.0 |
   A dimens�o do vetor ser� a menor das dimens�es (linha, coluna) da matriz. Ou seja, se a matriz tem
   dimens�es 3x4, o vetor a ser retornado ter� dimens�o 3.

4) soma: a partir de duas matrizes de floats passadas como par�metro, aloca e retorna uma matriz
   igual � soma das matrizes originais.
   O n�mero de linhas e colunas da matriz soma ser� o maior n�mero de linhas e colunas nas duas matrizes
   originais, respectivamente. Por exemplo, se uma das matrizes originais tem dimens�o 3x4 e a outra, 4x2,
   ent�o a matriz soma ter� dimens�es 4 (m�x entre 3 e 4) x 4 (m�x entre 4 e 2).
   Caso a linha e coluna em quest�o existam nas duas matrizes, o elemento correspondente na matriz soma
   ser� a soma dos dois elementos nas matrizes originais. Caso s� existam em uma das matrizes, ser� igual
   ao elemento existente em uma das matrizes originais. Caso n�o existam em nenhuma das matrizes originais,
   o elemento correspondente na matriz soma ser� 0 (zero).
   Por exemplo:
   | 1.0  2.0  3.0  4.0 |   | 0.1  1.2 |  soma  | 1.1  3.2  3.0  4.0 |
   | 5.0  0.0  6.0  7.0 | , | 0.3 -0.5 | -----> | 5.3 -0.5  6.0  7.0 |
   | 8.0  9.0  0.0 -1.0 |   | 1.7  1.0 |        | 9.7 10.0  0.0 -1.0 |
                            | 0.8  0.4 |        | 0.8  0.4  0.0  0.0 |

5) imprimeMatriz: imprime os elementos de uma matriz, passada como par�metro, na tela.

6) imprimeVetor: imprime os elementos de um vetor, passado como par�metro, na tela.

7) Outras fun��es que sejam eventualmente adequadas ou necess�rias para a execu��o da tarefa do programa.

Al�m dessas fun��es, voc� deve fazer um programa principal para calcular e exibir a soma de duas matrizes
digitadas pelo usu�rio, al�m do vetor diagonal dessa matriz soma. O programa principal deve usar as fun��es
definidas acima. Ap�s essas tarefas, as �reas de mem�ria que tenham sido alocadas dinamicamente devem ser
liberadas.

A seguir, apresenta-se um esbo�o do programa principal, a ser completado de forma a atender os requisitos.

*/

#include <iostream>

using namespace std;

struct matriz
{
    float **m;
    unsigned NL, NC;
};

struct vetor
{
    float *v;
    unsigned size;
};

matriz novaMatriz (unsigned nLinhas, unsigned nColunas);
vetor novoVetor (unsigned tamanho);
void leMatriz (matriz &M, unsigned nLinhas, unsigned nColunas);
vetor diagonal (const matriz M);
matriz soma (const matriz M1, const matriz M2);
void imprimeMatriz (const matriz M);
void imprimeVetor (const vetor V);
void liberarMatriz (matriz &M);
void liberarVetor (vetor &V);


int main(void)
{
    matriz M1, M2, S;
    vetor V1, V2;
    unsigned nL1,nC1,nL2,nC2;

    // Leitura das dimensoes das matrizes

    do
    {
        cout << "Numero de linhas 1: ";
        cin >> nL1;
    } while (nL1 <= 0);
    do
    {
        cout << "Numero de colunas 1: ";
        cin >> nC1;
    } while (nC1 <= 0);
    do
    {
        cout << "Numero de linhas 2: ";
        cin >> nL2;
    } while (nL2 <= 0);
    do
    {
        cout << "Numero de colunas 2: ";
        cin >> nC2;
    } while (nC2 <= 0);

    // Alocacao e leitura das matrizes

    M1 = novaMatriz(nL1, nC1);
    leMatriz(M1, nL1, nC1);

    M2 = novaMatriz(nL2, nC2);
    leMatriz(M2, nL2, nC2);

    // Calculo da matriz soma

    S=soma(M1, M2);

    // Calculo do vetor diagonal

    V1=diagonal(M1);
    V2=diagonal(M2);

    // Impressao dos resultados

    cout << "Matriz soma:\n";
    imprimeMatriz(S);
    cout << "Vetor diagonal:\n";
    imprimeVetor(V1);
    imprimeVetor(V2);

    // Libera memoria alocada

    liberarMatriz(M1);
    liberarMatriz(M2);
    liberarMatriz(S);
    liberarVetor(V1);
    liberarVetor(V2);

    return 0;
}

/////////////
matriz novaMatriz (unsigned nLinhas, unsigned nColunas)//ok
{
   matriz x;

   x.NL=nLinhas;
   x.NC=nColunas;
   x.m = new float*[nLinhas];

   for (int i=0; i<nLinhas; i++)
   {
       x.m[i]= new float[nColunas];
   }
   return x;
}
vetor novoVetor (unsigned tamanho)//ok
{
    vetor y;
    y.size=tamanho;
    y.v = new float[tamanho];
}
/////////////

/////////////
void leMatriz (matriz &M, unsigned nLinhas, unsigned nColunas)//ok
{
    for (int i=0; i<nLinhas; i++)
    {
        for (int j=0; j<nColunas; j++)
        {
            cout << "Inserir na posi��o [" << i+1 << "] [" << j+1 << "]:" << endl;
            cin >> M.m[i][j];
        }
    }
}
vetor diagonal (const matriz M)//ok
{
    vetor diag;

    if (M.NL<M.NC)
    {
        diag=novoVetor(M.NL);
    }
    else
    {
        diag=novoVetor(M.NC);
    }


    for (int i=0; i<M.NL; i++)
    {
        for (int j=0; j<M.NC; j++)
        {
            if (i==j)
            {
                diag.v[i]=M.m[i][j];
            }
        }
    }
    return diag;
}
matriz soma (const matriz M1, const matriz M2)//ok
{
    matriz sum;

    if (M1.NL>M2.NL)
    {
        sum.NL=M1.NL;
    }
    else
    {
        sum.NL=M2.NL;
    }

    if (M1.NC>M2.NC)
    {
        sum.NC=M1.NC;
    }
    else
    {
        sum.NC=M2.NC;
    }

    sum=novaMatriz(sum.NL, sum.NC);

    for (int i=0; i<sum.NL; i++)
    {
        for (int j=0; j<sum.NC; j++)
        {
            sum.m[i][j]=M1.m[i][j]+M2.m[i][j];
            if ((i>M1.NL) && (i>M2.NL))
            {
                sum.m[i][j]=0;
            }
            if ((j>M1.NC) && (j>M2.NC))
            {
                sum.m[i][j]=0;
            }
        }
    }
    return sum;
}
void imprimeMatriz (const matriz M)//ok
{
    for (int i=0; i<M.NL; i++)
    {
        for (int j=0; j<M.NC; j++)
        {
            cout << M.m[i][j] << " ";
        }
        cout << endl;
    }
}
void imprimeVetor (const vetor V)//ok
{
    for (int i=0; i<V.size; i++)
        {
            cout << V.v[i] << " ";
        }
}
///////////

///////////
void liberarMatriz (matriz &M)//ok
{
    for (int i=0; i<M.NL; i++) delete[] M.m[i];
    delete[] M.m;
}
void liberarVetor (vetor &V)//ok
{
    delete[] V.v;
}
///////////
