funcprot(0)

function xdot_P = plant(t, x)    
    // planta
    //time = linspace(0,10,1001);
    u = 1;
    //u = sin(2*%pi*0.5*t);
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

//planta estável contínua
A = [0 1; -25 -2];
B = [0; 10];
C = [1 0];
D = 0;

h = 0.01;

//planta estável discreta
P = zeros(2,2)
P(1,1) = exp(-h)*(sin(2*sqrt(6)*h)+2*sqrt(6)*cos(2*sqrt(6)*h))/(2*sqrt(6));
P(1,2) = exp(-h)*sin(2*sqrt(6)*h)/(2*sqrt(6));
P(2,1) = -25*exp(-h)*sin(2*sqrt(6)*h)/(2*sqrt(6));
P(2,2) = exp(-h)*(2*sqrt(6)*cos(2*sqrt(6)*h)-sin(2*sqrt(6)*h))/(2*sqrt(6));
G = [(1/30)*exp(-h)*(12*exp(h)-sqrt(6)*sin(2*sqrt(6)*h)-12*cos(2*sqrt(6)*h));
    5*exp(-h)*sin(2*sqrt(6)*h)/sqrt(6)];
C = [1 0];
D = 0;

//dados discreto
t_end = 10;
n = t_end/h;
g = 10000;
//u = ones(1,n);
x0 = 0;

//dados contínuo
y0 = [0; 0];
//tc = linspace(0,t_end,t_end/0.001);
//td = linspace(0,t_end,n);
tc = 0:h/10:t_end-h/10;
td = 0:h:t_end-h;
u = ones(1,n);
//u = sin(2*%pi*0.5*td);
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

//plotando
//set(gca(),"auto_clear","off");
//plot2d(t,[yc(1,:)',yd],[1,2]);
//e=gce();
//hl=captions(e.children,['Continuous';'Discrete']);
//hl=captions(e.children,['Continuous';'Discrete'],'in_upper_right');
//hl.legend_location='in_upper_right'
//hl.fill_mode='on';


