#ifndef _LOJA_H_
#define _LOJA_H_

#include <iostream>
#include <string>



using namespace std;

class Produto
{
private:
    string nome;
    unsigned preco;
    //void criar();
    void copiar(const Produto &P);
    void limpar();
public:
    inline Produto(const char *N="", unsigned P=0): nome(N), preco(P) {}                                                
    inline Produto(const Produto &P) {copiar(P);}                                                                       
    inline ~Produto() {limpar();}                                                                                       

    inline void criar(const Produto &P) {*this=P;}

    inline void operator=(const Produto &P) {if (this!=&P) {limpar(); copiar(P);}}                                      

    istream &digitar(istream &entrada);                                                                                
    ostream &imprimir(ostream &saida) const;                                                                            
    istream &ler(istream &entrada);                                                                                     
    inline ostream &salvar(ostream &saida) const {return imprimir(saida);}                                              
};

inline istream &operator>>(istream &entrada, Produto &X) {return X.digitar(entrada);}                                   
inline ostream &operator<<(ostream &saida, const Produto &X) {return X.imprimir(saida);}                                

class Livro: public Produto
{
private:
    string autor;
    //void criar();
    inline void copiar(const Livro &L) {this->autor=L.autor;}
    inline void limpar() {if (autor!="") {autor="";}}
public:
    inline Livro(const char *N="", const unsigned P=0, const char *A=""): Produto(N, P), autor(A) {}                    
    inline Livro(const Livro &L) {copiar(L);}                                                                           
    inline ~Livro() {limpar();}

    void operator=(const Livro &L);

    istream &digitar(istream &entrada);                                                                                 
    ostream &imprimir(ostream &saida) const;                                                                            
    istream &ler(istream &entrada);                                                                                     
    inline ostream &salvar(ostream &saida) const {return imprimir(saida);} 
};

inline istream &operator>>(istream &entrada, Livro &X) {return X.digitar(entrada);}                                     
inline ostream &operator<<(ostream &saida, const Livro &X) {return X.imprimir(saida);}                                  

class CD: public Produto
{
private:
    int faixas;
    //void criar();
    inline void copiar(const CD &C) {this->faixas=C.faixas;}
    inline void limpar() {if (faixas!=0) {faixas=0;}}
public:
    inline CD(const char *N="", const unsigned P=0, const unsigned F=0): Produto(N, P), faixas(F) {}                    
    inline CD(const CD &C) {copiar(C);}                                                                                 
    inline ~CD() {limpar();}

    void operator=(const CD &C);                                                                                        

    istream &digitar(istream &entrada);                                                                                 
    ostream &imprimir(ostream &saida) const;                                                                            
    istream &ler(istream &entrada);                                                                                     
    inline ostream &salvar(ostream &saida) const {return imprimir(saida);} 
};

inline istream &operator>>(istream &entrada, CD &X) {return X.digitar(entrada);}                                        
inline ostream &operator<<(ostream &saida, const CD &X) {return X.imprimir(saida);}                                     

class DVD: public Produto
{
private:
    int duracao;
    inline void copiar(const DVD &D) {this->duracao=D.duracao;}
    inline void limpar() {if (duracao!=0) {duracao=0;}}
public:
    inline DVD(const char *N="", const unsigned P=0, const unsigned D=0): Produto(N, P), duracao(D) {}                  
    inline DVD(const DVD &D) {copiar(D);}                                                                               
    inline ~DVD() {limpar();}

    void operator=(const DVD &D);                                                                                       

    istream &digitar(istream &entrada);                                                                                 
    ostream &imprimir(ostream &saida) const;                                                                            
    istream &ler(istream &entrada);                                                                                                                                                                 
    inline ostream &salvar(ostream &saida) const {return imprimir(saida);} 
};

inline istream &operator>>(istream &entrada, DVD &X) {return X.digitar(entrada);}                                       
inline ostream &operator<<(ostream &saida, const DVD &X) {return X.imprimir(saida);}                                    

class ListaLivro
{
private:
    Livro *x;
    unsigned N;
    void criar(unsigned size);
    void copiar(const ListaLivro &LL);
    void limpar();
public:
    ListaLivro(): x(NULL), N(0) {}                                                                                      
    explicit inline ListaLivro(unsigned size) {criar(size);}                                      
    inline ListaLivro(const ListaLivro &LL) {copiar(LL);}                                                 
    inline ~ListaLivro() {limpar();}                                                            

    inline void operator=(const ListaLivro &list) {if (this!=&list) {limpar(); copiar(list);}}                                                                             

    void incluir(const Livro &L);                                                                                       
    void excluir(unsigned id);                                                                                          
    void imprimir() const;                                                                                              
    void ler(istream &entrada);                    
    void salvar(ostream &saida) const;                                                              
};



class ListaCD
{
private:
    CD *x;
    unsigned N;
    void criar(unsigned size);
    void copiar(const ListaCD &LC);
    void limpar();
public:
    ListaCD(): x(NULL), N(0) {}                                                                                       
    explicit inline ListaCD(unsigned size) {criar(size);}                                      
    inline ListaCD(const ListaCD &LC) {copiar(LC);}                                                 
    inline ~ListaCD() {limpar();}                                                                                                        

    inline void operator=(const ListaCD &list) {if (this!=&list) {limpar(); copiar(list);}}                                                                               


    void incluir(const CD &C);                                                                                          
    void excluir(unsigned id);                                                                                          
    void imprimir() const;                                                                                              
    void ler(istream &entrada);                           
    void salvar(ostream &saida) const; 
};


class ListaDVD
{
private:
    DVD *x;
    unsigned N;
    void criar(unsigned size);
    void copiar(const ListaDVD &LD);
    void limpar();
public:
    ListaDVD() :x(NULL), N(0) {}                                                                                         
    explicit inline ListaDVD(unsigned size) {criar(size);}                                      
    inline ListaDVD(const ListaDVD &LD) {copiar(LD);}                                                 
    inline ~ListaDVD() {limpar();}                                                                                                        

    inline void operator=(const ListaDVD &list) {if (this!=&list) {limpar(); copiar(list);}}                                                                             


    void incluir(const DVD &D);                                                                                         
    void excluir(unsigned id);                                                                                          
    void imprimir() const;                                                                                              
    void ler(istream &entrada);                           
    void salvar(ostream &saida) const; 
};


class Loja
{
private:
    ListaLivro LL;
    ListaCD LC;
    ListaDVD LD;
public:
    inline Loja(): LL(), LC(), LD() {}                                                                                  
    inline void incluirLivro(const Livro &X) {LL.incluir(X);}                                                           
    inline void excluirLivro(unsigned id) {LL.excluir(id);}                                                             
    inline void incluirDVD(const DVD &X) {LD.incluir(X);}                                                               
    inline void excluirDVD(unsigned id) {LD.excluir(id);}                                                               
    inline void incluirCD(const CD &X) {LC.incluir(X);}                                                                 
    inline void excluirCD(unsigned id) {LC.excluir(id);}                                                                
    void imprimir() const;                                                                                             
    void ler(const char* arq);                                                                                         
    void salvar(const char* arq) const;                                                                                
};
#endif // _LOJA_H_
