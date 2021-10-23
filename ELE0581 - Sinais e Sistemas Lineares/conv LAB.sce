h = 0.001
tm = 10
t = 0:h:tm
tt = -tm:h:tm

x = exp(-t);
g = exp(-2*t);


n=length(tt);
p=length(x);

vg = zeros(1, n);
vx = zeros(1, n);
c = zeros(1, p);

vx((n/2)+1:1:n+1) = x(1:1:p);
vg(1:1:(n/2)+1) = g(p:-1:1);

tg = length(g);
d = zeros(1, p);

for i = 1:1:p-1
    d = zeros(1, p);
    if i==0 then
        d(1)=vg(tg);
        else
            d(1:1:i+1) = vg(tg-i:1:tg)
    end,
    c(i) = h*sum(d.*x)
end

plot(t, c)
