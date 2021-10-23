#include <iostream>
using namespace std;

/*
Desenvolver a função INVERTE que recebe um número (unsigned int) como pa-
râmetro e retorna este número invertido. Ex: 431 retorna 134.
*/

int inverte(int &inv)
{
    int cont(0), phant, *p_inv, trans;
    
    phant=inv;
    trans=inv;

    
    //Descobrir a quantidade de números
    while ((phant/10)>1)
    {
        phant=phant/10;
        cont++;
    }
    
    //Cria o array com a quantidade de números
    p_inv= new int[cont];
    
    for (int i=0; i<cont; i++)
    {
        p_inv[i]=trans%10;
        trans/=10;
    }
	inv=cont;
    return *p_inv;
}


int main (void) 
{
    unsigned int num;
    int *ptr;
        
    cout << "Insira o número: " << endl;
    cin >> num;
    ptr=&inverte(num);
    ptr= new int[num];
    cout << "Número invertido: ";
    for (int i=0; i<num; i++)
    {
        cout << *(ptr+i) << " ";
    }

    

return 0;
}
