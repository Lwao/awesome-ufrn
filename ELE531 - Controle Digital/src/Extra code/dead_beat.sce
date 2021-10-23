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
for i = 3:n-1
    e_est(i) = x_est(i)-y_est(i-1) 
    
    u_est(i) = (e_est(i)-a_est*e_est(i-1)+b_est*e_est(i-2) - d_est*u_est(i)+c_est*u_est(i-1)+d_est*u_est(i-2))/c_est;
    
    y_est(i) = c_est*u_est(i-1) + d_est*u_est(i-2) + a_est*y_est(i-1) - b_est*y_est(i-2);

   
   
    
//    u_ins(i+2) = (e_ins(i+2)-a_ins*e_ins(i+1)+b_ins*e_ins(i)-(d_ins-c_ins)*u_ins(i+1)+d_ins*u_ins(i))/c_ins;
//    y_ins(i+2) = c_ins*u_ins(i+1) + d_ins*u_ins(i) + a_ins*y_ins(i+1) - b_ins*y_ins(i);
//    e_ins(i+2) = x_ins(i+2)-y_ins(i+2);
//    
//    
//    u_est(i+2) = (e_est(i+2)-a_est*e_est(i+1)+b_est*e_est(i)-(d_est-c_est)*u_est(i+1)+d_est*u_est(i))/c_est;
//    y_est(i+2) = c_est*u_est(i+1) + d_est*u_est(i) + a_est*y_est(i+1) - b_est*y_est(i);
//    e_est(i+2) = x_est(i+2)-y_est(i+2);
end

//plot(t_ins,y_ins)
plot(t_est,y_est)
