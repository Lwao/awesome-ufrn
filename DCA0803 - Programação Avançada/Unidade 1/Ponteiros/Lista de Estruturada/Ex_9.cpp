#include <iostream>
using namespace std;

/*
Crie uma função que receba como parâmetro um vetor de float, definido de tal
forma que o último número seja zero. Esta função deve retornar a diferença entre a
média dos números contidos neste vetor e o menor dos números, não contando
com o zero final.
Exemplo: Vetor: (1, 7, 4, 0); Média: 4; Menor: 1; Retorno = média - menor = 3;
 */

// A média será levada em conta até achar um zero

float rec(float *ptr, int N)
{
    float media=0, menor, retorno;

    
    for (int i=0; i<(N-1); i++)
    {
        media+=ptr[i];
    }
    media/=(N-1);
	
    menor = ptr[0];
    for (int i=0; i<(N-1); i++)
    {
        if ((menor>*(ptr+i)) && ((ptr[i])!=(ptr[N-1])))
        {
            menor = *(ptr+i);
        }
    }
    retorno = media - menor;
    return retorno;
}

int main (void)
{
    float *arr;
    unsigned int n;

    cout << "Defina o tamanho do array: " << endl;
    do
    {
        cin >> n;
    } while (n<=0);

    arr = new float[n];

    cout << "Defina cada um dos " << n << " elementos do array" << endl;
    for (int i=0; i<(n-1); i++)
    {
        cin >> *(arr+i);
    }

    cout << "Lembre-se que o último número desse array será por padrão 0" << endl;
    *(arr+(n-1))=0;

    cout << "O resultado da diferença entre a média e o menor dos números é: " << rec(arr, n) << endl;

    delete[] arr;
    return 0;
}
