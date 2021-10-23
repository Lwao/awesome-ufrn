#include <iostream>
using namespace std;

/* 
Qual o resultado da execução do seguinte programa, supondo que o usuário digite
os valores 3 e 4? De uma maneira geral, o que faz este programa?
*/

int main(void)
{
    int x, y, p, a;
    cout << "Informe dois números:" << endl;
    cin >> x;
    cin >> y;
    p = 0;
    a = y; //a passa a ter o valor inserido para y
    while(a > 0){ //O laço while continua enquanto o a for positivo
        p += x; //p inicialziada com zero recebe ela mais o x inserido
        a--; //a descresce em hum o seu valor até que fique nula, acabando o laço while
        }
        cout << "\nResultado:" << p << endl; //Com x=3 e y=4, o Resultado será p=12
        /*O resultado p indica que, dados quaisquer x e y:
            Um x será multiplicado por uma constante y
            Ou seja, x será multiplicado y-vezes
        */
    return 0;
}

