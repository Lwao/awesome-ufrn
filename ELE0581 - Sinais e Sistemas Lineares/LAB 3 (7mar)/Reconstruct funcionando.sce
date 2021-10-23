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

function x = reconstruct(magnitude, phase)
p = 2*(length(magnitude)-1);
n = 1:1:p;
x = zeros(1, p);
for k = 1:1:length(magnitude)
    frequency = (k-1)/p;
    x = x + magnitude(k)*cos(2*%pi*frequency*(p-1)+phase(k));
end
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
g = reconstruct(mag, fas) //erro associado

ze = zeros (1,length(g));


//PLOTANDO A FUNÇÃO ORIGINAL
plot(g)
