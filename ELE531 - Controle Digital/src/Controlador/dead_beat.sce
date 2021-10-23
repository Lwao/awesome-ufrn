z=poly(0,"z");
// discrete transfer function (ESTABLE)
a_est = 1.977724;
b_est = 0.9801987;
c_est = 4.966e-4;
d_est = 4.933e-4;
H_z_est = (c_est*z+d_est)/(z^2-a_est*z+b_est);
C_z_est = (z^2-a_est*z+b_est)/((c_est*z+d_est)*(z-1));

// discrete transfer function (INSTABLE)
a_ins = 1.9512294;
b_ins = 0.9512294;
c_ins = 9.8354e-3;
d_ins = 9.67728e-3;
H_z_ins = (c_ins*z+d_ins)/(z^2-a_ins*z+b_ins);
C_z_ins = (z^2-a_ins*z+b_ins)/((c_ins*z+d_ins)*(z-1));

h_est = 0.01 ;
h_ins = 0.1;

n = 1000;

t_est = 0:h_est:n*h_est-h_est;
t_ins = 0:h_ins:n*h_ins-h_ins;

y_est = zeros(1,n);
y_ins = zeros(1,n);
//e_est = zeros(1,n);
//e_ins = zeros(1,n);
u_est = zeros(1,n);
u_ins = zeros(1,n);
x_est = ones(1,n); 
x_ins = ones(1,n); 
//x_est = sin(2*%pi*0.5*t_est); //estável 0.5Hz
//x_ins = sin(2*%pi*0.15*t_ins); //instável 0.15Hz

e_est(1) = x_est(1)-y_est(1); //condições iniciais
e_est(2) = x_est(2)-y_est(2); //condições iniciais
e_est(3) = x_est(3)-y_est(3); //condições iniciais
e_ins(1) = x_ins(1)-y_ins(1); //condições iniciais
e_ins(2) = x_ins(2)-y_ins(2); //condições iniciais
e_ins(3) = x_ins(3)-y_ins(3); //condições iniciais

t_end = 10;
h = 0.01;
n = t_end/h;
t = 0:h:n*h-h;
y = zeros(1,n);
u = zeros(1,n);
e = zeros(1,n);
r = ones(1,n);
yb = zeros(1,n);
a = 1.977724;
b = 0.9801987;
c = 4.966e-4;
d = 4.933e-4;
e(1) = r(1);
e(2) = r(2)-y(1);
for i = 3:n
//    e_est(i) = x_est(i)-y_est(i-1) 
//    
//    u_est(i) = (e_est(i)-a_est*e_est(i-1)+b_est*e_est(i-2) - d_est*u_est(i)+c_est*u_est(i-1)+d_est*u_est(i-2))/c_est;
//    
//    y_est(i) = c_est*u_est(i-1) + d_est*u_est(i-2) + a_est*y_est(i-1) - b_est*y_est(i-2);
    
   e(i) = r(i) - y(i-1);
   u(i) = (e(i)-a*e(i-1)+b*e(i-2)-(d-c)*u(i-1)+d*u(i-2))/c;
   yb(i) = c*u(i-1)+d*u(i-2)+a*yb(i-1)-b*yb(i-2);

   //e(i) = r(i) - y(i-1);
   //u(i-1) = (e(i)-a_est*e(i-1)+b_est*e(i-2)-d_est*u(i-2))/c_est;
   y(i) = c*r(i-1)+d*r(i-2)+a*y(i-1)-b*y(i-2);
   
end

//plot(t_ins,y_ins)
//plot(t,y)
plot(t,yb)
//plot(t,u)

//0.000466*z^3+0.0004933*z^2-0.0004966*z-0.0004933



//plot2d(t,[x(1,:)'-xe(1,:)',x(2,:)'-xe(2,:)'],[1,2]);
//e=gce();
//
//hl=captions(e.children,['x1 - erro';'x2 - erro']);

//hl.legend_location='in_upper_right'
//hl.fill_mode='on';
//
//xlabel("Tempo (s)");
//ylabel("Saída");
//ylabel("Erro");


