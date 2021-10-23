#include <iostream>

using namespace std;

/*
Exercício de utilização de funções em conjunto com arrays alocados dinamicamente (ponteiros)

Nesse exercicio, voce deve definir o novo tipo Matriz utilizando uma struct, que armazena
tanto o numero de linhas e de colunas de cada matriz quanto o ponteiro

A partir desse tipo Matriz, voce deve programar as funcoes necessarias para executar o programa
principal a seguir. A ideia eh permitir fazer as operacoes indicadas com matrizes de quaisquer
dimensoes, fornecidas pelo usuario no momento da execucao (e nao na compilacao).

*/

struct Matriz
{
    int NL, NC;
    int **mat;
};

Matriz novaMatriz(unsigned ll, unsigned cc);
void leMatriz(Matriz x);
Matriz produtoMatrizes(Matriz a, Matriz b);
void imprimeMatriz(Matriz p);
void liberaMatriz(Matriz y);

int main(void)
{
    // Declaracao das matrizes
    Matriz A, B, C;

    unsigned NLa, NCa, NLb, NCb;
    do {
        cout << "Linhas de A: ";
        cin >> NLa;
    } while (NLa <= 0);
    do {
        cout << "Colunas de A: ";
        cin >> NCa;
    } while (NCa <= 0);
    // Obs: NLb = NCa
    NLb = NCa;
    do {
        cout << "Colunas de B: ";
        cin >> NCb;
    } while (NCb <= 0);

    // Alocacao das matrizes
    A = novaMatriz(NLa,NCa);
    B = novaMatriz(NLb,NCb);

    // Leitura das matrizes A e B
    leMatriz(A);
    leMatriz(B);

    // produto das matrizes
    C = produtoMatrizes(A,B);

    // Impressao das matrizes
    imprimeMatriz(C);

    // Liberacao das memorias
    liberaMatriz(A);
    liberaMatriz(B);
    liberaMatriz(C);

    return  0;
}

Matriz novaMatriz(unsigned ll, unsigned cc)
{
    Matriz arr;

    arr.NL=ll;
    arr.NC=cc;

    arr.mat = new int*[arr.NL]; //Cria-se realmente um ponteiro para um array de inteiros?

    for (int i=0; i<(arr.NC); i++) arr.mat[i] = new int[arr.NC];
    return arr;
}

void leMatriz(Matriz x)
{
    for (int i=0; i<(x.NL); i++)
    {
        for (int j=0; j<(x.NC); j++)
        {
            cout << "Inserir na posição [" << i+1 << "][" << j+1 << "]: ";
            cin >> x.mat[i][j];
        }
    }
}

Matriz produtoMatrizes(Matriz a, Matriz b)
{
    Matriz pro;
    int mul;

    pro.NL=a.NL;
    pro.NC=b.NC;

    pro.mat = new int*[pro.NL];
    for (int i=0; i<(pro.NC); i++) pro.mat[i] = new int[pro.NC];

    for (int i=0; i<(pro.NL); i++)
    {
        for (int j=0; j<(pro.NC); j++)
        {
            mul=0;
            for (int k=0; k<(a.NC); k++)
            {
                mul+=a.mat[i][k]*b.mat[k][j];
            }
            pro.mat[i][j]=mul;
        }
    }
    return pro;
}

void imprimeMatriz(Matriz p)
{
    for (int i=0; i<(p.NL); i++)
    {
        for (int j=0; j<(p.NC); j++)
        {
            cout << p.mat[i][j] << " ";
        }
        cout << endl;
    }
}

void liberaMatriz(Matriz y)
{
    for (int i=0; i<(y.NL); i++) delete[] y.mat[i];
    delete[] y.mat;
}

