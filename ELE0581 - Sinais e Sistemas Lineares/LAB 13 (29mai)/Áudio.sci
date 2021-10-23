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
    ker = [1/3, 2/3, 1, 2/3, 1/3];
    //ker = [0.5, 1, 0.5];
    y = convol(x, ker);
    //n = length(z);
    //y = zeros(1, n-2);
    //y(1:1:n-2) = z(2:1:n-1)
endfunction

[y, x] = loadwave("F:\UFRN (2018.1)\SINAIS E SISTEMAS LINEARES\Laboratórios\batera.wav")

//EXPANDINDO E INTERPOLANDO

e = 2;

maior(1, :) = intlin(expand(y(1, :), e), e)
maior(2, :) = intlin(expand(y(2, :), e), e)



//sound (maior(1, :), x(3))

//DECIMANDO

menor(1, :) = decimat(y(1, :), e)
menor(2, :) = decimat(y(2, :), e)


//sound (menor(1, :), x(3))

//salvar
//savewave("...\arquivo_final.wav",y,x(3))


//salvar
//savewave("...\arquivo_final.wav",y,x(3))




