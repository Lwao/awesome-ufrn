n = 1e4
h = 4/n;
phi = [1, 1-exp(-1*h); 8*(exp(-1*h)-1), exp(-1*h)];
gamm = [exp(-1*h)-1; -exp(-1*h)];
c = [1, 0];


x = zeros(2,n);
y = zeros(2,n);

for i = 1:100
    x(:,i+1) = phi*x(:,i) + gamm;
    y(:,i) = c*x(:,i);
end
