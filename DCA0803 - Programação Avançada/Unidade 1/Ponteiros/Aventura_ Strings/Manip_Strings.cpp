#include <iostream>
using namespace std;
#include <string>

int main() {

char frase[50]; // uma string com tamanho fixo: 50 caracteres.
strcpy(frase,"Tipos de dados"); // copia "Tipos de dados" para frase.

char *frase1; // uma string de tamanho indefinido.
frase1 = "Curso de C++";

string frase2; // uma string construída usando a biblioteca <string>
frase2 = "Testes com strings";

cout << frase << "\n" << frase1 << "\n" << frase2 << endl;
system ("pause");
}

