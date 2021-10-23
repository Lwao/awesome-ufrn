%% INICIO [dados do exemplo]
l = 200; % comprimento da linha [km]
f = 60; % frquencia da rede [Hz]
w = 2*pi*f; % velocidade angular [rad/s]
Vn = 440e3; % tensao nominal de linha [V]
Vf = Vn/sqrt(3); % tensao nominal de fase [V]
% matriz capacitencia sem transposicao [F]
C = [11.6 -1.8 -2 -0.8 -0.25 -0.6; ...
    -1.8 12.5 -2.1 -0.6 -0.3 -1.3; ...
    -2 -2.1 12.3 -0.25 -0.1 -0.3; ...
    -0.8 -0.6 -0.25 11.6 -2 -1.8; ...
    -0.25 -0.3 -0.1 -2 12.3 -2.1; ...
    -0.6 -1.3 -0.3 -1.8 -2.1 12.5] * l*1e-9;
Y = 1j*w*C; % matriz admitancia [S]
% tensoes de fase do ckt 2 [V]
V2a = Vf;
V2b = Vf*exp(-1j*2*pi/3);
V2c = Vf*exp(1j*2*pi/3);
%%% FIM [dados do exemplo]

%% INICIO [solucao do exemplo]
% matriz reduzida para o problema 
    % (apenas as 3 linhas necessarias)
    % linha 1 a 3
M = Y(1:3,:);
% matriz dos termos conhecidos
    % (apenas as 3 colunas finais da matriz reduzida)
    % colunas de 1 a 6, exceto 1 e 4
M1 = M(:,4:6);
% matriz dos termos desconhecidos
    % (apenas as 3 colunas finais da matriz reduzida)
    % colunas 1 e 4
M2 = M(:,1:3);
% computacao das tensoes em ambos 
% os circuitos da fase desconhecida [kV]
V1 = -inv(M2)*M1*[V2a;V2b;V2c];
%%% FIM [solucao do exemplo]
