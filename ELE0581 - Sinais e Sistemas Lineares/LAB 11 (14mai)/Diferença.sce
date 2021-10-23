//À NOSSA ESCOLHA
T = [0.1 ; 0.3; 1; 1.5 ; 2];
t = 0:0.01:1
tau = 1;


y = zeros(1, length(t));
x = ones(1, length(t));

for i = 1:1:5
    raz = T(i)/tau;
    for n = 1:1:length(t)-1
        y(n+1)=raz*x(n)+(1-raz)*y(n);
    end
    subplot(5, 1 ,i)
    plot(t, y)
end

y = zeros(1, length(t));
x = ones(1, length(t));

for i = 1:1:5
    raz = T(i)/tau;
    for n = 2:1:length(t)
        y(n)=(raz*x(n)+y(n-1))/(1+raz);
    end
    subplot(5, 1 ,i)
    plot(t, y)
end



