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
p = 2*(length(magnitude-1));
n = 1:1:p;
x = zeros(1, p);
for k = 1:1:length(magnitude)
    frequency = (k-1)/p;
    x = x + magnitude(k)*cos(2*%pi*frequency*(p-1)+phase(k));
end
endfunction


t = [0:1/8000:1-1/8000];
y = sin(2*%pi*800*(t.*t));
[A, phi] = fourierSeries(y);
yp = reconstruct(A, phi);

e = y-yp;
plot(e)

//e = zeros(1, 8000);
//for k = 1:1:8000
  //  e(k)=y(k)-yp(k);
//end

//plot(y)
//plot(e)

//e=y.-yp;
//plot(e);
//title(’error in reconstruction’);
