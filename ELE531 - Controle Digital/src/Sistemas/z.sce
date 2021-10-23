z=poly(0,"z");
// discrete transfer function (ESTABLE)
a_est = 1.977724;
b_est = 0.9801987;
c_est = 4.966e-4;
d_est = 4.933e-4;

//c_est = 0.0000102;
//d_est = -0.0000003;
//a_est = 1.997956;
//b_est = 0.9979809;

H_z_est = (c_est*z+d_est)/(z^2-a_est*z+b_est);
C_z_est = (z^2-a_est*z+b_est)/((c_est*z+d_est)*(z-1));

// discrete transfer function (INSTABLE)
a_ins = 1.9512294;
b_ins = 0.9512294;
c_ins = 9.8354e-3;
d_ins = 9.67728e-3;
H_z_ins = (c_ins*z+d_ins)/(z^2-a_ins*z+b_ins);
C_z_ins = (z^2-a_ins*z+b_ins)/((c_ins*z+d_ins)*(z-1));

//h_est = 0.01; //est
h_est = 0.001; //id 
h_ins = 0.1;

//n = 1000; //est
n = 10000; //id

t_est = 0:h_est:n*h_est-h_est;
t_ins = 0:h_ins:n*h_ins-h_ins;

y_est = zeros(1,n);
y_ins = zeros(1,n);
x_est = ones(1,n); 
x_ins = ones(1,n); 
//x_est = sin(2*%pi*0.5*t_est); //estável 0.5Hz
//x_ins = sin(2*%pi*0.15*t_ins); //instável 0.15Hz


for i = 1:n-2
    y_est(i+2) = c_est*x_est(i+1) + d_est*x_est(i) + a_est*y_est(i+1) - b_est*y_est(i);
     
    y_ins(i+2) = c_ins*x_ins(i+1) + d_ins*x_ins(i) + a_ins*y_ins(i+1) - b_ins*y_ins(i);
end

