%% INICIO [dados do exemplo]
V = 275e3; % tensao fundamental [V]
I1 = 1400; % corrente fundamental [A]
I11 = 0.046*I1; % corrente de harmonica 11 [A]
f = 60; % frequencia fundamental [Hz]
w = 2*pi*f; % velocidade angular [rad/s]
Z11 = 620*exp(1j*82*pi/180); % impedancia de harmonica 11 [ohm]
%%% FIM [dados do exemplo]

%% INICIO [solucao do exemplo]
% tensao de harmonica 11
% sem filtro de harmonica
V1 = sqrt(2)*V/sqrt(3); % tensao fundamental [V]
V11 = I11*abs(Z11); % tensal de harmonica 11 [V]
Z11f = (I11/V11 - 1/Z11)^-1; % impedância do filtro [ohm]
%%% FIM [solucao do exemplo]
