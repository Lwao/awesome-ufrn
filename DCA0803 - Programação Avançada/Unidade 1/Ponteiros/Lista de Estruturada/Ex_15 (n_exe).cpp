*/ Qual o resultado impresso após a execução do trecho de 
programa a seguir? */

int i, j, *p;
i=4;
j=7;
p=&j;
*p=9;
cout << i << " " << j << " " << *p;


/* Seria impresso:

4 9 9

- Pois i continuaria sendo 4;
- O ponteiro p aponta para o endereço de j:
	Mesmo que seja atribuido 7 para j, ao mudar no ponteiro 
	o valor do endereço que ele aponta, significa alterar o
	valor existente no endereço de j, logo, o próprio j.
- j passa a ser 9, pois *p (valor armazenado no endereçoque p aponta) 
foi alterado para 9