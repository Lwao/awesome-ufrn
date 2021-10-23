%% INICIO [dados do exemplo]
Scc = 20.04+1j*229.12; % potencia de curto-circuito [MVA]
l = 100; % comprimento da linha [km]
% a) para a linha 1-2 na quinta harmonica
r_12 = 0.17124*l; % [ohm]
x_12 = 2.42039*l; % [ohm]
y_12 = 1.721*1e-5*l; % [S]
% b) para a linha 3-4 na quinta harmonica
r_34 = 0.17404*l; % [ohm]
x_34 = 2.01867*l; % [ohm]
y_34 = 2.104*l; % [S]
% c) transformador 2-3
Vp = 138e3; % tensao no primario [V]
Vs = 13.8e3; % tensao no secundario [V]
r = 0.02;
x_r = 4.5;
Strafo = 25e6; % potencia do trafo [VA]
% d) capacitor
Q = 1.2e6; % potencia do capacitor [var]
% e) fonte de corrente para quinta harmonica
I1 = 100; % corrente fundamental [A]
I5 = 0.2*I1; % corrente de quitna harmonica [A]
%%% FIM [dados do exemplo]

%% INICIO [solucao do exemplo]
h = 5; % harmonica de analise
% para o sistema
Sb = 100e6; % potencia base [VA]
aux = Sb/Scc; % para o sistema [p.u]
zcc = real(aux)+h*imag(aux); %impedancia de curto corrigida [p.u]
ycc = 1/zcc; % admitancia de curto-circuito [p.u]
% para a linha
Zb1 = Vp^2/Sb; % impedancia base primario [ohm]
Zb2 = Vs^2/Sb; % impedancia base secundario [ohm]
% para a linha em p.u
y12 = Zb1/(r_12+1j*x_12);
y34 = Zb2/(r_34+1j*x_34);
y1 = Zb1*y12/2;
y2 = y1;
y3 = Zb2*y34/2;
y4 = y3;
% para o transformador em p.u
z = (r+1j*h*x_r*r)*Sb/Strafo;
y = 1/z;
% capacitor em p.u
xc = -1j*h/Zb2 * Vs^2/Q;
yc = 1/xc;
% matriz admitancia

%%% FIM [solucao do exemplo]
