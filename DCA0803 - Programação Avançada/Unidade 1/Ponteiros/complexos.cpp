#include <iostream>
using namespace std;

/*
 Exercício - funções e struct's para números complexos

1) Usando uma struct, defina o tipo "Complexo", capaz de representar um número complexo com parte real (double) e imaginária (double)

2) Crie funções "ler" e "imprimir" para entrada/saída de números complexos. Use o tipo "Complexo".

3) Crie funções "soma" e "produto" para realizar essas operações matemáticas com números complexos. Use o tipo "Complexo".

4) Usando as funcionalidades desenvolvidas nos itens anteriores, faça um programa principal que:
- Crie quatro variáveis, C1 e C2, S e P, representando números complexos.
- Solicite que o usuário digite valores para C1 e C2.
- Calcule as variáveis S = C1+C2 e P = C1*C2.
- Imprima os valores de S e P. 
 */

struct complexo
{
    double real, imag;
};

void ler(complexo &a, complexo &b)
{
    cout << "\nInsira a parte real de c1: ";
    cin >> a.real;
    cout << "\nInsira a parte imaginária de c1: ";
    cin >> a.imag;

    cout << "\nInsira a parte real de c2: ";
    cin >> b.real;
    cout << "\nInsira a parte imaginária de c2: ";
    cin >> b.imag;
}

void imprimir (complexo imp)
{
    cout << "O complexo é: " << endl;
    cout << imp.real << " + " << imp.imag << "i" << endl;
}

complexo soma(complexo a, complexo b)
{
    complexo soma;
    
    soma.real=a.real+b.real;
    soma.imag=a.imag+b.imag;
    
    return soma;
}

complexo produto(complexo a, complexo b)
{
    complexo produto;
    int temp;
    
    produto.real=((a.real*b.real)-(a.imag*b.imag));
    produto.imag=((a.real*b.imag)+(a.imag*b.real));    
    
    return produto;    
}

int main (void)
{
    complexo c1, c2, p, s;
    
    ler(c1, c2);
    s=soma(c1, c2);
    p=produto(c1, c2);
    
    imprimir(s);
    imprimir(p);
    
    return 0;
}
