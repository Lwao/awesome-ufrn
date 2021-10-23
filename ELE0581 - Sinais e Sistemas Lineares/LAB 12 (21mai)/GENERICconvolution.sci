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
t = 0:0.001:1
x = exp(-t);
y = exp(-2*t);

plot(c(x,y))
