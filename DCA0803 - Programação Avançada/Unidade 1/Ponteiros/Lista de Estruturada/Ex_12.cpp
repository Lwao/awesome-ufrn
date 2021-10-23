#include <iostream>
using namespace std;

/*Faça um programa que, dados dois vetores bidimensionais (matrizes A e B) com
dimensões de 5x5 elementos, imprima a soma destas duas matrizes, a soma das
diagonais de cada matriz e a multiplicação das duas matrizes*/

int main (void) 
{
    int **A, **B, mul;
    unsigned int i, j;
    
    //Cria os vetores de ponteiros
    A = new int*[5];
    B = new int*[5];
    

    cout << "Inserir A:" << endl;
    //Ler o array 2D A
    for (i=0; i<5; i++) 
    {
        //Cria o vetores de inteiros que o vetor de ponteiros vai apontar
        A[i]= new int[5];
        for (j=0; j<5; j++)
        {
            cin >> A[i][j];
        }
    }
    
    cout << "Inserir B:" << endl;
    //Ler o array 2D B
    for (i=0; i<5; i++) 
    {
        //Cria o vetores de inteiros que o vetor de ponteiros vai apontar
        B[i]= new int[5];
        for (j=0; j<5; j++)
        {
            cin >> B[i][j];
        }
    }
    
    //Soma de A e B
    cout << "A+B = " << endl;
    for (i=0; i<5; i++)
    {
        for (j=0; j<5; j++)
        {
            cout << A[i][j]+B[i][j] << " " << endl;
        }
        cout << endl;
    }
    
    //Soma de diagonais de A e B
    
    //Soma de diagonais principais
    cout << "Diagonal principal A+B = " << endl;
    for (i=0; i<5; i++)
    {
        for (j=0; j<5; j++)
        {
            if (i==j)
            {
                cout << A[i][j]+B[i][j] << " " << endl;
            }
            else 
            {
                cout << "  " << endl;
            }
        }
        cout << endl;
    }
    
    //Soma de diagonais principais
    cout << "Diagonal secundária A+B = " << endl;
    for (i=0; i<5; i++)
    {
        for (j=0; j<5; j++)
        {
            if (i==4-j)
            {
                cout << A[i][j]+B[i][j] << " " << endl;
            }
            else 
            {
                cout << "  " << endl;
            }
        }
        cout << endl;
    }
    
    //Multiplicação de A por B
    cout << "A*B= = " << endl;
    for (i=0; i<5; i++)
    {
        for (j=0; j<5; j++)
        {
            mul=0;
            for (int k=0; k<5; k++)
            {
                mul+=A[i][k]*B[k][j];
            }
            cout << mul << " " << endl;
        }
        cout << endl;
    }    

    
    //Liberar as posições de memória dos arrays 2D
    
    // Primeiro, libera os 5 vetores de inteiros
    for (i=0; i<5; i++) 
    {
        delete[] A[i];
        delete[] B[i];
    }
    // Em seguida, libera os vetores de ponteiros
    delete[] A;
    delete[] B;
    
    return 0;
}
