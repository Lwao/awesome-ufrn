x = [1, zeros(1, 99)];
y = filter([1], [1, 0.95], x);
//plot2d3(y);

h=iir(10, 'lp', 'butt', 0.125, [0 0]);
B=coeff(h(2)); 
B=B(11:-1:1);
A=coeff(h(3));
A=A(11:-1:1);

[hzm, fr]=frmag(B, A, 512);
//plot(fr*8000, abs(hzm));


x = [1, zeros(1, 49)];
y = filter(B, A, x);
plot(y)
