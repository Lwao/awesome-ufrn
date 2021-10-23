%% INICIO [dados do exemplo]
l = 200; % comprimento da linha [km]
f = 60; % frquencia da rede [Hz]
Vn = 500e3; % tensao nominal de linha [V]
Vf = Vn/sqrt(3); % tensao nominal de fase [V]
C1 = 13.3*l*1e-9; % capacitancia de seq. positiva [F]
C0 = 8*l*1e-9; % capacitancia de seq. zero [F]
%%% FIM [dados do exemplo]

%% INICIO [solucao do exemplo]
% a)
Qc1 = Vn^2*2*pi*f*C1; % potencia reativa capacitiva [var]
Qr1 = 0.4*Qc1; % potencia reativa de compensacao [var]
X1 = Vn^2/Qr1; % reatancia de seq. positiva [ohm]
X0 = X1; % reatancia de seq. zero [ohm]
Z0 = -1j*X0/(2*pi*f*C0*X0-1); % imp. de seq. zero [ohm]
Z = -1j*X1*X0/(X1*X0*2*pi*f*0.4*C1); % imp. de seq. positiva [ohm]
Va = Vf*0.5*abs(Z0)/(abs(Z0)+1.5*abs(Z)); % tensao na fase aberta [V]
% b)
Is = Vf/(3*abs(Z)); % corrente de arco secundario [A]
% c)
k = 1.7;
X0 = k*X1; % reatancia de seq. zero [ohm]
Xn = (X0-X1)/3; % reatancia de neutro [ohm]
Z0 = -1j*X0/(2*pi*f*C0*X0-1); % imp. de seq. zero [ohm]
Z = -1j*X1*X0/(X1*X0*2*pi*f*0.4*C1-(3*Xn)); % imp. de seq. positiva [ohm]
Va = Vf*0.5*abs(Z0)/(abs(Z0)+1.5*abs(Z)); % tensao na fase aberta [V]
% d)
Xn = X1^2*2*pi*f*(C1-C0)/(3*(1-X1*2*pi*f*(C1-C0))); % reatancia de neutro [ohm]
% e)
Qr1 = 0.6*Qc1; % potencia reativa de compensacao [var]
X1 = Vn^2/Qr1; % reatancia de seq. positiva [ohm]
Xn = X1^2*2*pi*f*(C1-C0)/(3*(1-X1*2*pi*f*(C1-C0))); % reatancia de neutro [ohm]
X0 = 3*Xn+X1; % reatancia de seq. zero [ohm]
%%% FIM [solucao do exemplo]
