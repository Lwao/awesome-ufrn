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
//P = [exp(-h)*(sin(2*sqrt(6)*h)+2*sqrt(6)*cos(2*sqrt(6)*h))/(2*sqrt(6)), exp(-h)*sin(2*sqrt(6)*h)/(2*sqrt(6)); -25*exp(-h)*sin(2*sqrt(6)*h)/(2*sqrt(6)), exp(-h)*(2*sqrt(6)*cos(2*sqrt(6)*h)-sin(2*sqrt(6)*h))/(2*sqrt(6))];
//G = [(1/30)*exp(-h)*(12*exp(h)-sqrt(6)*sin(2*sqrt(6)*h)-12*cos(2*sqrt(6)*h)); 5*exp(-h)*sin(2*sqrt(6)*h)/sqrt(6)];
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

u = ones(1,n)
xe = zeros(2,n);
ye = zeros(1,n);
x = zeros(2,n);
y = zeros(1,n);
//xf = zeros(2,n);
//yf = zeros(1,n);

for k = 1:n-1
    x(:,k+1) = P*x(:,k) + u(k)*G; //MA
    y(k) = C*x(:,k)
end
//for k = 1:n
//    xf(:,k+1) = P*xf(:,k) + (u(k)-[21,0.22]*xf(k))*G; //MF
//    yf(k) = C*xf(:,k)
//end
for k = 1:n-1
    xe(:,k+1) = P*xe(:,k) + u(k)*G + L*(y(k)-ye(k)); //MF
    ye(k) = C*xe(:,k)
end
ye = y(n)/ye(n)*ye;

plot(t,xe(1,:),x(1,:))
plot(t,xe(2,:),x(2,:))




