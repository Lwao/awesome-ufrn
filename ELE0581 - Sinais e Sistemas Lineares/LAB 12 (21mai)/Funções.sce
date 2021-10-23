funcprot(0)
function y = c(a, b)    
    al = length(a);
    bl = length(b);
    
    if (bl>al) then //a vai ser a menor
        temp = a;
        a = b;
        b = temp;
    end

    bb = zeros(1, al+bl-1);
    tamb = length(bb);
    bb(tamb-bl+1:1:tamb) = b(1:1:bl)
    
    y = zeros(1, tamb)
    count = 1
    for i =1:1:tamb
        
        intec = zeros(1, al)
        if (i<=al) then
            intec(1:1:i) = bb(tamb+1-i:1:tamb);
        end
        if (i>al) then
            intec(1:1:al) = bb(tamb+1-i:1:tamb-count);
            count = count +1;
        end
        
        y(i) = sum(intec.*a);
    end
endfunction

funcprot(0)
function xx = expand(x, e)    
    n = length(x); 
    xx = zeros(1, (e*(n-1))+1);
    xx(1:e:length(xx)) = x(1:1:n)
endfunction

funcprot(0)
function x = decimat(xx, e)    
    n = length(xx); 
    x = zeros(1, round((n/e)+0.25));
    x(1:1:length(x)) = xx(1:e:e*length(x)-(e-1))
endfunction

funcprot(0)
function y = intlin(x, e)    
    ker = [0.5, 1, 0.5];
    z = c(x, ker);
    n = length(z);
    y = zeros(1, n-2);
    y(1:1:n-2) = z(2:1:n-1)
endfunction
