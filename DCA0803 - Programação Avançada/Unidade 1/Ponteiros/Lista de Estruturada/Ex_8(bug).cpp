#include <iostream>
using namespace std;

/*
Desenvolver a função INVERTE que recebe um número (unsigned int) como pa-
râmetro e retorna este número invertido. Ex: 431 retorna 134.
*/

int pow (int b, int e)
{
    if (e=0)
        {
            return 1;
        }
        else 
        {
            if (e=1)
            {
                return b;
            }
            else 
            {
                for (int i=0; i<=e; i++)
                {
                    b=b*10;
                }
                return b;
            }
        }
    }

int inverte(int inv)
{
    int print, ret(0), i(0);
    while (inv>1)
    {
        print =  inv%10;
        ret+= print*pow(10, i);
        inv/=10;
        i++;
    } 
    return ret;
}


int main (void) 
{
    unsigned int num;
        
    cout << "Insira o número: " << endl;
    cin >> num;
    cout << "O número invertido é: " << inverte(num) << endl;
    
return 0;
}
