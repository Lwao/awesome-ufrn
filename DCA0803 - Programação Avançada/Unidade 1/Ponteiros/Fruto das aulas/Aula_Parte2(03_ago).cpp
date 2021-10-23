#include <iostream>
using namespace std;

int main (void)
{
    int *pi;
    int N;

    do
    {
        cout << "Qual a dimensão? ";
        cin >> N;
    }
    while (N<=0);

    pi = new int[N];
    for (int i=0; i<N; i++)
    {
        pi[i]=i*i+1;
        cout << "i=" << i
             << "\ta[i]=" << pi[i]
             << "\t&a[i]=" << &(pi[i]) << endl;

    }
    /*
    TIPOS DE DELETE

    new tipo;           delete var;
    new tipo[valor];    delete[] var;
    */

    delete[] pi;

    return 0
}
