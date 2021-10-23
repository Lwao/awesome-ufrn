Z = 300;             % impendancia caracteristica da linha [ohm]
L = 0.5;             % reator [H]
w = 377;             % frequencia angular [rad/s]
fs = 1e4;            % frequencia de amostragem
t = 0:1/fs:0.1-1/fs; % vetor tempo de simulacao
e = sin(w*t);        % tensao de entrada senoidal

s = tf('s');
Tt = 2*s*L/(Z+s*L);  % coeficiente de transmissao
E = w/(s^2+w^2);     % transformada de Laplace da tensao de entrada
Vf = Tt*E;           % tensao no final da linha (dominio de Laplace)
lsim(Tt,e,t); legend('Tensão no fim da linha')