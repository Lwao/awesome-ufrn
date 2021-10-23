#include <iostream>
using namespace std;

 //O local de residência de uma variável não pode ser mudada, ou seja, &i=&j não é válido.

int main (void)
{
    int ai[5];
    int *pi;


    pi=ai;
    for (int i=0; i<5; i++)
    {
        *(pi+i)=i*i+1;
        cout << "i=" << i
             << "\ta[i]=" << *(pi+i)
             << "\t&a[i]=" << pi+i << endl;

    }

    /*
    cout << &ai; //primeiro byte de ai0 (evitar usar)
    cout << &(a[0]); //mesma coisa
    cout << ai; //Imprime o endereço do array (mesma coisa do primeiro)
    */
    return 0;

}

/*
MESMO PROGRAMA, PORÉM, UTILIZANDO APENAS ARRAYS
int main (void)
{
    int ai[5];

    for (int i=0; i<5; i++)
    {
        *(ai+i)=i*i+1;
        cout << "i=" << i
             << "\ta[i]=" << *(ai+i)
             << "\t&a[i]=" << ai+i << endl;

    }
}
*/


/*
MESMO PROGRAMA, PORÉM, UTILIZANDO APENAS PONTEIROS
int main (void)
{
    int *pi;

    pi = new int[5];
    for (int i=0; i<5; i++)
    {
        pi[i]=i*i+1;
        cout << "i=" << i
             << "\ta[i]=" << pi[i]
             << "\t&a[i]=" << &(pi[i]) << endl;

    }
}
*/

