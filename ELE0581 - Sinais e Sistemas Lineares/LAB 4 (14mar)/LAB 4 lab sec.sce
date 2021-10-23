//SINAL NÃO MODULADO
t = [0:1/8000:8191/8000];
x = sin(2*%pi*100*t + 2*%pi*100*(t.*t));

p = length(x);
f = fft(x);

half = p/2; //4096
mag(1:half) = abs(f(half+1:p));
mag(half+1:p) = abs(f(1:half));

plot2d3([-4000:8000/8192:4000-1/8192], abs(mag))
xlabel('frequency in Hertz');
ylabel('amplitude');



