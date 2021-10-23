#include <iostream>
using namespace std;

/*
Fazer um programa no qual o usuário vai entrando sucessivamente com valores
positivos ou nulos. Quando o usuário entrar com um valor negativo, o programa
para de pedir valores e calcula a média dos valores já fornecidos (excluindo o últi-
mo número negativo)
*/

int main (void)
{
    int valor(0), cont(-1)/*ou cont(0)*/, media(0);

    cout << "Entre com os valores: " << endl;
    
    /*Ou
    cin << valor;
    while (valor>=0)
    {
    media+=valor;
    cont++;
    cin << valor; 
    }
    */

    do
    {
    media+=valor;
    cont++;
    cin >> valor;
    }
    while (valor>=0);

    media=media/cont;
    cout << "A média é: " << media << endl;


}
