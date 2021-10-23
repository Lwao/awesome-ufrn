funcprot(0)
function x = decimat(xx, e)    
    n = length(xx); 
    x = zeros(1, round((n/e)+0.25));
    x(1:1:length(x)) = xx(1:e:e*length(x)-(e-1))
endfunction

x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
e = 5


y = decimat(x, e)
