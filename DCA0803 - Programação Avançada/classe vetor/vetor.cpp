#include "vetor.h"



void vetor::criar(unsigned m, unsigned n)
{
    this->m = m;
    this-> = new double[this->m]
}
void vetor::copiar(const vetor &A)
{
    criar(A.m);
    if (A.M!=NULL)
    {
        for (unsigned i=0; i<m; i++) this->M[i] = A.M[i];
    }
}
void vetor::limpar()
{
    if (this->M!=NULL) delete[] this->M;
}

ostream &operator<<(ostream &saida, const vetor &A)
{
    if (A.M==NULL)
    {
        cerr << "Vetor vazio!";
        return saida;
    }
    else
    {
        for (unsigned i=0; i<m; i++)
        {
           saida << A.M[i] << ' ';
        }
        saida << endl;
        }
    }
    return saida;
}
istream &operator>>(istream &entrada, const vetor &A)
{

    for (unsigned i=0; i<m; i++)
    {
        cout << 'M[' << i << ']';
        entrada >> A.M[i];

    }
    return entrada;
}

vetor vetor::operator+(const vetor &A) const
{
    if ((this->M==NULL) || (A.M==NULL))
    {
        cerr << "Operação impossível, faltam vetores!\n";
        return vetor();
    }

    vetor prov(m);

    for (unsigned i=0; i<m; i++) prov[i] = this->M[i]+A.M[i];
    return prov;
}
vetor vetor::operator-(const vetor &A) const
{
    if ((this->M==NULL) || (A.M==NULL))
    {
        cerr << "Operação impossível, faltam vetores!\n";
        return vetor();
    }

    vetor prov(m);

    for (unsigned i=0; i<m; i++) prov[i] = this->M[i]-A.M[i];
    return prov;
}
vetor vetor::operator-(void)
{
    if (this->M==NULL)
    {
        cerr << "Operação impossível, vetor vazio!\n";
        return vetor();
    }

    vetor prov(m);

    for (unsigned i=0; i<m; i++) prov[i] = (-1)*this->M[i];
    return prov;
}
vetor vetor::operator*(const vetor &A) const
{
    if ((this->M==NULL) || (A.M==NULL))
    {
        cerr << "Operação impossível, faltam vetores!\n";
        return vetor();
    }
    if (this->m!=A.m)
    {
        cerr << "Operação impossível, dimensões incorretaws!\n";
        return vetor();
    }

    double sum(0), prov;

    for (unsigned i=0; i<m; i++) sum = sum + this->M[i]*A.M[j];
    prov = sum
    return prov
}

