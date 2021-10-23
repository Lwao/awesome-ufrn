%% INICIO [dados do exemplo]
l = 200; % comprimento da linha [km]
f = 60; % frquencia da rede [Hz]
w = 2*pi*f; % velocidade angular [rad/s]
Vn = 440e3; % tensao nominal de linha [V]
Vf = Vn/sqrt(3); % tensao nominal de fase [V]
C1 = 14*l*1e-9; % capacitancia de seq. positiva do ckt. 1 e 2 [F]
C0 = 8*l*1e-9; % capacitancia de seq. zero do ckt. 1 e 2 [F]
Cm1 = 0.4*l*1e-9; % capacitancia mutua de seq. positiva do ckt. 1 e 2 [F]
Cm0 = 1.6*l*1e-9; % capacitancia mutua de seq. zero do ckt. 1 e 2 [F]
% matriz de capacitancias para linha transposta [S]
Y = 1j*w*[12 -2 -2 -0.8 -0.4 -0.4; ...
    0 12 -2 0 -0.8 -0.4; ...
    0 0 12 0 0 -0.8; ...
    -0.8 -0.4 -0.4 12 -2 -2; ...
    0 -0.8 -0.4 0 12 -2; ...
    0 0 -0.8 0 0 12]*1e-4;
%%% FIM [dados do exemplo]

%% INICIO [solucao do exemplo]
V11 = Vf; % tensao de seq. positiva do ckt. 1 [V]
V21 = - (-1j*w*Cm1)/(1j*w*C1)*V11; % tensao de seq. positiva induzida no ckt. 2 [V]
Qc1 = Vn^2*w*C1; % potencia reativa capacitiva de seq. positiva [var]
Qr1 = 0.6*Qc1; % potencia reativa de compensacao reativa de seq. positiva [var]
yr1 = -1j*Qr1/Vn^2; % admitancia do reator de seq. positiva [S]
V21 = - (-1j*w*Cm1)/(1j*w*C1 + yr1)*V11; % tensao de seq. positiva induzida no ckt. 2 [V]
%%% FIM [solucao do exemplo]
