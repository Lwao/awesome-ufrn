funcprot(0)

function xdot_P = plant(t, x)    
    // planta
    //w = 2*%pi*100;
    //u = 1;
    u = sin(2*%pi*0.15*t);

    xdot_P = A*x+B*u;
endfunction

function y = response(n)    
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

//planta instável contínua
A = [0 1; 0 -0.5];
B = [0; 2];
C = [1 0];
D = 0;

h = 0.1;

//planta estável discreta
//P = [1, 1.92308*(1-exp(-0.52*h)); 0, exp(-0.52*h)];
//G = [3.84616*h + 7.39646*exp(-0.52*h) - 7.39646; 3.84615*(1-exp(-0.52*h))];
P = [1, 2*(1-exp(-0.5*h)); 0, exp(-0.5*h)];
G = [4*h + 8*exp(-0.5*h) - 8; 4*(1-exp(-0.5*h))];
C = [1 0];
D = 0;

//dados discreto
t_end = 10;
n = t_end/h;
g = 100;
//u = ones(1,n);
x0 = 0;

//dados contínuo
y0 = [0; 0];
//tc = linspace(0,t_end,g);
//td = linspace(0,t_end,n);
tc = 0:h/100:t_end-h/100;
td = 0:h:t_end-h;
u = ones(1,n);
//u = sin(2*%pi*0.15*td);
t0 = tc(1);


//solução contínua
yc = ode(y0, t0, tc, plant);

//solução discreta
yd = zeros(n,1)
for i = 1:n
    yd(i) = response(i);
end

plot(td,yd','b')
plot(tc,yc(1,:),'k')
xlabel("Tempo (s)");
ylabel("Saída");

////plotando
//set(gca(),"auto_clear","off");
//plot2d(t,[yc(1,:)',yd],[1,2]);
//e=gce();
//hl=captions(e.children,['Continuous';'Discrete']);
//hl=captions(e.children,['Continuous';'Discrete'],'in_upper_right');
//hl.legend_location='in_upper_right'
//hl.fill_mode='on';


