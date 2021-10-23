funcprot(0)
function Y = f(t, z)    
    Y(1) = z(2);
    Y(2) = -26.67*z(1) + 0.76*z(2) - 2.92*abs(z(1))*z(2) + z(3);
    Y(3) = -(1/0.67)*z(3)+(1/0.67)*1;
    
    //ENTRADA = 1 = u(t)
endfunction

//condições iniciais
fi = 1/2;
pe = 0;
de = 0;

//parâmetros da ode
y0 = [fi;pe;de];
t0 = 0;
t = 0:0.001:10;

//solução
solution = ode(y0, t0, t, f);

//plotando
fi_sol = solution(1,:)
subplot(2, 1, 1)
plot(t, fi_sol)

pe_sol = solution(2,:)
subplot(2, 1, 2)
plot(fi_sol, pe_sol)



