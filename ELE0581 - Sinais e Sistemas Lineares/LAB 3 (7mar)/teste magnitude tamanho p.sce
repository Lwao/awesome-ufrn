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

t = [0:1/8000:1-1/8000];
y = sin(2*%pi*800*(t.*t));
[A, phi] = fourierSeries(y);


p = 2*(length(A-1));
n = 1:1:p;
x = zeros(1, p);
for i = 1:1:length(A)
    frequency = (i-1)/p;
    x = x + A(i)*cos(2*%pi*frequency*(p-1)+phi(i));
end

