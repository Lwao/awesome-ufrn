#include <iostream>
using namespace std;

/*
Fazer um programa que sorteie um número de 0 a 100 e que permita que o usuário
(sem conhecer o número sorteado) tente acertar. Caso não acerte, o programa de-
ve imprimir uma mensagem informando se o número sorteado é maior ou menor
que a tentativa feita. Ao acertar o número, o programa deve imprimir a quantidade
de tentativas feitas.
*/

int main (void)
{
    int num_sort, num_insert, tent(0);
    srand(time(0));

    while (num_sort!=num_insert)
    {
        num_sort = 0+(rand()%100);
        do
	{
	cout << "Insira um número para ver se coincide com um inteiro aleatório de 0 a 100: " << endl;	
	cin >> num_insert;
	} while((num_insert<0) || (num_insert>100));

        if (num_sort>num_insert)
        {
        cout << "O número sorteado é maior que o inserido!" << endl;
        }
        if (num_sort<num_insert)
        {
        cout << "O número sorteado é menor que o inserido!" << endl;
        }
        tent++;
    }
    cout << "O número foi acertado e a qunatidade de tentativas foi: " << tent << endl;

return 0;
}
