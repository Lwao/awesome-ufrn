#include <iostream>
using namespace std;

int main (void) 
{
string nome;
string sobrenome;
string sum;

cin >> nome;
cout << "NOME " << nome << endl;

cin >> sobrenome;

sum = nome+sobrenome;

cout << "NOME+SOBRENOME " << sum << endl;

cout << &nome << endl;
cout << &sobrenome << endl;
cout << &sum << endl;
cout << "===" << endl;
cout << &nome[0] << endl;
cout << &nome[1] << endl;
cout << &nome[2] << endl;
cout << &nome[3] << endl;
cout << &nome[4] << endl;
cout << &nome[5] << endl;
cout << &nome[6] << endl;
cout << "===" << endl;
cout << &sobrenome[0] << endl;
cout << &sobrenome[1] << endl;
cout << &sobrenome[2] << endl;
cout << &sobrenome[3] << endl;
cout << &sobrenome[4] << endl;
cout << &sobrenome[5] << endl;
cout << &sobrenome[6] << endl;
cout << &sobrenome[7] << endl;
cout << &sobrenome[8] << endl;
cout << "===" << endl;
cout << &sum[0] << endl;
cout << &sum[1] << endl;
cout << &sum[2] << endl;
cout << sum[0] << endl;
cout << sum[1] << endl;
cout << sum[2] << endl;




return 0;
}
