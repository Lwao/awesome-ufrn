%% INICIO [dados do exemplo]
% tensoes nos terminais das fases boas [kV]
E1b = -66.5-1j*115.2;
E1c = -66.5+1j*115.2;
% matriz de capacitancias concentradas em um lado da linha
G2 = 1j*[1.5, -0.25, -0.1; ...
    -0.25, 1.54, -0.25; ...
    -0.1, -0.25, 1.5]*1e-4;
%%% FIM [dados do exemplo]

%% INICIO [solucao do exemplo]
% matriz admitancias da linha [S]
Ylinha = 2*G2; 
% tensao na fase a considerando 
% a linha 1 da matriz adm.
% em [kV]
V1a = Ylinha(1,2:3)*[E1b;E1c]/(-Ylinha(1,1));
%%% FIM [solucao do exemplo]