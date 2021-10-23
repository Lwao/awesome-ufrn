//DADOS A DIGITAR
r = 0.001 //passo da amostragem 1000Hz
t = 0:r:%pi; //intervalos de amostragem
x = exp(-t/2); //função
T = %pi; //período fundamental
n = 10; //quantidade de 'an'

//DADOS COMPUTADOS
w = 2*%pi/T; //frequência
an = zeros(1, n); //vetor de zeros para calcular os 'n' 'an'
bn = zeros(1, n); //vetor de zeros para calcular os 'n' 'bn'


//CALCULAR 'a0'
a = 1/T*r*sum(x); 


//CALCULAR 'an'
for i = 1:1:n
    y = cos(i*w*t); //multiplicador
    z= x.*y;//multiplicando
    an(1, i) = 2/T*r*sum(z);//retornando 'an'
end

//CALCULAR bn
for i = 1:1:n
    y = sin(i*w*t); //multiplicador
    z= x.*y;//multiplicando
    bn(1, i) = 2/T*r*sum(z);//retornando 'an'
end

