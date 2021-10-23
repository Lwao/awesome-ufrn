funcprot(0)
function plot_H(H)
    subplot(2,1,1)
    mod = 20*log10(abs(H));
    plot(w,mod)
    //plot(w,abs(H))
    ylabel("Módulo (dB)");
    
    subplot(2,1,2)
    arc = atan(imag(H),real(H))*180/%pi;
    plot(w,arc)
    //plot(w,atan(imag(H),real(H)))
    xlabel("Velocidade angular (rad/s)");
    ylabel("Fase (°)");
    //plot(w,atan(imag(H)./real(H)))plot(w,abs(H))
endfunction


h = 0.1
w_end = 100
w = 0:h:w_end-h;
//n = w_end/h;
//w = 100;
//n = 0:0.1:100
j = %i;
//x = exp(j*w*n);
H_est = (4.966e-4*exp(j*w)+4.933e-4)./(exp(2*j*w)-1.977724*exp(j*w)+0.9801987);
H_ins = (9.8354e-3*exp(j*w)+9.67728e-3)./(exp(2*j*w)-1.9512294*exp(j*w)+0.9512294);
H = (exp(j*w)+0.3)./(exp(2*j*w)-0.2*exp(j*w)+0.2); 

plot_H(H_ins)





//plot(n,atan(imag(y)./real(y)))
//plot(n,abs(y))
