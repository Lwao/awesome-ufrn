#ifndef _POLY_H_
#define _POLY_H_

#include <iostream>

using namespace std;

//Fix-it: Falha de segmentação (imagem do núcleo gravada)

class Poly
{
    private:
        unsigned W;
        double *c;
        void criar(unsigned grau);
        void copiar(const Poly &P);
        void limpar();
        void dimGrau();
        //void dividir (const Poly &Den, Poly &Q, Poly &R) const;
        //void reduzir();
        
    public:
        Poly(): W(0), c(NULL) {}                                                                //Default
        explicit inline Poly(unsigned grau) {criar(grau);}                                      //Específico
        inline Poly(const Poly &P) {copiar(P);}                                                 //Cópia
        inline ~Poly() {limpar();}                                                              //Destrutor
        
        
        
        inline unsigned getGrau(void) const {return W;}                                         //ok
        double getCoef(unsigned g) const;                                                       //ok
        void setCoef(unsigned g, double Coef);                                                  //ok
                                                                                                //ok
        
        
        friend ostream &operator<<(ostream &saida, const Poly &P);                              //ok
        friend istream &operator>>(istream &entrada, const Poly &P);                            //ok
        // friend double operator^(double &B, const unsigned &integer);                         
        
        
        inline void operator=(const Poly &P) {if (this!=&P) {limpar(); copiar(P);}} //Igualar   //ok
        inline const Poly &operator+() const {return *this;}                                    //ok
        Poly operator+(const Poly &P) const;  // Soma                                           //ok
        Poly operator-(const Poly &P) const;  // Subtração                                      //ok
        Poly operator-(void) const;           // Inverter o sinal dos coeficientes              //ok
        //Poly operator*(const double &x, const unsigned gQ) const;  // Multiplicação por double                     //ok
        Poly operator*(const Poly &P) const;  // Multiplicação                                  //ok
        Poly operator/(const Poly &D) const;  // Divisão                                            //problema na divisão de zeros
        Poly operator%(const Poly &den) const;  // Resto (divisão)                                    //segmentação
        double operator()(double x) const;                                                      //ok
        
        //Make file
        
        // double potencia(double base, unsigned integer) const;
        // double atribuir(double atrib) const;                                                 
        
};
#endif // _POLY_H_

    
    
