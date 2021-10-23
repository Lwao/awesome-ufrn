#include <iostream>
using namespace std;

/*
Desenvolver a função INVERTE que recebe um número (unsigned int) como pa-
râmetro e retorna este número invertido. Ex: 431 retorna 134.
*/

void inverte(int inv)
{
    int print;
    do 
    {
        print =  inv%10;
        cout<< print;
        inv/=10;
    } while (inv>0);
}


int main (void) 
{
    unsigned int num;
        
    cout << "Insira o número: " << endl;
    cin >> num;
    inverte(num);
    

return 0;
}
