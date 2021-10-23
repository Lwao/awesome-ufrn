#include <iostream>
using namespace std;

/*
Fazer um programa que receba do usuário uma quantidade N de números a ser
digitada. Em seguida, o programa deve solicitar N números do usuário. No final, o
programa exibe o máximo, o mínimo e a média dos valores digitados e quantos va-
lores estão acima da média.
*/

double maior(double *val, int quant)
{
    int i=0;
    double maior=*(val+i);

    for (i=1; i<quant; i++)
    {
        if (maior<*(val+i))
        {
            maior = *(val+i);
        }
    }
    return maior;
}

double menor(double *val, int quant)
{
    int i=0;
    double menor=*(val+i);

    for (i=1; i<quant; i++)
    {
        if (menor>*(val+i))
        {
            menor = *(val+i);
        }
    }
    return menor;
}

double mid(double *val, double quant)
{
    double media(0);
    for (int i=0; i<quant; i++)
    {
        media+=*(val+i);
    }
    media/=quant;

    return media;
}

int up_media(double med, int quant, double *val)
{
    int acima(0);

    for (int i=0; i<quant; i++)
    {
        if (val[i]>med)
        {
            acima++;
        }
    }
    return acima;
}


int main (void)
{
    unsigned int N;
    double *ptr;
    double media;

    do
    {
        cout << "Informe a quantidade de números a ser fornecida: " << endl;
        cin >> N;
    } while (N<=0);

    ptr = new double[N];
    cout << "Inserir os " << N << " números: " << endl;

    for (int i=0; i<N; i++)
    {
        cin >> *(ptr+i);
    }

    cout << "Valor máximo: " << maior(ptr, N) << endl;
    cout << "Valor mínimo: " << menor(ptr, N) << endl;
    cout << "Média: " << mid(ptr, N) << endl;
    media = mid(ptr, N);
    cout << "Número de valores acima da média: " << up_media(media, N, ptr) << endl;


    return 0;
}
