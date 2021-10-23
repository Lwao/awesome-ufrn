//VARIÁVEIS DE ENTRADA
h = 0.001 //período de amostragem
tm = 10 //tempo total de convolução
t = 0:h:tm //vetor tempo total
tt = -tm:h:tm //vetor tempo total SPE+SPD

//FUNÇÕES CAUSAIS
//x = exp(-t); //função fixa
//g = exp(-2*t); //função móvel

x = [1, 0, 3, 0, 5, 0, 7, 0, 9]; //função fixa
g = [0.5, 1, 0.5]; //função móvel

//TAMANHOS
n=length(tt); //tamanho SPD+SPE
p=length(x); //tamanho de g e x

//VETOR SPD+SPE E VETOR CONVOLUÇÃO
vg = zeros(1, n);
//vx = zeros(1, n); //desnecessário
c = zeros(1, p);

//VETOR SPD+SPE RECEBENDO FUNÇÃO CAUSAL 
//vx((n/2)+1:1:n+1) = x(1:1:p); //desnecessário
vg(1:1:(n/2)+1) = g(p:-1:1); 

//CONVOLUÇÃO
for i = 1:1:p-1 //varrendo o tamanho de g e x
    d = zeros(1, p); //sempre zerando o vetor
    d(1:1:i+1) = vg(p-i:1:p) //d pega a interseção de vg com vx
    c(i) = h*sum(d.*x) //convolução no ponto i (base*altura)
end

//PLOTANDO
plot(t, c)
