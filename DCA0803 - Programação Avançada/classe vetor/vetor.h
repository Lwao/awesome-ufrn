#ifndef MATRIZ_V
#define MATRIZ_V

class vetor
{
private:
    double *M;
    unsigned m;

    void criar(unsigned m);
    void copiar(const vetor &A);
    void limpar();
public:
    vetor(): m(0), M(NULL) {}
    explicit inline vetor(unsigned m) {criar(m);}
    inline vetor(const vetor &A) {copiar(A);}
    inline ~vetor() {limpar();}

    friend ostream &operator<<(ostream &saida, const vetor &A);
    friend istream &operator>>(istream &entrada, const vetor &A);

    inline void operator=(const vetor &A) {if (this!=&A) {limpar(); copiar(A);}}
    inline const vetor  &operator+() const {return *this;}
    vetor operator+(const vetor &A) const;
    vetor operator-(const vetor &A) const;
    vetor operator-(void);
    vetor operator*(const vetor &A) const;
};



#endif // MATRIZ_V
