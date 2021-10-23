funcprot(0)
function y = intlin(x, e)    
    ker = [0.5, 1, 0.5];
    z = conv(x, ker);
    n = length(z);
    y = zeros(1, n-2);
    y(1:1:n-2) = z(2:1:n-1);
endfunction

