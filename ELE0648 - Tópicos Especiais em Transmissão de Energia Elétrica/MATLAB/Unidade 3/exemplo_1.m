V1_inc = 100; % onda de tensao incidente [V]
Z1 = 200; % impedancia caracteristica da linha 1 [ohm]
Z2 = 300; % impedancia caracteristica da linha 2 [ohm]

Tr = (Z2-Z1)/(Z2+Z1); % coeficiente de reflexao
Tt = 1+Tr; % coeficiente de transmissao

V1_ref = Tr*V1_inc; % onda de tensao refletida [V]
V2_trans = Tt*V1_inc; % onda de tensao transmitida [V]
