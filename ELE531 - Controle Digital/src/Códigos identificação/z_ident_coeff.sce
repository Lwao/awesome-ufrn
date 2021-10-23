z=poly(0,"z");
// discrete transfer function (ESTABLE)
// original
c_est = 4.966e-4;
d_est = 4.933e-4;
a_est = 1.977724;
b_est = 0.9801987;
// identificado
//c_est = 0.0008145;
//d_est = 0.0001605;
//a_est = 1.9768486;
//b_est = 0.9792891;

// discrete transfer function (INSTABLE)
// original
c_ins = 9.8354e-3;
d_ins = 9.67728e-3;
a_ins = 1.9512294;
b_ins = 0.9512294;
c_ins = c(1);
d_ins = c(2);
a_ins = -c(3);
b_ins = c(4);
// identificado
//c_ins = 0.0000024;
//d_ins = -0.0000004;
//a_ins = 1.9994965;
//b_ins = 0.9994965;


h_est = 0.01; //est
//h_est = 0.001; //id est
h_ins = 0.1; //ins
//h_ins = 0.001; //id ins

//n = 1000; //est
//n = 10000; //id_est
n = 1000; //ins
//n = 100; //id_ins

t_est = 0:h_est:n*h_est-h_est;
t_ins = 0:h_ins:n*h_ins-h_ins;

y_est = zeros(1,n);
y_ins = zeros(1,n);
x_est = ones(1,n); 
x_ins = ones(1,n); 

for i = 1:n-2
    y_est(i+2) = c_est*x_est(i+1) + d_est*x_est(i) + a_est*y_est(i+1) - b_est*y_est(i);
    
     
    y_ins(i+2) = c_ins*x_ins(i+1) + d_ins*x_ins(i) + a_ins*y_ins(i+1) - b_ins*y_ins(i);
end

//plot(t2,y2,'k')
//plot(t1,y1,'b')
//xlabel("Tempo (s)");
//ylabel("Saída");

