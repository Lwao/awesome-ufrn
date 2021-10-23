funcprot(0)
function L = obs(y1,y2) //C=[1,0]
    M(1,1) = y1-P(2,2);
    M(1,2) = P(1,2);
    M(2,1) = y2-P(2,2);
    M(2,2) = P(1,2);
    
    V(1) = P(1,2)*P(2,1) - (y1-P(2,2))*(y1-P(1,1));
    V(2) = P(1,2)*P(2,1) - (y2-P(2,2))*(y2-P(1,1));
    
    // M*L = V
    L = inv(M)*V;
endfunction

h = 0.01;

//planta estável discreta
a_est = 1.977724;
b_est = 0.9801987;
c_est = 4.966e-4;
d_est = 4.933e-4;
P = [a_est,1;-b_est,0];
G = [c_est;d_est];
C = [1 0];
D = 0;

// parâmetros
y0 = [0; 0];
t_end = 10;
n = t_end/h;
t = 0:h:t_end-h;
t0 = t(1);
x0 = 0;

L = obs(0.979916,0.980481); 
//L = obs(0.6,0.4); 

u = ones(1,n)
xe = zeros(2,n);
ye = zeros(1,n);
x = zeros(2,n);
y = zeros(1,n);

for k = 2:n-1
    x(:,k+1) = P*x(:,k) + u(k)*G; //MA
    y(k) = C*x(:,k)
end
rnd = rand(1,n)/20;
for i = 1:n
    if(modulo(i,2)) then
        rnd(i) = -rnd(i);    
    end
end
//plot(t,rnd)
y = y + rnd;
for k = 2:n-1
    xe(:,k+1) = (P-L*C)*xe(:,k) + u(k)*G + L*y(k); //MF
    ye(k) = C*xe(:,k)
end
//ye = y(n)/ye(n)*ye;

plot2d(t,[x(1,:)',xe(1,:)',rnd'],[1,2,3]);
e=gce();

hl=captions(e.children,['x1 - original';'x1 - observado';'Ruído']);

//plot2d(t,[x(2,:)',xe(2,:)',rnd'],[1,2,3]);
//e=gce();
//
//hl=captions(e.children,['x2 - original';'x2 - observado';'Ruído']);

//plot2d(t,[x(1,:)'-xe(1,:)',x(2,:)'-xe(2,:)'],[1,2]);
//e=gce();
//
//hl=captions(e.children,['x1 - erro';'x2 - erro']);

hl.legend_location='in_upper_right'
hl.fill_mode='on';

xlabel("Tempo (s)");
ylabel("Saída");
ylabel("Erro");







