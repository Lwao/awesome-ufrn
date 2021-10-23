//RUNGE-KUTA

function func = f(x, y)
    func = x^(1/3);
endfunction

function Y = rk1(a, b, h, coI)
    n = (b-a)/h;
    y = zeros(1, n+1);
    x = zeros(1, n+1);
    y(1) = coI;
    x(1:n+1) = (0:n)*h;
    
    for i = 2:n+1
        y(i) = y(i-1) + h*f(x(i-1), y(i-1));
    end
    Y = y;
endfunction

function Y = rk2(a, b, h, coI)
    n = (b-a)/h;
    y = zeros(1, n+1);
    x = zeros(1, n+1);
    y(1) = coI;
    x(1:n+1) = (0:n)*h;
    
    for i = 2:n+1
        pred = y(i-1) + h*f(x(i-1), y(i-1));
        y(i) = y(i-1) + (h/2)*(f(x(i-1), y(i-1)) + f(x(i), pred));
    end
    Y = y;
endfunction

function Y = rk3(a, b, h, coI)
    n = (b-a)/h;
    y = zeros(1, n+1);
    x = zeros(1, n+1);
    y(1) = coI;
    x(1:n+1) = (0:n)*h;
    
    for i = 2:n+1
        f1 = f(x(i-1), y(i-1));
        f2 = f((x(i-1)+(h/2)), ((y(i-1))+(h/2)*f1));
        f3 = f((x(i-1)+h), (y(i-1)+2*h*f2-h*f1));
        y(i) = y(i-1) + (h/6)*(f1+f2+f3);
    end
    Y = y;
endfunction

function Y = rk4(a, b, h, coI)
    n = (b-a)/h;
    y = zeros(1, n+1);
    x = zeros(1, n+1);
    y(1) = coI;
    x(1:n+1) = (0:n)*h;
    
    for i = 2:n+1
        f1 = f(x(i-1), y(i-1));
        f2 = f((x(i-1)+(h/2)), ((y(i-1))+(h/2)*f1));
        f3 = f((x(i-1)+(h/2)), ((y(i-1))+(h/2)*f2));
        f4 = f((x(i-1)+(h/2)), ((y(i-1))+h*f3));
        y(i) = y(i-1) + (h/6)*(f1+2*f2+2*f3+f4);
    end
    Y = y;
endfunction

coI = 0;
a = 0;
b = 1;
h = 0.1;

x = (0:((b-a)/h))*h;
x1 = rk1(a, b, h, coI);
x2 = rk2(a, b, h, coI);
x3 = rk3(a, b, h, coI);
x4 = rk4(a, b, h, coI);
y = (3/4)*x^(4/3);

plot(x1, 'b--')
plot(x2, 'b')
plot(x3, 'y--')
plot(x4, 'y')
plot(y, 'k')
