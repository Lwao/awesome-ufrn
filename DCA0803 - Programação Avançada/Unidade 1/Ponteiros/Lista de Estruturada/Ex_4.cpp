#include <iostream>
using namespace std;

/* 
Qual o resultado da execu��o do seguinte programa, supondo que o usu�rio digite
os valores 3 e 4? De uma maneira geral, o que faz este programa?
*/

int main(void)
{
    int x, y, p, a;
    cout << "Informe dois n�meros:" << endl;
    cin >> x;
    cin >> y;
    p = 0;
    a = y; //a passa a ter o valor inserido para y
    while(a > 0){ //O la�o while continua enquanto o a for positivo
        p += x; //p inicialziada com zero recebe ela mais o x inserido
        a--; //a descresce em hum o seu valor at� que fique nula, acabando o la�o while
        }
        cout << "\nResultado:" << p << endl; //Com x=3 e y=4, o Resultado ser� p=12
        /*O resultado p indica que, dados quaisquer x e y:
            Um x ser� multiplicado por uma constante y
            Ou seja, x ser� multiplicado y-vezes
        */
    return 0;
}

