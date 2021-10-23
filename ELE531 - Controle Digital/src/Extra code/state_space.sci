funcprot(0)

function xdot_P = plant(t, x)    
    // planta
    time = linspace(0,10,1001);
    w = 2*%pi*100;
    u = 1;
    //u = sin(w*time);

    xdot_P = A*x+B*u;
endfunction

function y = response(n, u)    
    accA = 0;
    if(x0~=0) then
        accA = C*P^(n)*x0;
    end
    
    accB = 0;
    for i = 0:n-1
        accB = accB + P^(n-i-1)*G*u(i+1);
    end
    accB = C*accB + D*u(n);
    
    y = accA + accB;
endfunction

//planta estável contínua
A = [0 1; -2 -3];
B = [0; 2];
C = [1 0];
D = 0;

h= 0.3;

//planta estável discreta
P = [exp(-2*h)*(2*exp(h)-1), exp(-2*h)*(exp(h)-1); 2*exp(-2*h)*(exp(h)-1),-exp(-2*h)*(exp(h)-2)];
G = [exp(-2*h)*(exp(h)-1)^2;2*exp(-2*h)*(exp(h)-1)];
C = [1 0];
D = 0;

// dados
t_end = 1;
granularity = 1000;
x0 = 0;
y0 = [0; 0];
tc = linspace(0,t_end,granularity);
td = 0:h:t_end-h;
t0 = t(1);

u = ones(1,length(td));

//solução contínua
yc = ode(y0, t0, tc, plant);

//solução discreta
yd = zeros(t_end/h,1)
for i = 1:t_end/h
    yd(i) = response(i, u);
end


//plotando
plot(td,yd','b')
plot(tc,yc(1,:),'k')



