//EULER (RK-1)

// y' =  x^(1/3);

function func = f(x, y)
    func = x^(1/3);
endfunction


a = 0;
b = 1;
h = 0.1;
n = (b-a)/h;
y = zeros(1, n+1);
x = zeros(1, n+1);
y(1) = 0;
x(1:n+1) = (0:n)*h;

for i = 2:n+1
    y(i) = y(i-1) + h*f(x(i-1), y(i-1));
end

plot(y)
//RESPOSTA EXATA
z = (3/4)*x^(4/3);
plot(z)

