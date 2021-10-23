%% INICIO [dados do exemplo]
l = 400; % comprimento da linha [km]
f = 60; % frequencia da rede [Hz]
C = 14*l*1e-9; % capacitancia da linha [F]
L = 1*l*1e-3; % indutancia da linha [H]
h = [2,3,5,7,9,11,13,25]; % harmonicas
wh = 2*pi*f*h; % frequencias harmonicas [rad/s]
gamma_l = 1j*wh*sqrt(L*C); % constante de propagacao * comprimento 
%%% FIM [dados do exemplo]

%% INICIO [solucao do exemplo]
A = cosh(gamma_l);
%%% FIM [solucao do exemplo]
