clear;
y = im2double(imread("C:\Users\aluno\Desktop\encontre_sorriso.jpg"))



//sorriso
x = zeros(8, 7);
x(1, :) = 1;
x(8, :) = 1;
x(:, 1) = 1;
x(:, 7) = 1;
x(3, 3) = 1;
x(3, 5) = 1;
x(4, 4) = 1;
x(6, 3:1:5) = 1;
//////
for m = 400:1:500
    for n = 700:1:800
        z(m-399, n-699) = y(m, n);
    end
end

nnn = length (z(:, 1));



for n = 1:1:101
   for m = 1:1:101
       //criou temp para somar
        for k = 1:1:8
            for l = 1:1:7
                temp(k, l) = y(398+n+k, 698+m+l)*x(k, l);
            end
        end
        //soma temp
        soma_temp(1:1:8) =sum(temp(1:1:8, :));
        soma_tcol = sum(soma_temp);
        c(n, m) = soma_tcol;        
    end
end

pos_x = 0;
pos_y = 0;
maior = 0;
for i = 1:1:length(c(1, :))
    for j = 1:1:length(c(:, 1))
        if (c(i,j)>maior) then 
            maior = c(i, j);
            pos_x = i;
            pos_y = j;
        end
    end
end





//CONCLUSÃO
//NARIZ É NA POSIÇÃO
//pos_x e pos_y são as coordenadas para a posição na imagem delimitada

pos_verticaloriginal = pos_x+402;
pos_horizontaloriginal = pos_y+702;

//pos_verticaloriginal e pos_horizontaloriginal são as coordenadas para a posição na imagem delimitada, voltando para o original apenas somando pelo 'limite inferior+2', pois o n e o m percorreram de 1:1:101














//intervalo linha 400 a 500 
// coluna 700 a 800



//imshow(z)
