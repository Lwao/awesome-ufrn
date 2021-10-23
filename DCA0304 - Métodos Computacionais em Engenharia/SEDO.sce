// y'' = 2*(exp(2*x)-y^2)^(1/2)

//DADOS ENTRADA
h = 0.1;
a = 0;
b = 1;
//CÁLCULOS INICIAIS
n = (b-a)/h;
x = zeros(1, n+1);
x1 = zeros(1, n+1);
x2 = zeros(1, n+1);
x1(1) = 0;
x2(1) = 1;
x(2:n+1) = (1:n)*h; 
//FUNÇÕES
function value = f(x, x1, x2)
    value = x2;
endfunction
function value = g(x, x1, x2)
    value = 2*(exp(2*x)-x1^2)^(1/2);
endfunction

for i = 1:n+1
    x1(i+1) = x1(i) + h*f(x(i), x1(i), x2(i));
    x2(i+1) = x2(i) + h*g(x(i), x1(i), x2(i));
end
