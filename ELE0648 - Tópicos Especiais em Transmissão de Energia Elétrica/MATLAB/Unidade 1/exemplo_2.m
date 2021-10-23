len = 400e3;       % comprimento da linha [m]
x = 0.377e-3;      % densidade de reatancia indutiva [ohm/m]
c = 14e-12;        % densidade de capacitancia [F/m]
Vn = 500e3;        % tensao nominal [V]
f = 60;            % frequencia [Hz]
w = 2*pi*f;        % velocidade angular [rad/s]
V1 = 1;            % tensao de entrada da linha [p.u]

s = 1j*w;
z = 1j*x;          % densidade de impedancia [ohm/m]
y = 1j*w*c;        % densidade de admitancia [mho/m]

gamma = sqrt(z*y); % constante de propagacao 
Zc = sqrt(z/y);    % impedancia caracteristica
A =cosh(gamma*len);% constante generalizada A
B = Zc*sinh(gamma*len); % constante generalizada B
Lr =B/(s*(1-A));   % reator de compensacao [H]

