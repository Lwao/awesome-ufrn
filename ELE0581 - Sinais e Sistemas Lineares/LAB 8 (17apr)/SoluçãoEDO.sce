funcprot(0)
function Y = f(t, z)    
    Y(1) = -2*z(2);
    Y(2) = z(1) - 3*z(2) + 10*exp(-3*t);
endfunction

//condições iniciais
z10 = -5;
z20 = 0;

//parâmetros da ode
y0 = [z10;z20];
t0 = 0;
t = 0:0.001:1;

//solução
solution = ode(y0, t0, t, f);

//plotando
z1 = solution(1,:)
subplot(3, 1, 1)
plot(t, z1)

z2 = solution(2,:)
subplot(3, 1, 2)
plot(t, z2)

y = -10*exp(-t)+25*exp(-2*t)-15*exp(-3*t);
subplot(3, 1, 3)
plot(t, y)
