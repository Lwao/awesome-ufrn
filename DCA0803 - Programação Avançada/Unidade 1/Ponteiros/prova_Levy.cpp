#include <iostream>
using namespace std;

// Levy Gabriel da Silva Galvão
//20170056839

struct VarMatrix
{
    int NL;
    int *NC;
    double **x;
};

VarMatrix newVarMatrix(unsigned nLinhas, unsigned nColunas);
void print(const VarMatrix &M);
void addLine (VarMatrix &M, double novo);
void addElem (&M, unsigned linha, double novo);
void liberarMatrix(&M);

unsigned criarptrProvisorio (const &M);
void alocarprovisorio();
void copiarprovisorio(const &M);
void liberarProv(&M);

int main (void)
{
    VarMatrix VM = newVarMatrix();
    double elem_anterior, novo_elem;
    unsigned numLinhas = 0;
    do
    {
        cout << "Novo elemento [0.0 p/ terminar]: ";
        cin >> novo_elem;
        if (novo_elem != 0.0)
        {
            if (numLinhas == 0 || // Primeira vez
                elem_anterior*novo_elem < 0.0) // Sinais diferentes
            {
                addLine(VM, novo_elem);
                numLinhas++;
            }
            else
            {
                addElem(VM, numLinhas-1, novo_elem);
            }
            elem_anterior = novo_elem;
        }
        cout << "Elemento = " << novo_elem << " na linha " << numLinhas-1 << endl;
    } while (novo_elem != 0.0);
    cout << "Matriz digitada:\n";
    print(VM);

    return 0;
}


unsigned criarptrProvisorio ()
{
    unsigned prov

    prov = new int[];

    return prov;
}
void alocarprovisorio()
{

}
void copiarprovisorio(const &M)
{

}
void liberarProv(&M)
{
    delete[] M.NC;
}



VarMatrix newVarMatrix()
{
    VarMatrix M;
    M.NC = criarptrProvisorio()
    M.x = new double*[M.NL];
    for (int i=0; i<M.NC); i++)
    {
        M.x[i]=new double[M.NC];
    }
    return M;
}

void print(const VarMatrix &M) //ok
{
    for (int i=0; i<M.NL; i++)
    {
        for (int j=0; i<M.NC; j++)
        {
            cout << M.x << " ";
        }
        cout << endl;
    }
}

void liberarMatrix(&M) //ok
{
    for (int i=0; i<M.NL; i++)
    {
        delete[] M.x[i];
    }
    delete[] M.x;

    M.NL = M.NC = 0;
    M.x = NULL;
}

void addLine (VarMatrix &M, double novo)
{

    for (int i=0; i<M.NL; i++)
    {
        for (int j=0; j<M.NC; j++)
        {
            M.x[i][j]=novo
        }
    }
}

void addElem (&M, unsigned linha, double novo)
{
    for (int i=0; i<M.NC; i++)
    {
        if (linha<=M.NL)
        {
            M.x[linha][i]=novo;
        }
        else
        {
            cerr << "Linha não existe!\n";
            return 0;
        }
    }
}
