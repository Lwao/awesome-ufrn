#include <iostream>
using namespace std;

/*
Fazer um programa que receba do usu�rio uma quantidade N de n�meros a ser
digitada. Em seguida, o programa deve solicitar N n�meros do usu�rio. No final, o
programa exibe o m�ximo, o m�nimo e a m�dia dos valores digitados e quantos va-
lores est�o acima da m�dia.
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
        cout << "Informe a quantidade de n�meros a ser fornecida: " << endl;
        cin >> N;
    } while (N<=0);

    ptr = new double[N];
    cout << "Inserir os " << N << " n�meros: " << endl;

    for (int i=0; i<N; i++)
    {
        cin >> *(ptr+i);
    }

    cout << "Valor m�ximo: " << maior(ptr, N) << endl;
    cout << "Valor m�nimo: " << menor(ptr, N) << endl;
    cout << "M�dia: " << mid(ptr, N) << endl;
    media = mid(ptr, N);
    cout << "N�mero de valores acima da m�dia: " << up_media(media, N, ptr) << endl;


    return 0;
}
