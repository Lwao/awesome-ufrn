//SINAL MODULADO
t = [0:1/8000:8191/8000];
y = sin(2*%pi*100*t + 2*%pi*100*(t.*t))
p = length(y);
f = fft(y);

half = p/2; //4096
mag(1:half) = abs(f(half+1:p));
mag(half+1:p) = abs(f(1:half));

//plot2d3([-4000:8000/8192:4000-1/8192], abs(mag))

//Se multiplicar novamente por .*cos(2*%pi*1000*t),
//Obterá o sinal original no meio e o modulado

h=iir(10, 'lp', 'butt', 0.5, [0 0]); //4000/8000
B=coeff(h(2)); 
B=B(11:-1:1);
A=coeff(h(3));
A=A(11:-1:1);
[hzm, fr]=frmag(B, A, 512);


g = filter(B, A, mag);
plot2d3([-4000:8000/8192:4000-1/8192], g)
//plot2d3([-4000:8000/8192:4000-1/8192], y)
