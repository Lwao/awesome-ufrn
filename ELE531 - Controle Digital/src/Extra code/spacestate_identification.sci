funcprot(0)

function xdot_P = plant(t, x)    
    // planta
    //time = linspace(0,10,1001);

    h_rand = 0.01;
    n_rand = t_end/h_rand;
    rand_coef = rand(1,n_rand);
    u = [];
    for i = 0:(n/n_rand)-1
        u(i*n_rand+1:(i+1)*n_rand) = rand_coef(i+1);
    end
    r = u'.*(t./t);
    //u = 1;
    //u = sin(2*%pi*0.5*t);
    xdot_P = A*x+B*r;
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

//dados discreto
t_end = 10;
h = 0.01/10;
n = t_end/h;
//u = ones(1,n);
//u = sin(2*%pi*100*tc);


P = zeros(2,2)
P(1,1) = exp(-h)*(sin(2*sqrt(6)*h)+2*sqrt(6)*cos(2*sqrt(6)*h))/(2*sqrt(6));
P(1,2) = exp(-h)*sin(2*sqrt(6)*h)/(2*sqrt(6));
P(2,1) = -25*exp(-h)*sin(2*sqrt(6)*h)/(2*sqrt(6));
P(2,2) = exp(-h)*(2*sqrt(6)*cos(2*sqrt(6)*h)-sin(2*sqrt(6)*h))/(2*sqrt(6));
G = [(1/30)*exp(-h)*(12*exp(h)-sqrt(6)*sin(2*sqrt(6)*h)-12*cos(2*sqrt(6)*h));
    5*exp(-h)*sin(2*sqrt(6)*h)/sqrt(6)];

//dados contínuo
y0 = [0; 0];
tc = 0:h:t_end-h;
t0 = tc(1);
x0 = 0;

// random input
h_rand = 0.01;
n_rand = t_end/h_rand;
rand_coef = rand(1,n_rand);
u = [];
for i = 0:(n/n_rand)-1
    u(i*n_rand+1:(i+1)*n_rand) = rand_coef(i+1);
end

//solução contínua
//yc = ode(y0, t0, tc, plant);

yc = zeros(n,1)
for i = 1:n
    yc(i) = response(i);
end


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


