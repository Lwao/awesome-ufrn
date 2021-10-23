/*
     ma1*z + ma2
-------------------   PLANTA
 z^2 + ma3*z + ma4

 K(s + a)(s+b)   
---------------  CONTROLADOR
      s
  
    mf1*z^2 + mf2*z + mf3
--------------------------------   P+C EM MF
mf4*z^3 + mf5*z^2 + mf6*z + mf7
*/
z=poly(0,"z");

h = 0.01;

ma1 = 4.966e-4;
ma2 = 4.933e-4;
ma3 = -1.977724;
ma4 = 0.9801987;

K = 16.4327/2;
a = 4.39792;
b = 4.39792;
c = 2/h;

MA = (ma1*z + ma2)/(z^2 + ma3*z + ma4);
C = (K*(a+c)*(b+c)*(z+((a-c)/(a+c)))*(z+((b-c)/(b+c))))/(c*z*(z-1));

N_H = ma1*z + ma2;
D_H = z^2 + ma3*z + ma4;
N_C = K*(a+c)*(b+c)*(z+((a-c)/(a+c)))*(z+((b-c)/(b+c)));
D_C = c*z*(z-1);

N_MF = N_C*N_H;
D_MF = D_C*D_H + N_MF;

mf1 = coeff(N_MF,3);
mf2 = coeff(N_MF,2);
mf3 = coeff(N_MF,1);
mf4 = coeff(N_MF,0);
mf5 = coeff(D_MF,4);
mf6 = coeff(D_MF,3);
mf7 = coeff(D_MF,2);
mf8 = coeff(D_MF,1);
mf9 = coeff(D_MF,0);

t_end = 2.5;
n = t_end/h;
t = 0:h:n*h-h;

y = zeros(1,n);
x = ones(1,n);
dead_beat(2:n) = 1;

for i = 1:n-4
    y(i+4) = ((mf1*x(i+3)+mf2*x(i+2)+mf3*x(i+1)+mf4*x(i))-(mf6*y(i+3)+mf7*y(i+2)+mf8*y(i+1)+mf9*y(i)))/mf5;

end


plot2d2(t,y)
plot2d2(t,dead_beat);
xlabel("Tempo (s)");
ylabel("Saída");



