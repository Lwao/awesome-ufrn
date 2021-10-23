#include "Poly.h"
#include <math.h>

using namespace std;


//construtores e destrutores
void Poly::criar(unsigned grau) 
{
    W=grau;
    c = new double[W+1];
}
void Poly::copiar(const Poly &P) 
{
    criar(P.W);
    if (P.c!=NULL)
    {
        for (unsigned i=0; i<=W; i++) this->c[i]=P.c[i];
    }
}
void Poly::limpar() 
{
    if (c!=NULL) 
    {
        delete[] c;
        W=0;
        c=NULL;
    }
}
void Poly::dimGrau()
{
    //testar se o grau diminuiu
    unsigned testeDim(0);
    for (unsigned i=0; i<=W; i++) //Testar se já todos são zero, assim, anulando-o
    {
        if (c[i]==0.0)
        {
            testeDim++;
        }
    }
    if (testeDim>W)//Se todos forem zero, faz nada
    {
        return ;
    }
    else//Se nem todos forem zero, diminui
    {
        for (int i=W; i>=0; i--)
        {
            if (c[i]==0)
            {
                Poly prov (W-1);
                for (unsigned i=0; i<=prov.W; i++) prov.c[i]=this->c[i];
                *this=prov;
            }
            else 
            {
                return ;
            }
        }
    }
}



//consulta
double Poly::getCoef(unsigned g) const //ok
{
    if (W<0)
    {
        cerr << "Polinômio impossível\n";
        return 0.0;
    }
    return c[g];
    
}
void Poly::setCoef(unsigned g, double Coef) //ok
{
    if (W<0)
    {
        cerr << "Polinômio impossível\n";
        return ;
    }
    c[g]= Coef;
}



//operadores friends
ostream &operator<<(ostream &saida, const Poly &P) //ok
{
    if (P.W<0)
    {
        cerr << "Polinômio impossível\n";
        return saida;
    }
    
    if (P.c==NULL)
    {
        cerr << "Polinômio vazio!";
        return saida;
    }
    else
    {
        unsigned count(0);
            
        for (unsigned i=0; i<=P.W; i++) //testar se todos forem zero, imprimir apenas um zero
        {
            if (P.c[i]==0)
            {
                count++;
            }
        }
        if (count>P.W)
        {
            saida << P.c[0] << "x^" << 0 << ' ';//Se todos forem zero, imprime 0;
            return saida;
        }
    
        for (int i=P.W; i>=0; i--)
        {
            if (P.c[i]!=0) //vai imprimir apenas os coeficientes diferentes de 0
            {
                saida << P.c[i] << "x^" << i << ' ';
            }
        }
        saida << endl;
    }
    return saida;
}

istream &operator>>(istream &entrada, const Poly &P) //ok
{
    //teste 
   
    if (P.W<0)
    {
        cerr << "Polinômio impossível\n";
        return entrada;
    }
    for (int i=P.W; i>=0; i--) 
    {
        cout << "\nx^" << i << ": ";
        entrada >> P.c[i];
    }
    cout << endl;
    return entrada;
}


//operadores usuais
Poly Poly::operator+(const Poly &P) const //ok
{
    //teste 
   
    if ((W<0) || (P.W<0) || (c==NULL) || (P.c==NULL))
    {
        cerr << "Operação impossível, faltam polinômios!\n";
        return Poly();
    }
    
    //operação
    if (W>=P.W)
    {
        Poly prov(W); 
        for (int i=prov.W; i>=0; i--)
        {
            if(i<=P.W) 
            {
                prov.c[i]=this->c[i]+P.c[i];
            }
            else 
            {
                prov.c[i]=this->c[i];
            }
        } 
        prov.dimGrau();
        return prov;
    }
    else
    {
        Poly prov(P.W); 
        for (int i=prov.W; i>=0; i--)
        {
            if(i<=W) 
            {
                prov.c[i]=c[i]+P.c[i];
            }
            else 
            {
                prov.c[i]=P.c[i];
            }
        }
        prov.dimGrau();
        return prov;
    }   
}

Poly Poly::operator-(const Poly &P) const //ok
{
    //teste 
   
    if ((W<0) || (P.W<0) || (c==NULL) || (P.c==NULL))
    {
        cerr << "Operação impossível, faltam polinômios!\n";
        return Poly();
    }
    
    //operação
    if (W>=P.W)
    {
        Poly prov(W); 
        for (int i=prov.W; i>=0; i--)
        {
            if(i<=P.W) 
            {
                prov.c[i]=this->c[i]-P.c[i];
            }
            else 
            {
                prov.c[i]=this->c[i];
            }
        } 
        prov.dimGrau();
        return prov;
    }
    else
    {
        Poly prov(P.W); 
        for (int i=prov.W; i>=0; i--)
        {
            if(i<=W) 
            {
                prov.c[i]=c[i]-P.c[i];
            }
            else 
            {
                prov.c[i]=P.c[i];
            }
        }
        prov.dimGrau();
        return prov;
    }
}// Subtração

Poly Poly::operator-(void) const //ok
{
    if (W<0 || (c==NULL))
    {
        cerr << "Operação impossível, falta o polinômio!\n";
        return Poly();
    }
    Poly prov(W);
    for (unsigned i=0; i<=W; i++)
    {
        prov.c[i]=(-1.0)*c[i];   
    }
    return prov;
}// Inverter o sinal dos coeficientes


Poly Poly::operator*(const Poly &P) const
{
    //teste 
   
    if ((W<0) || (P.W<0) || (c==NULL) || (P.c==NULL))
    {
        cerr << "Operação impossível, faltam polinômios!\n";
        return Poly();
    }
    
    Poly prov(W+P.W);
    for (unsigned i=0; i<=prov.W; i++) prov.c[i]=0.0; //zerando todas as entradas para garantir a soma dos graus iguais
    
    for (int i=W; i>=0; i--)
    {
        for (int j=P.W; j>=0; j--)
        {
            prov.c[i+j]+=this->c[i]*P.c[j];
        }
    }
    prov.dimGrau();
    return prov;
}// Multiplicação

Poly Poly::operator/(const Poly &D) const
{
    //testes
    if ((W<0) || (D.W<0) || ((c==NULL) && (D.c==NULL)))
    {
        cerr << "Operação impossível, faltam polinômios!\n";
        return Poly();
    }     

    unsigned count(0);
            
    for (unsigned i=0; i<=D.W; i++) //testar se todos forem zero, imprimir apenas um zero
    {
        if (D.c[i]==0)
        {
            count++;
        }
    }
    
    if (D.W<count)
    {
        cerr << "Operação impossível, denominador nulo!\n";
        cerr << "Retornando numerador!\n";
        return *this;
    } 
    
    //operação
   
    Poly r=*this, den=D;
    unsigned m(0);
    
    den.dimGrau();
    r.dimGrau();
    
    if (r.W<den.W)
    {
        cerr << "Grau do numerador menor que o grau do denominador!" << endl;
        cerr << "Divisão não executada, retornando 0.0!" << endl; 
        Poly quo(den.W-r.W);
        for (unsigned i=0; i<=quo.W; i++) quo.c[i]=0.0; //zerando todas as entradas do quociente
        return quo;
    }
    else
    {
        Poly quo(r.W-den.W);
        for (unsigned i=0; i<=quo.W; i++) quo.c[i]=0.0; //zerando todas as entradas do quociente
        for (unsigned i=0; i<=quo.W; i++)
        {
            cout << "r.W-den.W " << r.W-den.W << endl;
            if ((den.c[den.W-m]!=0) && (r.c[r.W]!=0))
            {
                quo.c[r.W-den.W]=r.c[r.W]/den.c[den.W];
                Poly temp(r.W);
                for (unsigned j=0; j<=temp.W; j++) temp.c[j]=0.0; //preenchendo tudo zero, antes
                for (int k=0; k<=den.W; k++) temp.c[temp.W-k]=quo.c[r.W-den.W]*den.c[den.W-k];
                r=r-temp;
            } 
            else
            {
            //apenas para pular no denominador;    
            }
            
            if (m<den.W)
            {
                do 
                {
                    m++;
                } while ((den.c[den.W-m]==0) && (m<den.W));
            }
        }
        return quo;
    }
}// Divisão

Poly Poly::operator%(const Poly &D) const
{
    //testes
    if ((W<0) || (D.W<0) || (c==NULL) || (D.c==NULL))
    {
        cerr << "Operação impossível, faltam polinômios!\n";
        return Poly();
    }    

    unsigned count(0);
            
    for (unsigned i=0; i<=D.W; i++) //testar se todos forem zero, imprimir apenas um zero
    {
        if (D.c[i]==0)
        {
            count++;
        }
    }
    
    if (D.W<count)
    {
        cerr << "Operação impossível, denominador nulo!\n";
        cerr << "Retornando numerador!\n";
        return *this;
    }
    
    
    //operação
    
    Poly r=*this, den=D;
    unsigned m(0);
    
    den.dimGrau();
    r.dimGrau();
    
    if (r.W<den.W)
    {
        cerr << "Grau do numerador menor que o grau do denominador!" << endl;
        cerr << "Divisão não executada, retornando 0.0!" << endl; 
        Poly quo(den.W-r.W);
        for (unsigned i=0; i<=quo.W; i++) quo.c[i]=0.0; //zerando todas as entradas do quociente
        return quo;
    }
    else
    {
        Poly quo(r.W-den.W);
        for (unsigned i=0; i<=quo.W; i++) quo.c[i]=0.0; //zerando todas as entradas do quociente
        for (unsigned i=0; i<=quo.W; i++)
        {
            if ((den.c[den.W-m]!=0) && (r.c[r.W]!=0))
            {
                quo.c[r.W-den.W]=r.c[r.W]/den.c[den.W];
                Poly temp(r.W);//teste
                for (unsigned j=0; j<=temp.W; j++) temp.c[j]=0.0; //preenchendo tudo zero, antes
                for (int k=0; k<=den.W; k++) temp.c[temp.W-k]=quo.c[r.W-den.W]*den.c[den.W-k];
                r=r-temp;
            } 
            else
            {
            //apenas para pular no denominador;    
            }
            
            if (m<den.W)
            {
                do 
                {
                    m++;
                } while ((den.c[den.W-m]==0) && (m<den.W));
            }
        }
        return r;
    }
}// Resto (divisão)

double Poly::operator()(double x) const
{
    double result(0);
    
    for (int i=W; i>=0; i--)
    {
        result+=c[i]*(pow(x, i));  //pode ser  result+=c[i]*(operator^(atrib,j));
    }
    return result;
}
    


