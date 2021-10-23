%% INICIO [dados do exemplo]
l = 100e3; % comprimento da linha [m]
Vn = 230e3; % tensao nominal de linha [V]
Vf = Vn/sqrt(3); % tensao nominal de fase [V]
% tensoes nos terminais das fases boas [kV]
E1b = -66.5-1j*115.2;
E1c = -66.5+1j*115.2;
E2b = -85.49-1j*101.9;
E2c = -45.49+1j*125;
% matriz de admitancias dos elementos serie
G1 = 1j*[-0.027778, 0.011111, 0.005555; ...
    0.0111111, -0.031111, 0.011111; ...
    0.005555, 0.011111, -0.27778];
% matriz de capacitancias concentradas em um lado da linha
G2 = 1j*[1.5, -0.25, -0.1; ...
    -0.25, 1.54, -0.25; ...
    -0.1, -0.25, 1.5]*1e-4;
%%% FIM [dados do exemplo]

%% INICIO [solucao do exemplo]

% matriz admitancias da linha [S]
Ylinha = [G1+G2, -G1; -G1, G1+G2]; 
% matriz reduzida para o problema 
    % (apenas as duas linhas necessarias)
    % linha 1 e 4
M = [Ylinha(1,:);Ylinha(4,:)];
% matriz dos termos conhecidos
    % (apenas as quatro colunas da matriz reduzida)
    % colunas de 1 a 6, exceto 1 e 4
M1 = [M(:,2:3), M(:,5:6)]; 
% matriz dos termos desconhecidos
    % (apenas as duas colunas da matriz reduzida)
    % colunas 1 e 4
M2 = [M(:,1), M(:,4)]; 
% computacao das tensoes em ambos 
% os circuitos da fase desconhecida [kV]
Va = -inv(M2)*M1*[E1b;E1c;E2b;E2c];
%%% FIM [solucao do exemplo]