#include <iostream>
#include <cstring>
#include "Poly.h"

/*

Deverá ser desenvolvida uma classa, denominada Poly, que permita criação e realização das operações aritméticas usuais com polinômios de qualquer grau. A classe deverá permitir a compilação e execução correta do arquivo principal anexo. O desenvolvimento do projeto deverá ser feito de forma individual.

*/

using namespace std;

int main(void)
{
    Poly P1, P2, result; 
    double x;           
    int grau;           
    char opcao;             

    cout << "CALCULADORA DE POLINOMIOS\n";
    do
    {
        do
        {
            cout << endl;
            cout << "P1: " << P1 << endl; 
            cout << "P2: " << P2 << endl;
            cout << "Digite sua opcao:\n";
            cout << "< - Entrar um novo polinomio\n";                       //ok
            cout << "+ - Somar os polinomios\n";                            //ok
            cout << "- - Subtrair os polinomios\n";                         //ok
            cout << "* - Multiplicar os polinomios\n";                      //ok
            cout << "/ - Dividir os polinomios (retornar quociente)\n";     //segmentação
            cout << "% - Dividir os polinomios (retornar resto)\n";         //segmentação
            cout << "x - Calcular o polinomio para um valor de x\n";        //ok
            cout << "i - Inverter o sinal do ultimo polinomio\n";           //ok
            cout << "t - Trocar os polinomios\n";                           //ok
            cout << "q - Terminar\n";
            cin >> opcao;
            opcao = tolower(opcao);
        } while (strchr("<+-*/%xitq",opcao)==NULL); 
        switch(opcao)
        {
        case '<':
            do {
                cout << "Grau do polinomio: "  ;
                cin >> grau;
            } while (grau<0);
            result = Poly(grau);
            cout << "Coeficientes do polinomio:\n";
            cin >> result;
            break;
        case '+':
            result = P1+P2;
            break;
        case '-':
            result = P1-P2;
            break;
        case '*':
            result = P1*P2;
            break;
        case '/':
            result = P1/P2;
            break;
        case '%':
            result = P1%P2;
            break;
        case 'x':
            cout << "Valor de x: ";
            cin >> x;
            cout << "P2(x) = " << P2(x) << endl;
            break;
        case 'i':
            P2 = -P2;
            break;
        case 't':
            result = P1;
            P1 = P2;
            P2 = result;
            break;
        case 'q':
            break;
        default:
            cerr << "Opcao desconhecida\n";
            result = Poly();
            break;
        }
        if (strchr("<+-*/%",opcao)!=NULL)
        {
            cout << "Resultado: " << result << endl;
            P1 = P2;
            P2 = result;
        }
    } while (opcao != 'q'); 

}
