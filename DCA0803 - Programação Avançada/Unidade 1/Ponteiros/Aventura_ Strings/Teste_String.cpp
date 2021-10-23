#include <iostream>
#include <string>

using namespace std;

int main()
{
	string s1, s2("valor inicial"), s3[10];
	s1 = s2 + " copiado de s2";			// concatenacao e atribuicao
	cout << s1 << endl;
	for (int i=0; i<10; i++) cin >> s3[i];
	s1 += s3[0];
	cout << "tamanho de s2 é: " << s2.size() << endl;
	int sz= s2.size();
	for (int i=0; i<sz; i++) cout << s2[i] << " ";	// acesso a caracter
	cout << endl;
cout << endl;
cout << endl;

cout << "s1 : " << s1 << endl;
cout << "s3 : " << s3 << endl;
}
