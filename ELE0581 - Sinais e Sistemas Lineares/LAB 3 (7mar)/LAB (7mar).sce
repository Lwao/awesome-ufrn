//t = [0:1/8000:1-1/8000]; //8000 amostras
//x = sin(2*%pi*800*t); //800 Hz

//ACHANDO OS COEFICIENTES

function [magnitude, phase] = fourierSeries(x)
p = length(x);//tamanho do vetor
f = fft(x)/p;//coeficientes (complexos)
magnitude(1) = abs(f(1));//mag do coef 1
upper = p/2;//metade 
magnitude(2:upper) = 2*abs(f(2:upper));//mag do coef 2 à metade
magnitude(upper+1) = abs(f(upper+1));//mag do coef metade +1
phase(1) = atan(imag(f(1)), real(f(1)));
phase(2:upper) = atan(imag(f(2:upper)), real(f(2:upper)));
phase(upper+1) = atan(imag(f(upper+1)), real(f(upper+1)));
endfunction

//[A, phi] = fourierSeries(x) //pegando vetor de mag e phase de x

//fs = 8000;//frequência de amostragem

//p = length(x);
//frequencies = [0:fs/p:fs/2];
//plot (frequencies, A);
//xlabel('frequency in Hertz');
//ylabel('amplitude');


function x = reconstruct(magnitude, phase)
p = 2*(length(magnitude)-1);
w = 2*%pi/p;

x = zeros(1,p);

for n = 0:1:p-1 //coeficientes dos Dn
    for k = 0:1:length(magnitude)-1 
        x(n+1) = x(n+1) + magnitude(k+1) * cos(k*w*n + phase(k+1));
    end
end
endfunction

t = [0:1/8000:1-1/8000]
y = sin(2*%pi*800*(t.*t));


[mag, fas] = fourierSeries(y)
g=reconstruct(mag, fas);
z=y-g;
//plot(y-reconstruct(mag, fas))
subplot(3,1,1), plot([1:1:1000], y(1:1:1000))
subplot(3,1,2), plot([1:1:1000], z(1:1:1000))
subplot(3,1,3), plot([1:1:1000], g(1:1:1000))


