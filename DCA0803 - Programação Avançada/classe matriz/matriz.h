#ifndef MATRIZ_H
#define MATRIZ_H

class matriz
{
public:
    double **M;
    unsigned m, n;

    void criar(unsigned m, unsigned n);
    void copiar(const matriz &A);
    void limpar();

    matriz(): m(0), n(0), M(NULL) {}
    explicit inline matriz(unsigned m, unsigned n) {criar(m, n);}
    inline matriz(const matriz &A) {copiar(A);}
    inline ~matriz() {limpar();}

    friend ostream &operator<<(ostream &saida, const matriz &A);
    friend istream &operator>>(istream &entrada, const matriz &A);

    inline void operator=(const matriz &A) {if (this!=&A) {limpar(); copiar(A);}}
    inline const matriz  &operator+() const {return *this;}
    matriz operator+(const matriz &A) const;
    matriz operator-(const matriz &A) const;
    matriz operator-(void);
    matriz operator*(const matriz &A) const;
};



#endif // MATRIZ_H
