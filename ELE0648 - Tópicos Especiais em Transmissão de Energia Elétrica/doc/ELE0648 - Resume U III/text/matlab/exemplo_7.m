Z = 400; % impedancia caracterisca das linhas [ohm]
V = 2000; % tensao da onda [kV]

Zth = Z/3; % eq. de Thevenin
Tt = 2*(Z/2)/(Z+Z/2); % coeficiente de transmissao
Eth = V*Tt; % tensao em vazio sem o para-raios

% vf = 1000+10i % problema anterior
i = (Eth-1000)/(Zth+10); % corrente que circula no para-raios
Vf = Eth-Zth*i; % tensao no para-raios