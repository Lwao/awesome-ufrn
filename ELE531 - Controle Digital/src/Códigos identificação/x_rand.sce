//h = 1e-3; // estável
h = 1e-1;
t_end = 100;
n = t_end/h;
t = 0:h:n*h-h;
//h_rand = 1e-1; // estável
h_rand = 1;
n_rand = t_end/h_rand;
rand_coef = rand(1,n_rand);
//rand_coef(1) = 0;
//rand_coef(3) = 0;
//rand_coef(5) = 0;
//rand_coef(7) = 0;
//rand_coef(9) = 0;
for i = 1:length(rand_coef)
    if(modulo(i,2)) then// se ímpar
        rand_coef(i) = 0;
    end
end
//rand_coef = []
//for i = 1:n_rand/4
//    rand_coef = [rand_coef, [1,0,-1,0]];
//end
x = [];
for i = 0:n_rand-1
    x(i*(n/n_rand)+1:(i+1)*(n/n_rand)) = rand_coef(i+1);
end
//tt = 0:1:99;
//x= [];
//for i = 0:n/n_rand-1
//    x = [x tt];
//end
//x = x/100;
//x = x';
//x = ones(1,n);
V.time = t';
V.values = x;

plot(V.time,V.values)
//plot(A.time,A.values)
xlabel("Tempo (s)");
ylabel("Saída");
