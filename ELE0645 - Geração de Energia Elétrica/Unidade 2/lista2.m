%run('C:\Users\levyg\Desktop\prova2.m')
clc

disp("")
disp("1.2.");

string_size = 8;
parallel_size = 4;
Vcell = 0.5;
Pcell = 2;

Vmod = string_size*Vcell
Pmod = Pcell*string_size*parallel_size
Imod = Pmod/Vmod

disp("")
disp("1.3.")

sigma = 3;
Pmax = 200;
Eger = Pmax*sigma*sqrt(2*pi)

disp("")
disp("1.4.");

Io = 0.1e-6;
Is = 1;
k = 1.38e-23;
q = 1.602e-19;
T = 30+273.15;

VT = k*T/q
Voc = VT * log(Is/Io+1)
Isc = Io * (e^(Voc/VT)-1)

disp("")
disp("2.2.");

F = 1000;
c = 0.2;
d = 20;
n = 2;
w = 2*pi*30/60;

T = n*F*c*d
P = T*w

disp("")
disp("2.3.");

Cp = 0.4*sin(1.57)
Pout = Cp*P

disp("")
disp("2.4.");

nhigh = 910;
ng = 200;
d = 5;
r = d/2;
w = 10;

nlow = nhigh/ng
vtip = 2*pi*r*nlow/60
TSR = vtip/w
