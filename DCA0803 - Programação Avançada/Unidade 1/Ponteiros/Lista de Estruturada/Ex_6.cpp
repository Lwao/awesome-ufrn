#include <iostream>
using namespace std;

/*
Faça um programa que, dado um valor em reais (sem centavos), mostre a menor
combinação existente de notas (R$ 100, 50, 20, 10, 5 e 2) para esse valor.
*/

struct notas
{
	int cem=0;
	int cinq=0;
	int vin=0;
	int dez=0;
	int cinc=0;
	int dois=0;
};

int main (void)
{
	int real;
	notas cont;
	
	cout << "Inserir um valor em reais (sem centavos)" << endl;
	cin >> real;
	
	while (real>=100)
	{
		real-=100;
		cont.cem++;
	}
	while (real>=50)
	{
		real-=50;
		cont.cinq++;
	}
	while (real>=20)
	{
		real-=20;
		cont.vin++;
	}
	while (real>=10)
	{
		real-=10;
		cont.dez++;
	}
	while (real>=5)
	{
		real-=50;
		cont.cinc++;
	}
	while (real>=2)
	{
		real-=2;
		cont.dois++;
	}
	
	cout << "Notas de cem: " << cont.cem << endl;
	cout << "Notas de cinquenta: " << cont.cinq << endl;
	cout << "Notas de vinte: " << cont.vin << endl;
	cout << "Notas de dez: " << cont.dez << endl;
	cout << "Notas de cinco: " << cont.cinc << endl;
	cout << "Notas de dois: " << cont.dois << endl;
	
	return 0;
}
