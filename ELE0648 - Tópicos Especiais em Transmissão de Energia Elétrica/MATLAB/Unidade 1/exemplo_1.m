len = 150e3;       % comprimento da linha [m]
x = 0.377e-3;      % densidade de reatancia indutiva [ohm/m]
c = 14e-12;        % densidade de capacitancia [F/m]
Vn = 500e3;        % tensao nominal por fase [V]
f = 60;            % frequencia [Hz]
w = 2*pi*f;        % velocidade angular [rad/s]
V1 = 1;            % tensao de entrada da linha [p.u]

Z = 1j*x*len;      % impedancia longitudinal da linha [H]
Y = 1j*c*w*len;    % admitancia transversal da linha [F]

V2 = V1/(Z*Y/2+1); % tensao na saida da linha [p.u]
sob = (V2-V1)/V1;  % sobretensao percentual
V1real = V1*Vn.sqrt(3); % tensao de entrada da linha [V]
V2real = V2*Vn.sqrt(3); % tensao na saida da linha [V]
I1real = Y*(Z*Y/4+1)*V2real; % corremte na entrada da linha [A]
Qc = V1real*conj(I1real); % potencia reativa monofásica consumida pela linha [var]
