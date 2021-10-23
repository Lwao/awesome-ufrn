%% INICIO [dados do exemplo]
Scc = 20.04+1j*229.12; % potencia de curto-circuito [MVA]
% a) para a linha 1-2 na quinta harmonica
r12 = 0.17124; % [ohm/km]
x12 = 2.42039; % [ohm/km]
y12 = 1.721*1e-5; % [S/km]
% b) para a linha 3-4 na quinta harmonica
r34 = 0.17404; % [ohm/km]
x34 = 2.01867; % [ohm/km]
y34 = 2.104; % [S/km]
% c) transformador 2-3
Vp = 138e3; % tensao no primario [V]
Vs = 13.8e3; % tensao no secundario [V]
x_r = 4.5;
Strafo = 25; % potencia do trafo [MVA]
% d) capacitor
Q = 1.2; % potencia do capacitor [Mvar]
% e) fonte de corrente para quinta harmonica
I1 = 100; % corrente fundamental [A]
I5 = 0.2*I1; % corrente de quitna harmonica [A]
%%% FIM [dados do exemplo]