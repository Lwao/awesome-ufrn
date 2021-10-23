len = 400e3;       % comprimento da linha [m]
x = 0.377e-3;      % densidade de reatancia indutiva [ohm/m]
c = 14e-12;        % densidade de capacitancia [F/m]
Vn = 500e3;        % tensao nominal [V]
f = 60;            % frequencia [Hz]
w = 2*pi*f;        % velocidade angular [rad/s]
V1 = 1;            % tensao de entrada da linha [p.u]

z = 1j*x;          % densidade de impedancia [ohm/m]
y = 1j*w*c;        % densidade de admitancia [mho/m]

gamma = sqrt(z*y); % constante de propagacao 
Zc = sqrt(z/y);    % impedancia caracteristica

A = cosh(gamma*len);
B = Zc*sinh(gamma*len);
Cq = sinh(gamma*len)/Zc;
D = A;

M = [A,B;Cq,D];

V1_real = V1*Vn/sqrt(3);      % tensao de entrada por fase [V]
V2_real = V1_real/A;          % tensao de saida por fase [V]
I1_real = Cq*V2_real;         % corrente de entrada por fase [A]
Qc = V1_real*conj(I1_real);   % potencia reativa por fase [var]
% porcentagem da sobretensao
sobretensao = 100*(V2_real-V1_real)/V1_real; 

A_novo = 1;
Lr = B/(1j*w*(A_novo - A));     % reator de compensacao [H]
M_novo = M*[1,0;1/(1j*w*Lr),1]; % nova matriz do quadripolo
V2_real = V1_real/M_novo(1,1);  % tensao de saida por fase [V]
I1_real = Cq*V2_real;           % corrente de entrada por fase [A]
Qc = V1_real*conj(I1_real);     % potencia reativa por fase[var]
% porcentagem da sobretensao
sobretensao = 100*(V2_real-V1_real)/V1_real; 

A_10p = 0.909;
Lr = B/(1j*w*(A_10p - A));   % reator de compensacao [H]
V2_real = V1_real/A_10p;     % tensao de saida por fase [V]