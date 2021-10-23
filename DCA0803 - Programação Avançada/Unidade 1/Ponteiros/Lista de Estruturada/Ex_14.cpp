/* Qual o erro no trecho de programa a seguir?
 esse trecho de programa está errado*/

int x, *p;
x=10;
*p = x;
cout << *p;

/*O ponteiro para inteiros criado na linha 3 
não pode ser atribuido da for que acontece na linha 5,
pois um ponteiro deve armazenar um endereço cuja uma variável
está armazenada. No caso, se o ponteiro fosse apontar para o
endereço de memória que x está armazenado, a sintaxe correta seria:
	p=&x;
*/