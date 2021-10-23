#include <iostream>
using namespace std;

/* Fazer uma função que receba 3 números como parâmetros, A, B e C, e os ordene
de tal forma que, ao final da função, A contenha o menor número e C o maior. Em
seguida, fazer um programa que receba 3 números do usuário, chame a função e
mostre os números ordenados.*/

void recebe(int &a, int &b, int &c)
{
	int menor, maior;
	
	if ((c<b) && (b<a))
	{
		menor=c;
		c=a;
		a=menor;
	} else
	{
		if ((c<a) && (a<b))
		{
			menor=c;
			c=b;
			b=a;
			a=menor;
		} else
		{
			if ((b<c) && (c<a))
			{
			menor=b;
			b=c;
			c=a;
			a=menor;
			} else
			{
				if ((b<a) && (a<c))
				{
				menor=b;
				b=a;
				a=menor;
				} else
				{
					if ((a<c) && (c<b))
					{
					maior=b;
					b=c;
					c=maior;
					}
				}
			}
		}
	}
}

void chama()
{
	int A, B, C;
	
	cout << "Inserir A, B e C: " << endl;
	cin >> A >> B >> C;
	
	recebe(A, B, C);
	
	cout << "A= " << A << ", B= " << B << ", C= " << C << endl;
	
}

int main (void) 
{
	chama();

return 0;
}
