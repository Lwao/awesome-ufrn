/*
     ma1*z + ma2
-------------------   PLANTA
 z^2 + ma3*z + ma4

 K (s+a)  CONTROLADOR
  
    mf1*z^2 + mf2*z + mf3
--------------------------------   P+C EM MF
mf4*z^3 + mf5*z^2 + mf6*z + mf7
*/
z=poly(0,"z");

h = 0.1;

ma1 = 9.8354e-3;
ma2 = 9.67728e-3;
ma3 = -1.9512294;
ma4 = 0.9512294;

K = 15.5014;
a = 8.4118*15.5014/2;
//K = 8.1511;
//a = K*2.3282;
c = 2/h;

MA = (ma1*z + ma2)/(z^2 + ma3*z + ma4);
C = K*(a+c)*((z+((a-c)/(a+c)))/(z+1));

N_H = ma1*z + ma2;
D_H = z^2 + ma3*z + ma4;
//N_C = z*K/h - K/h + a;
//D_C = 1;
N_C = (K*((z-1)/h)+a);
D_C = 1;

N_MF = N_C*N_H;
D_MF = D_C*D_H + N_MF;

mf1 = coeff(N_MF,2);
mf2 = coeff(N_MF,1);
mf3 = coeff(N_MF,0);
//mf4 = coeff(D_MF,3);
mf5 = coeff(D_MF,2);
mf6 = coeff(D_MF,1);
mf7 = coeff(D_MF,0);

t_end = 2;
n = t_end/h;
t = 0:h:n*h-h;

y = zeros(1,n);
x = ones(1,n);
dead_beat(2:n) = 1;

for i = 1:n-2
    y(i+2) = ((mf1*x(i+2)+mf2*x(i+1)+mf3*x(i))-(mf6*y(i+1)+mf7*y(i)))/mf5;
end

plot2d2(t,y)
plot2d2(t,dead_beat);
xlabel("Tempo (s)");
ylabel("Saída");


