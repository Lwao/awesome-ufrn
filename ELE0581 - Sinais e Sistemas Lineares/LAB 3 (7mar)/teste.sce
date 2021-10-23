//PARTE DA RECONSTRUÇÃO 

function [magnitude, phase] = fourierSeries(x)
p = length(x);
f = fft(x)/p;
magnitude(1) = abs(f(1));
upper = p/2;
magnitude(2:upper) = 2*abs(f(2:upper));
magnitude(upper+1) = abs(f(upper+1));
phase(1) = atan(imag(f(1)), real(f(1)))/%pi;
phase(2:upper) = atan(imag(f(2:upper)), real(f(2:upper)))/%pi;
phase(upper+1) = atan(imag(f(upper+1)), real(f(upper+1)))/%pi;
endfunction

function z = reconstruct(magnitude, phase)
p = length(y);
for i = 1:1:(p/2)
    z(1, i) = magnitude(1, i)*cos(2*%pi*800+phase(1, i));
end
//func = sum(z);
endfunction

t = [0:1/8000:1-1/8000];
y = sin(2*%pi*800*(t.*t));

//PLOTANDO A FUNÇÃO ORIGINAL
//plot(y)

//ACHANDO OS COEFICIENTES
[mag, fas] = fourierSeries(y)

fs = 8000;

//PLOTANDO AS MAGNITUDES NO DOMÍNIO DA FREQUÊNCIA
p = length(y);
frequencies = [0:fs/p:fs/2];
//plot (frequencies, mag);
//xlabel('frequency in Hertz');
//ylabel('amplitude');

//RECONSTRUINDO A FUNÇÃO ORIGINAL
x = reconstruct(mag, fas)


//PLOTANDO A FUNÇÃO ORIGINAL
plot(x)












