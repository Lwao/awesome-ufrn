funcprot(0)
function Y = f(t, z)    
    Y(1) = (10-z(1))/3;
    //Y(2) = z(1) - 3*z(2) + 10*exp(-3*t);
endfunction

//condições iniciais
z10 = 0;
//z20 = 0;

//parâmetros da ode
//y0 = [z10;z20];
y0 = [z10];
t0 = 0;
t = 0:0.01:10;

//solução
solution = ode(y0, t0, t, f);

//plotando
z1 = solution(1,:)
plot2d3(t, z1)


