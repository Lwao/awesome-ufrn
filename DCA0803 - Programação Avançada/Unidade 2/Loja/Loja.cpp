#include "Loja.h"
#include <limits>
#include <fstream>
#include <iomanip>


using namespace std;

//MÉTODOS DA CLASSE Produto

void Produto::copiar(const Produto& P)
{
    nome = P.nome;
    preco = P.preco;
}
void Produto::limpar()
{
    nome = " ";
    preco = 0;
}
istream &Produto::digitar(istream& entrada)
{
    float p;
    cout << "Digite o nome do produto: ";
    entrada.ignore(numeric_limits<streamsize>::max(), '\n');  // Sobra ENTER da leitura anterior
    getline(entrada, nome, '\n');

    do
    {
        cout << "Digite o preço do produto em pontos flutuantes: ";
        entrada >> p;
    } while (p<=0);

    preco = (p*100);

    return entrada;
}
ostream &Produto::imprimir(ostream& saida) const
{
    saida << '"';
    saida << nome;
    saida << "\";$";
    saida << fixed;
    saida << setprecision(2) << preco/100.0;

    return saida;
}
istream &Produto::ler(istream& entrada)
{
    float p;
    //Ler nome do produto
    entrada.ignore(numeric_limits<streamsize>::max(), '"');
    getline(entrada, nome, '"');
    entrada.ignore(numeric_limits<streamsize>::max(), ';');
    //Ler preço do produto
    entrada.ignore(numeric_limits<streamsize>::max(), '$');
    entrada >> p;
    preco = (p*100);
    return entrada;
}


//MÉTODOS DA CLASSE Livro

void Livro::operator=(const Livro &L)
{
    if (this!=&L)
    {
        Produto::criar(L);
        limpar();
        copiar(L);
    }
}
istream &Livro::digitar(istream& entrada)
{
    Produto::digitar(entrada);
    entrada.ignore(numeric_limits<streamsize>::max(), '\n');  // Sobra ENTER da leitura anterior
    cout << "Digite o nome do autor: ";
    getline(entrada, autor, '\n');
    return entrada;
}
ostream &Livro::imprimir(ostream& saida) const
{
    saida << "L: ";
    Produto::imprimir(saida);

    saida << ";\"";
    saida << autor;
    saida << "\"\n";

    return saida;
}
istream &Livro::ler(istream& entrada)
{
    Produto::ler(entrada);
    entrada.ignore(numeric_limits<streamsize>::max(), '"');
    getline(entrada, autor, '"');

    return entrada;
}




//MÉTODOS DA CLASSE CD

void CD::operator=(const CD &C)
{
    if (this!=&C)
    {
        Produto::criar(C);
        limpar();
        copiar(C);
    }
}
istream &CD::digitar(istream& entrada)
{
    Produto::digitar(entrada);
    do
    {
        cout << "Digite o número de faixas: ";
        entrada >> faixas;
    } while (faixas<=0);

    return entrada;
}
ostream &CD::imprimir(ostream& saida) const
{
    saida << "C: ";
    Produto::imprimir(saida);

    saida << ';' << faixas << '\n';

    return saida;
}
istream &CD::ler(istream& entrada)
{
    Produto::ler(entrada);
    entrada.ignore(numeric_limits<streamsize>::max(), ';');
    entrada >> faixas;

    return entrada;
}



//MÉTODOS DA CLASSE DVD

void DVD::operator=(const DVD &D)
{
    if (this!=&D)
    {
        Produto::criar(D);
        limpar();
        copiar(D);
    }
}
istream &DVD::digitar(istream& entrada)
{
    Produto::digitar(entrada);
    do
    {
        cout << "Digite a duração, em minutos: ";
        entrada >> duracao;
    } while (duracao<=0);
    return entrada;
}
ostream &DVD::imprimir(ostream& saida) const
{
    saida << "D: ";
    Produto::imprimir(saida);

    saida << ';' << duracao << '\n';

    return saida;
}
istream &DVD::ler(istream& entrada)
{
    Produto::ler(entrada);
    entrada.ignore(numeric_limits<streamsize>::max(), ';');
    entrada >> duracao;

    return entrada;
}



//MÉTODOS DA CLASSE ListaLivro

void ListaLivro::criar(unsigned size)
{
    N=size;
    x = new Livro[size];
}
void ListaLivro::copiar(const ListaLivro &LL)
{
    criar(LL.N);
    if (LL.x!=NULL)
    {
        for (unsigned i=0; i<N; i++) this->x[i]=LL.x[i];
    }
}
void ListaLivro::limpar()
{
    if (x!=NULL)
    {
        delete[] x;
        N=0;
        x=NULL;
    }
}
void ListaLivro::incluir(const Livro& L)
{
    ListaLivro prov(N+1);
    if (x!=NULL)
    {
        for (unsigned i=0; i<N; i++) prov.x[i]=this->x[i];
        limpar();
        prov.x[prov.N-1]=L;
        *this=prov;
    }
    else
    {
        prov.x[prov.N-1]=L;
        *this=prov;
    }
}
void ListaLivro::excluir(unsigned int id)
{
    if ((id<0) || (id>=N))
    {
        cerr << "id inválido!" << endl;
    }
    else
    {
        if ((N-1)!=0)
        {
            ListaLivro prov(N-1);
            for (unsigned i=0; i<id; i++) prov.x[i]=this->x[i];
            for (unsigned j=id; j<prov.N; j++) prov.x[j]=this->x[j+1];
            limpar();
            *this=prov;
        }
        else
        {
            limpar();
        }
    }
}
void ListaLivro::imprimir() const
{
    cout << "LISTALIVRO " << N << endl;
    if (N>0)
    {
        for (unsigned i=0; i<N; i++)
        {
            cout << i << ") ";
            x[i].Livro::imprimir(cout);
        }
    }
    else
    {
        if (N==0)
        {
            cerr << "Lista vazia!" << endl;
        }
        else 
        {
            cerr << "Lista de tamanho inválido!" << endl;
        }
    }
}
void ListaLivro::ler(istream& entrada)
{
    entrada >> N;
    if (N<0)
    {
        cerr << "Tamanho da lista inválido!" << endl;
    }
    else
    {
        criar(N);
        for (unsigned i=0; i<N; i++) x[i].Livro::ler(entrada);
    }
}
void ListaLivro::salvar(ostream& saida) const
{
    saida << "LISTALIVRO " << N << endl;
    for (unsigned i=0; i<N; i++) x[i].Livro::salvar(saida);
}



//MÉTODOS DA CLASSE ListaCD

void ListaCD::criar(unsigned size)
{
    N=size;
    x = new CD[size];
}
void ListaCD::copiar(const ListaCD &LC)
{
    criar(LC.N);
    if (LC.x!=NULL)
    {
        for (unsigned i=0; i<N; i++) this->x[i]=LC.x[i];
    }
}
void ListaCD::limpar()
{
    if (x!=NULL)
    {
        delete[] x;
        N=0;
        x=NULL;
    }
}
void ListaCD::incluir(const CD& C)
{
    ListaCD prov(N+1);
    if (x!=NULL)
    {
        for (unsigned i=0; i<N; i++) prov.x[i]=this->x[i];
        limpar();
        prov.x[prov.N-1]=C;
        *this=prov;
    }
    else
    {
        prov.x[prov.N-1]=C;
        *this=prov;
    }
}
void ListaCD::excluir(unsigned int id)
{
    if ((id<0) || (id>=N))
    {
        cerr << "id inválido!" << endl;
    }
    else
    {
        if ((N-1)!=0)
        {
            ListaCD prov(N-1);
            for (unsigned i=0; i<id; i++) prov.x[i]=this->x[i];
            for (unsigned j=id; j<prov.N; j++) prov.x[j]=this->x[j+1];
            limpar();
            *this=prov;
        }
        else
        {
            limpar();
        }
    }
}
void ListaCD::imprimir() const
{
    cout << "LISTACD " << N << endl;
    if (N>0)
    {
        for (unsigned i=0; i<N; i++)
        {
            cout << i << ") ";
            x[i].CD::imprimir(cout);
        }
    }
    else
    {
        if (N==0)
        {
            cerr << "Lista vazia!" << endl;
        }
        else 
        {
            cerr << "Lista de tamanho inválido!" << endl;
        }
    }
}
void ListaCD::ler(istream& entrada)
{
    entrada >> N;
    if (N<0)
    {
        cerr << "Tamanho da lista inválido!" << endl;
    }
    else
    {
        criar(N);
        for (unsigned i=0; i<N; i++) x[i].CD::ler(entrada);
    }
}
void ListaCD::salvar(ostream& saida) const
{
    saida << "LISTACD " << N << endl;
    for (unsigned i=0; i<N; i++) x[i].CD::salvar(saida);
}


//MÉTODOS DA CLASSE ListaDVD

void ListaDVD::criar(unsigned size)
{
    N=size;
    x = new DVD[size];
}
void ListaDVD::copiar(const ListaDVD &LD)
{
    criar(LD.N);
    if (LD.x!=NULL)
    {
        for (unsigned i=0; i<N; i++) this->x[i]=LD.x[i];
    }
}
void ListaDVD::limpar()
{
    if (x!=NULL)
    {
        delete[] x;
        N=0;
        x=NULL;
    }
}
void ListaDVD::incluir(const DVD& D)
{
    ListaDVD prov(N+1);
    if (x!=NULL)
    {
        for (unsigned i=0; i<N; i++) prov.x[i]=this->x[i];
        limpar();
        prov.x[prov.N-1]=D;
        *this=prov;
    }
    else
    {
        prov.x[prov.N-1]=D;
        *this=prov;
    }
}
void ListaDVD::excluir(unsigned int id)
{
    if ((id<0) || (id>=N))
    {
        cerr << "id inválido!" << endl;
    }
    else
    {
        if ((N-1)!=0)
        {
            ListaDVD prov(N-1);
            for (unsigned i=0; i<id; i++) prov.x[i]=this->x[i];
            for (unsigned j=id; j<prov.N; j++) prov.x[j]=this->x[j+1];
            limpar();
            *this=prov;
        }
        else
        {
            limpar();
        }
    }
}
void ListaDVD::imprimir() const
{
    cout << "LISTADVD " << N << endl;
    if (N>0)
    {
        for (unsigned i=0; i<N; i++)
        {
            cout << i << ") ";
            x[i].DVD::imprimir(cout);
        }
    }
    else
    {
        if (N==0)
        {
            cerr << "Lista vazia!" << endl;
        }
        else 
        {
            cerr << "Lista de tamanho inválido!" << endl;
        }
    }
}
void ListaDVD::ler(istream& entrada)
{
    entrada >> N;
    if (N<0)
    {
        cerr << "Tamanho da lista inválido!" << endl;
    }
    else
    {
        criar(N);
        for (unsigned i=0; i<N; i++) x[i].DVD::ler(entrada);
    }
}
void ListaDVD::salvar(ostream& saida) const
{
    saida << "LISTADVD " << N << endl;
    for (unsigned i=0; i<N; i++) x[i].DVD::salvar(saida);
}



//MÉTODOS DA CLASSE Loja

void Loja::imprimir() const
{
    LL.ListaLivro::imprimir();
    LC.ListaCD::imprimir();
    LD.ListaDVD::imprimir();
}
void Loja::ler(const char* arq)
{
    ifstream  arquivo(arq);
    if (arquivo.is_open())
    {
        string prov;

        //Lendo Livros
        arquivo >> prov;
        if (prov != "LISTALIVRO")
        {
            cerr << "Arquivo com cabeçalho inválido\n";
        }
        else
        {
            LL.ListaLivro::ler(arquivo);
        }

        //Lendo CDs
        arquivo >> prov;
        if (prov != "LISTACD")
        {
            cerr << "Arquivo com cabeçalho inválido\n";
        }
        else
        {
            LC.ListaCD::ler(arquivo);
        }

        //Lendo DVDs
        arquivo >> prov;
        if (prov != "LISTADVD")
        {
            cerr << "Arquivo com cabeçalho inválido\n";
        }
        else
        {
            LD.ListaDVD::ler(arquivo);
        }

        //Fechando arquivo
        arquivo.close();
    }
    else
    {
        cerr << "Erro na abertura do arquivo \"" << arq << "\" para leitura\n";
    }
}
void Loja::salvar(const char* arq) const
{
    ofstream arquivo(arq);
    //arquivo.is_open();
    if (arquivo.is_open())
    {
        cout << "Escrevendo no arquivo " << arq << ":\n";
        LL.ListaLivro::salvar(arquivo);
        LC.ListaCD::salvar(arquivo);
        LD.ListaDVD::salvar(arquivo);
        arquivo.close();
    }
    else
    {
      cerr << "Erro na abertura do arquivo \"" << arq << "\" para escrita\n";
    }
}










