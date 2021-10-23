#include <iostream>
using namespace std;

/*
Faça um programa para receber do usuário a dimensão e os elementos de um vetor
e efetuar a sua ordenação utilizando o método da bolha. Neste método de ordena-
ção, percorre-se o vetor comparando cada elemento com o seguinte: se eles esti-
verem na ordem errada, os elementos são permutados. O vetor é percorrido tantas
vezes quantas necessárias até que não seja necessário mudar nenhum elemento.
*/

int main (void)
{
    int *vec, n, i, temp;
    
    cout << "Inserir o tamanho do vetor: ";
    cin >> n;
    cout << endl;
    
    vec = new int[n];
    
    cout << "Inserir os " << n << " elementos do vetor: " << endl;
    for (i=0; i<n; i++)
    {
    cin >> vec[i];
    }
    
    cout << "Os elementos serão organizados em ordem crescente..." << endl;
    
    
    for (int j=0; j<n; j++) //Garantir as repetições necessárias, que são, no máximo (n-1)-vezes
    {
        for (i=0; i<n; i++)
        {
            if ((vec[i]>vec[i+1]) && ((i+1)<n))
            {
                temp=vec[i];
                vec[i]=vec[i+1];
                vec[i+1]=temp;            
            }
        }
    }
    
    for (i=0; i<n; i++)
    {
        cout << vec[i] << " " << endl;
    }
    
    delete[] vec;  
    
    return 0;
}
