//VARIÁVEIS DE ENTRADA
h = 0.001 //período de amostragem
tm = 10 //tempo total de convolução
tx = 0:h:3; 
tg = -1:h:1; //vetor tempo total
tc = -1:h:3;
tt = -tm:h:tm //vetor tempo total SPE+SPD
n = length(tg);
lc = length(tc);
vx = length(tx);
ttt = -1:h:4;


//FUNÇÕES
x = tx/3; //função fixa
g = ones(1, n); //função móvel
gg = length(g);

//VETOR SPD+SPE E VETOR CONVOLUÇÃO
c = zeros(1, lc);
p = length(x)+length(g);

//(n/2)+1 ponto 0

a =length(x)-length(g):1:vx

//CONVOLUÇÃO
for i = 1:1:n-1 //varrendo o tamanho de g + x
    d = zeros(1, length(x)); //sempre zerando o vetor
    d(1:1:i+1) = g(gg-i:1:gg); //d pega a interseção de vg com vx
    c(i+2) = h*sum(d.*x); //convolução no ponto i (base*altura)
end

// c com 0 ou 2

for i = 1:1:length(x)-length(g)-1 //varrendo o tamanho de g + x
    d = zeros(1, length(x)); //sempre zerando o vetor
    d(1+i:1:gg+i) = g(1); //d pega a interseção de vg com vx
    c(n+i+1) = h*sum(d.*x); //convolução no ponto i (base*altura)
end

// c com 0 ou 1

for i = 1:1:n-1 //varrendo o tamanho de g + x
    d = zeros(1, length(x)); //sempre zerando o vetor
    d(1+length(x)-length(g)+i:1:vx) = g(1); //d pega a interseção de vg com vx
    c(vx+i) = h*sum(d.*x); //convolução no ponto i (base*altura)
end

//c com -1 ou 0



//PLOTANDO
plot(ttt, c)
