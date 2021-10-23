len = 150e3;       % comprimento da linha [m]
x = 0.377e-3;      % densidade de reatancia indutiva [ohm/m]
c = 14e-12;        % densidade de capacitancia [F/m]
Vn = 500e3;        % tensao nominal por fase [V]
f = 60;            % frequencia [Hz]
w = 2*pi*f;        % velocidade angular [rad/s]
V1 = 1;            % tensao de entrada da linha [p.u]

s = 1j*w;
Z = 1j*x*len;      % impedancia longitudinal da linha [H]
Y = 1j*c*w*len;    % admitancia transversal da linha [F]

A = (Z*Y/2+1);     % constante generalizada A
B = Z;             % constante generalizada B
Lr = B/(s*(1-A));  % reator de compensacao [H]