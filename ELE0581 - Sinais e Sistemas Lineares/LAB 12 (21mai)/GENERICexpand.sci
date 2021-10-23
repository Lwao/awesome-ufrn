funcprot(0)
function xx = expand(x, e)    
    n = length(x); 
    xx = zeros(1, (e*(n-1))+1);
    xx(1:e:length(xx)) = x(1:1:n)
endfunction
t = 1:0.01:10;
r = exp(-t);


z = expand(r, 2)

plot(z)
