#include <iostream>
using namespace std;

/*
Fazer um programa que recebe um símbolo de operação do usuário (+, -, / ou *) e
dois números reais. O programa deve retornar o resultado da operação recebida
sobre estes dois números. Este funcionamento deve ser repetido até que o símbolo
seja algo que não corresponda a nenhuma das quatro operações reconhecidas.
*/


int main (void)
{
    double valor_1, valor_2, result;
    char simb;

    do
    {
        cout << "Entre com uma das quatros operações básicas (+, -, / ou *): " << endl;
        cin >> simb;
        cout << "Entre com dois valores: " << endl;
        cin >> valor_1 >> valor_2;

        switch (simb)
        {
            case '+':
                result=valor_1+valor_2;
                cout << result << endl;
                break;

            case '-':
                result=valor_1-valor_2;
                cout << result << endl;
                break;

            case '/':
                result=valor_1/valor_2;
                cout << result << endl;
                break;

            case '*':
                result=valor_1*valor_2;
                cout << result << endl;
                break;
            default:
                cout << "Saindo..." << endl;
        }
    } while ((simb='+') || (simb='-') || (simb='/') || (simb='*'));
    return 0;
}
