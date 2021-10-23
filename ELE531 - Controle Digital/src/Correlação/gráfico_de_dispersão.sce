// dados
//x = rand(1, 200);
//y = rand(1, 200);
//x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
//y = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
//y = [1.2, 2.1, 3.2, 4.2, 10.43, 6.12, 7.23, 8.23, 9.123, 10.2]

function r = corr(x, y)
    xu = sum(x)/length(x);
    yu = sum(y)/length(y);
    n = length(x);
    acc1 = 0;
    acc2 = 0;
    acc3 = 0;
    for i = 1:n 
        acc1 = acc1 + (x(i)-xu)*(y(i)-yu);
        acc2 = acc2 + (x(i)-xu)^2;
        acc3 = acc3 + (y(i)-yu)^2;
    end
    r = acc1/(sqrt(acc2*acc3));
endfunction
function [b0, b1] = reg_lin(x, y)
    acc1 = 0;
    acc2 = 0;
    acc3 = 0;
    acc4 = 0;
    n = length(x);
    acc2 = sum(x)*sum(y)/n;
    acc3 = sum(x)^2/n
    for i = 1:n
        acc1 = acc1 + x(i)*y(i) - acc2;
    end
    for i = 1:n
        acc4 = acc4 + x(i)^2 - acc3;
    end
    b1 = acc1/acc4
    b0 = sum(y)/n - b1*sum(x)/n;
endfunction

// especificar tamanho dos pontos
s = 1;

r = corr(x,y);
[b0, b1] = reg_lin(x,y);
n = gsort(x, 'g', 'i')
z = b0 + b1*n;
// preenchendo as marcações
//scatter(x, y, s, "fill");

// sem preencher as marcações
//scatter(x, y, s);

// com x ao invés de círculos
scatter(x, y, s, "x");
plot(n, z)
xlabel("Saída identificada");
ylabel("Saída original");
xstring(1,30,["r = " string(r)],0,0)
e = get("hdl")
e.font_size=4;

