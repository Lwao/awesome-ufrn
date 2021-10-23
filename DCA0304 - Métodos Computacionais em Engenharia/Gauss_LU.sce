//ELIMINAÇÃO DE GAUSS

M = [3 5 1; 2 -1 0; -1 3 1];
// m
// b = 

n = length(M(1, :));
m = zeros(n, n);


for i = 1:n 
    //count = 1
    //while M(i, i) == 0,
    //    temp = M(i, :);
    //    M(i, :) = M(i+count, :);
    //    M(i+count, :) = temp;
    //end
        
    m(i:1:n, i) = M(i:1:n, i)/M(i, i);
    M(i+1:1:n, i) = M(i+1:1:n, i)-(m(i+1:1:n, i)*M(i, i))    
end


//FATORIAÇÃO LU

A  = m*M
