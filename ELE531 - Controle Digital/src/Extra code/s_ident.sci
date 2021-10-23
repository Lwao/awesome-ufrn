h = 0.01/10;
t_end = 10;
n = t_end/h;
t = 0:h:n*h-h;
y = zeros(1,n);

h_rand = 0.5;
n_rand = t_end/h_rand;
//rand_coef = (sin(rand(1,n_rand))).*(rand(1,n_rand).*rand(1,n_rand)./rand(1,n_rand));
rand_coef = rand(1,n_rand);
//for i = 1:length(rand_coef)
//    if(rand_coef(i)>0.5) then
//        rand_coef(i) = 0.5;    
//    end
//end
x = [];
for i = 0:n_rand-1
    x(i*(n/n_rand)+1:(i+1)*(n/n_rand)) = rand_coef(i+1);
end
x = x';
//x = x-sum(x)/length(x);
//x = ones(1,n);

b1 = 10/h^2; //u[n]
a1 = (2/h^2 - 2/h)/h^2; //y[n+1]
a2 = (2/h -1/h^2 -25)/h^2; //y[n]

for i = 1:n-2
    y(i+2) = b1*x(i) + a1*y(i+1) + a2*y(i);
end
//for i = 1:n-2
//    y(i+2) = (10*x(i) + (2/h^2 - 2/h)*y(i+1) + (2/h -1/h^2 -25)*y(i))*h^2
//end
