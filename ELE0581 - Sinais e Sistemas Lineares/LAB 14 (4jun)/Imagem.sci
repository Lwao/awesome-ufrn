funcprot(0)
function xx = expand(x, e)    
    n = length(x); 
    p = (e*n)-(e-1);
    xx(1:e:p) = x(1:1:n);
endfunction

funcprot(0)
function x = decimar(xx, e)    
    n = length(xx); 
    p = round((n/e)+0.25);
    x(1:1:p) = xx(1:e:n);
endfunction

funcprot(0)
function k = kernel_(e)    
    k = zeros(1, 2*e+1);
    for i = 0:length(k)-1
        k(i+1) = i+2*(e-i)*(i>e);
    end
    k = k/e;
endfunction

funcprot(0)
function expandido = exp_img(x, e)    
    altura = length(x(:, 1, 1));
    comprimento = length(x(1, :, 1));
    cores = length(x(1, 1, :));
    
    //EXPANDINDO
    for j = 1:1:cores
        //esticando cada linha
        for i = 1:1:altura
            z(i, :, j) = expand(x(i, :, j), e)
        end
        //esticando cada coluna
        comp_exp = length(z(1, :, j))
        for i = 1:1:comp_exp
            expandido(:, i, j) = expand(z(:, i, j), e)
        end
    end
endfunction

funcprot(0)
function v = dec_img(x, e)    
//DECIMAR
    cores = length(x(1, 1, :));
    alt_exp = length(x(:, 1, 1));
    comp_exp = length(x(1, :, 1));

    alt_comp = round((alt_exp/e)+0.25);
    comp_comp = round((comp_exp/e)+0.25);

    for j = 1:1:cores
    //decimando linhas
        for i = 1:1:alt_exp
            w(i, :, j) = decimar(x(i, :, j));
        end

    //decimando colunas
        for i = 1:1:comp_comp
            v(:, i, j) = matrix(decimar(w(:, i, j)), alt_comp, 1);
        end
    end

endfunction

funcprot(0)
function y = interpolar(x, e)   
    ker = kernel_(e);
    c = convol(x, ker);
    y = c;
endfunction

funcprot(0)
function d = inter_img(x, e)   
    cores = length(x(1, 1, :));
    alt_exp = length(x(:, 1, 1));
    comp_exp = length(x(1, :, 1));

    for j = 1:1:cores
    //interpolando linhas
        for i = 1:e:alt_exp
            a(i, :, j) = interpolar(x(i, :, j), e);
        end
    //removendo bordas extras geradas pelo kernel
        n = length(x(1, :, j))
        for i = 1:1:alt_exp
            b(i, 1:1:comp_exp, j) = a(i, e+1:1:comp_exp+e, j);
        end


    //interpolando colunas
        for i = 1:1:comp_exp
            temp_len = length(b(:, i, j));
            c(:, i, j) = matrix(interpolar(b(:, i, j), e), temp_len+2*e, 1);
        //a função matrix acima força o 
        //vetor a ser do tipo coluna
    end
    //removendo bordas extras geradas pelo kernel
        for i = 1:1:comp_exp
            d(1:1:alt_exp, i, j) = c(e+1:1:alt_exp+e, i, j);
        end
    end
endfunction

funcprot(0)
function y = quant_bit(x, quant)
    y = x;
    qq_cores = 2^quant; //quantidade de cores
    altura = length(y(:, 1, 1)); //quantidade de linhas
    comprimento = length(y(1, :, 1)); //quantidade de colunas
    cores = length(y(1, 1, :)); //cores da matriz
    aux_exp = 0; //inicialização da variável de auxílio
    
    //somatório
    for j = 0:1:quant-1 //depende da quantização
        aux_exp = aux_exp + 2^(j);
    end
    //calculando qual o valor de arredondamento máximo
    arr_max = aux_exp*256/qq_cores;
    
    for k = 1:1:cores
        for i = 1:1:altura
            for j = 1:1:comprimento
                temp = (y(i, j, k)/(2^(8-quant)))*(2^(8-quant))
                //quando for >= que o arredondamento máximo
                //transforma em branco (255)
                if (temp >= arr_max) then
                    y(i, j, k) = 255;
                else
                    y(i, j, k) = temp
                end
            end
        end
    end
endfunction


y = im2double(imread("C:\Users\Levy\Downloads\zebra.jpg"))
yy = imread("C:\Users\Levy\Downloads\zebra.jpg")

e = 2;
d = 2;
bits = 1;

//x = exp_img(y, e);
//z = inter_img(x, e);
//w = dec_img(x, d);
//w = quant_bit(yy, 7)



