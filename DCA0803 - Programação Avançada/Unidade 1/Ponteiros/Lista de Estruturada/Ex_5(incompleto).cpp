#include <iostream>
using namespace std;

/*
Fazer uma função que recebe um dia, um mês e um ano como parâmetros e retor-
na o número de dias desde o início daquele ano. Para o dia 1º de janeiro de qual-
quer ano, a função deve retornar 1. Para o dia 31 de dezembro, ela deve retornar
365 ou 366, dependendo de o ano ser ou não bissexto. Um ano é bissexto quando
é múltiplo de 400 ou também quando é múltiplo de 4 e não múltiplo de 100.
*/

struct Data{
	int dia;
	int mes;
	int ano;
};

int retorna_data(Data &rec)
{
    int soma;

	//INSERIR ANO
    do
    {
        cout << "Insira o ano: " << endl;
        cin << rec.ano;
    } while (rec.ano>0);

	//INSERIR MES
	do
    {
        cout << "Insira o mês: " << endl;
        cin << rec.mes;
    } while ((rec.mes>0) || (rec.mes)<13));

	//INSERIR DIA
	switch (rec.mes)
	{
		case 1: //janeiro
			do
			{
				cout << "Insira o dia: " << endl;
				cin << rec.dia;
			} while ((rec.dia>0) || (rec.dia)<32));
			break;
		case 2: //fevereiro
			if (rec.ano%4==0)
			{
				do
				{
					cout << "Insira o dia: " << endl;
					cin << rec.dia;
				} while ((rec.dia>0) || (rec.dia)<30));
				break;
			}
			else
			{
			    if (rec.ano%4!=0)
                {
                    do
                    {
                        cout << "Insira o dia: " << endl;
                        cin << rec.dia;
                    } while ((rec.dia>0) || (rec.dia)<29));
                    break;
                }
			}
		case 3: //março
			do
			{
				cout << "Insira o dia: " << endl;
				cin << rec.dia;
			} while ((rec.dia>0) || (rec.dia)<32));
			break;
		case 4: //abril
			do
			{
				cout << "Insira o dia: " << endl;
				cin << rec.dia;
			} while ((rec.dia>0) || (rec.dia)<31));
			break;
		case 5: //maio
			do
			{
				cout << "Insira o dia: " << endl;
				cin << rec.dia;
			} while ((rec.dia>0) || (rec.dia)<32));
			break;
		case 6: //junho
			do
			{
				cout << "Insira o dia: " << endl;
				cin << rec.dia;
			} while ((rec.dia>0) || (rec.dia)<31));
			break;
		case 7: //julho
			do
			{
				cout << "Insira o dia: " << endl;
				cin << rec.dia;
			} while ((rec.dia>0) || (rec.dia)<32));
			break;
		case 8: //agosto
			do
			{
				cout << "Insira o dia: " << endl;
				cin << rec.dia;
			} while ((rec.dia>0) || (rec.dia)<32));
			break;
		case 9: //setembro
			do
			{
				cout << "Insira o dia: " << endl;
				cin << rec.dia;
			} while ((rec.dia>0) || (rec.dia)<31));
			break;
		case 10: //outubro
			do
			{
				cout << "Insira o dia: " << endl;
				cin << rec.dia;
			} while ((rec.dia>0) || (rec.dia)<32));
			break;
		case 11: //novembro
			do
			{
				cout << "Insira o dia: " << endl;
				cin << rec.dia;
			} while ((rec.dia>0) || (rec.dia)<31));
			break;
		case 12: //dezembro
			do
			{
				cout << "Insira o dia: " << endl;
				cin << rec.dia;
			} while ((rec.dia>0) || (rec.dia)<32));
			break;
	}


    /*
    (1)  Janeiro = 31
    (2)  Fevereiro = 28 ou 29
    (3)  Março = 31
    (4)  Abril = 30
    (5)  Maio = 31
    (6)  Junho = 30
    (7)  Julho = 31
    (8)  Agosto = 31
    (9)  Setembro = 30
    (10) Outubro = 31
    (11) Novembro = 30
    (12) Dezembro = 31
    */



	for (int i=1; i<; i++)
	{
		if (rec.ano%4==0)
		{
			switch (rec.mes)
			{
                case 1://janeiro
                soma= rec.dia;
                break;

                case 2://fevereiro
                soma= 31+rec.dia;
                break;

                case 3://março
                soma= 31+29+rec.dia;
                break;

                case 4://abril
                soma= (2*31)+29+rec.dia;
                break;

                case 5://maio
                soma= (2*31)+30+29+rec.dia;
                break;

                case 6://junho
                soma= (3*31)+30+29+rec.dia;
                break;

                case 7://julho
                soma= (3*31)+(2*30)+29+rec.dia;
                break;

                case 8://agosto
                soma= (4*31)+(2*30)+29+rec.dia;
                break;

                case 9://setembro
                soma= (5*31)+(2*30)+29+rec.dia;
                break;

                case 10://outubro
                soma= (5*31)+(3*30)+29+rec.dia;
                break;

                case 11://novembro
                soma= (6*31)+(3*30)+29+rec.dia;
                break;

                case 11://dezembro
                soma= (6*31)+(4*30)+29+rec.dia;
                break;
			}
		}
		else
		{
            if (rec.ano%4!=0)
            {
                switch (rec.mes)
                {
                    case 1://janeiro
                    soma= rec.dia;
                    break;

                    case 2://fevereiro
                    soma= 31+rec.dia;
                    break;

                    case 3://março
                    soma= 31+28+rec.dia;
                    break;

                    case 4://abril
                    soma= (2*31)+28+rec.dia;
                    break;

                    case 5://maio
                    soma= (2*31)+30+28+rec.dia;
                    break;

                    case 6://junho
                    soma= (3*31)+30+28+rec.dia;
                    break;

                    case 7://julho
                    soma= (3*31)+(2*30)+28+rec.dia;
                    break;

                    case 8://agosto
                    soma= (4*31)+(2*30)+28+rec.dia;
                    break;

                    case 9://setembro
                    soma= (5*31)+(2*30)+28+rec.dia;
                    break;

                    case 10://outubro
                    soma= (5*31)+(3*30)+28+rec.dia;
                    break;

                    case 11://novembro
                    soma= (6*31)+(3*30)+28+rec.dia;
                    break;

                    case 11://dezembro
                    soma= (6*31)+(4*30)+28+rec.dia;
                    break;
            }
		}
	}
	return soma;
}

int main (void)
{
	Data insert;

	cout << retona_data(insert) << endl;


	return 0;
}
