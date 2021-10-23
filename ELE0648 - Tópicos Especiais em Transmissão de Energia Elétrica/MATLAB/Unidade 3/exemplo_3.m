Vn = 500;            % tensao nominal [kV]
Scc = [2.5, 25]*1e3; % potencia de curto-circuito [MVA]
w = 377;             % velocidade angular [rad/s]
Z = 250;             % impedancia caracteristica da linha

tau = Vn^2./(w*Z1*Scc);