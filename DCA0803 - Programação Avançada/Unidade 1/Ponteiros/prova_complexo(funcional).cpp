#include <iostream>
using namespace std;

struct complexo
{
    double real, imag;
};

complexo lerComplexo();
void imprimirComplexo(complexo Z);

complexo somaComplexo(complexo Z1, complexo Z2);
complexo produtoComplexo(complexo Z1, complexo Z2);

struct VetorComplexo
{
    int N;
    complexo *vetor_c;
};

void criarVetor(VetorComplexo &VZ);
void lerVetor(VetorComplexo &VZ);
void imprimirVetor(VetorComplexo VZ);

VetorComplexo somaVetor(VetorComplexo VZ1, VetorComplexo VZ2);
complexo produtoEscalar(VetorComplexo VZ1, VetorComplexo VZ2);



int main (void)
{
    VetorComplexo VA, VB;

    do
    {
        cout << "Inserir as dimensões dos vetores de complexo: ";
        cin >> VA.N;
    } while (VA.N<=0);

    VB.N=VA.N;

    criarVetor(VA);
    criarVetor(VB);

    lerVetor(VA);
    lerVetor(VB);
    
    imprimirVetor(VA);
    imprimirVetor(VB);    
    
    cout << "Soma dos vetores: " << endl;
    imprimirVetor(somaVetor(VA, VB));

    cout << "Produto dos vetores: " << endl;
    imprimirComplexo(produtoEscalar(VA, VB));
    
    delete[] VA.vetor_c;
    delete[] VB.vetor_c;

    return 0;
}

complexo lerComplexo() //OK
{
    complexo Z;
    cout << "Inserir parte real" << endl;
    cin >> Z.real;
    cout << "Inserir parte imaginária" << endl;
    cin >> Z.imag;

    return Z;
}
void imprimirComplexo(complexo Z) //OK
{
    cout << Z.real << " + j" << Z.imag << endl;
}
complexo somaComplexo(complexo Z1, complexo Z2) //OK
{
    complexo soma;

    soma.real=Z1.real+Z2.real;
    soma.imag=Z1.imag+Z2.imag;

    return soma;
}
complexo produtoComplexo(complexo Z1, complexo Z2) //OK
{
    complexo produto;

    produto.real=((Z1.real*Z2.real)-(Z1.imag*Z2.imag));
    produto.imag=((Z1.real*Z2.imag)+(Z1.imag*Z2.real));

    return produto;
}


void criarVetor(VetorComplexo &VZ) //OK
{
    complexo nullo;
    nullo.imag=0;
    nullo.real=0;

    VZ.vetor_c = new complexo[VZ.N];
    cout << "O complexo na primeira posição será do tipo 0+j0" << endl;
    VZ.vetor_c[0]=nullo;
}
void lerVetor(VetorComplexo &VZ) //OK
{
    for (int i=1; i<VZ.N; i++)
    {
        cout << "Inserir na posição " << i+1 << ": " << endl;
        VZ.vetor_c[i] = lerComplexo();
    }
}
void imprimirVetor(VetorComplexo VZ) //OK
{
    for (int i=0; i<VZ.N; i++)
    {
        imprimirComplexo(VZ.vetor_c[i]);
    }
}
VetorComplexo somaVetor(VetorComplexo VZ1, VetorComplexo VZ2) //OK
{
    VetorComplexo somav;

    somav.N=VZ1.N;
    cout << "Vetor soma será criado com o número de colunas igual dos vetores operandos!" << endl;
    criarVetor(somav);

    for (int i=1; i<somav.N; i++)
    {
        if (VZ1.N==VZ2.N)
        {
            somav.vetor_c[i]=somaComplexo(VZ1.vetor_c[i], VZ2.vetor_c[i]);
        }
    }
    return somav;
}
complexo produtoEscalar(VetorComplexo VZ1, VetorComplexo VZ2) //OK
{
    complexo prodv;

    prodv.real=0;
    prodv.imag=0;

    for (int i=1; i<VZ1.N; i++)
    {
        if (VZ1.N==VZ2.N)
        {
            prodv=somaComplexo(prodv, produtoComplexo(VZ1.vetor_c[i], VZ2.vetor_c[i]));
        }
    }
    return prodv;
}
