Z1 = 100; Z2 = Z1;   % impendancia caracteristica das linhas [ohm]
L = 0.1;             % reator serie [H]
C = 10.4167e-6;      % capacitância serie [F]
t = 0:1/fs:0.05-1/fs; % vetor tempo de simulacao
n = length(t);       % tamanho do vetor t
e = ones(1,n);       % tensao de excitacao (degrau)

s = tf('s');
Z = s*L+1/(s*C);     % impedancia equivalente da juncao
Tt2 = 2*Z2/(2*Z2+Z); % coeficiente de transmissao no ponto 2
Ttf = 2;             % coeficiente de transmissao no fim da linha 2 vazia
E = 1/s;             % transformada de Laplace da tensao de entrada
Vf = Ttf*Tt2*E;       % tensao no final da linha (dominio de Laplace)
lsim(Ttf*Tt2,e,t); legend('Tensão no fim da linha')