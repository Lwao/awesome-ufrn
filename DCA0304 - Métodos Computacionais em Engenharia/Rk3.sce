//RK-3

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
    f1 = f(x(i-1), y(i-1));
    f2 = f((x(i-1)+(h/2)), ((y(i-1))+(h/2)*f1));
    f3 = f((x(i-1)+h), (y(i-1)+2*h*f2-h*f1));
    y(i) = y(i-1) + (h/6)*(f1+f2+f3);
end


//RESPOSTA EXATA
z = (3/4)*x^(4/3);



