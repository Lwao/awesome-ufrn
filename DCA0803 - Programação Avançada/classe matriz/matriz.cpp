#include "matriz.h"



void matriz::criar(unsigned m, unsigned n)
{
    this->m = m;
    this->n = n;
    this-> = new double*[this->m]
    for (int i=0; i<n; i++) this->M[i] = new double[this->n];
}
void matriz::copiar(const matriz &A)
{
    criar(A.m, A.n);
    if (A.M!=NULL)
    {
        for (unsigned i=0; i<m; i++)
        {
            for (unsigned j=0; j<n; j++) this->M[i][j] = A.M[i][j];
        }
    }
}
void matriz::limpar()
{
    if (this->M!=NULL)
    {
        for (unsigned i=0; i<(this->m); i++) delete[] this->M[i];
        delete[] this->M;
    }
}

ostream &operator<<(ostream &saida, const matriz &A)
{
    if (A.M==NULL)
    {
        cerr << "Matriz vazia!";
        return saida;
    }
    else
    {
        for (unsigned i=0; i<m; i++)
        {
            for (unsigned j=0; j<n; j++)
            {
                saida << A.M[i][j] << ' ';
            }
            saida << endl;
        }
    }
    return saida;
}
istream &operator>>(istream &entrada, const matriz &A)
{

    for (unsigned i=0; i<m; i++)
    {
        for (unsigned j=0; j<n; j++)
        {
            cout << 'M[' << i << '][' << j << ']' ;
            entrada >> A.M[i][j];
        }
    }
    return entrada;
}

matriz matriz::operator+(const matriz &A) const
{
    if ((this->M==NULL) || (A.M==NULL))
    {
        cerr << "Operação impossível, faltam matrizes!\n";
        return matriz();
    }

    matriz prov(m, n);

    for (unsigned i=0; i<m; i++)
    {
        for (unsigned j=0; j<n; j++) prov[i][j] = this->M[i][j]+A.M[i][j];
    }
    return prov;
}
matriz matriz::operator-(const matriz &A) const
{
    if ((this->M==NULL) || (A.M==NULL))
    {
        cerr << "Operação impossível, faltam matrizes!\n";
        return matriz();
    }

    matriz prov(m, n);

    for (unsigned i=0; i<m; i++)
    {
        for (unsigned j=0; j<n; j++) prov[i][j] = this->M[i][j]-A.M[i][j];
    }
    return prov;
}
matriz matriz::operator-(void)
{
    if (this->M==NULL)
    {
        cerr << "Operação impossível, matriz vazia!\n";
        return matriz();
    }

    matriz prov(m, n);

    for (unsigned i=0; i<m; i++)
    {
        for (unsigned j=0; j<n; j++) prov[i][j] = (-1)*this->M[i][j];
    }
    return prov;
}
matriz matriz::operator*(const matriz &A) const
{
    if ((this->M==NULL) || (A.M==NULL))
    {
        cerr << "Operação impossível, faltam matrizes!\n";
        return matriz();
    }
    if (this->n!=A.m)
    {
        cerr << "Operação impossível, dimensões incorretaws!\n";
        return matriz();
    }

    matriz prov(m, n);
    double sum(0);

    for (unsigned i=0; i<m; i++)
    {
        for (unsigned j=0; j<n; j++) sum = sum + this->M[i][j]*A.M[j][i];
        prov[i][j] = sum;
    }
    return prov
}

