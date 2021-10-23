%% INICIO [dados do exemplo]
% matriz admitancia da linha [S]
Ylinha = 2j*[1.513, -0.2, -0.2; ...
    -0.2, 1.513, -0.2; ...
    -0.2, -0.2, 1.513]*1e-4;
% tensoes nos terminais das fases boas [kV]
E1b = -66.5-1j*115.2;
E1c = -66.5+1j*115.2;
%%% FIM [dados do exemplo]

%% INICIO [solucao do exemplo]
% tensao na fase a considerando 
% a linha 1 da matriz adm.
% em [kV]
V1a = Ylinha(1,2:3)*[E1b;E1c]/(-Ylinha(1,1));
Q = 10e6; % potencia reativa do reator [var]
Vn = 230e3; % tensao nominal da linha [V]
y = -1j*Q/Vn^2; % admitancia dos reatores [S]
Yr = [y 0 0; 0 y 0; 0 0 y]; % matriz admitancia dos reatores
Ya = Ylinha + 2*Yr; % matriz resultante da linha compensada [S
% tensao na fase a considerando 
% a linha 1 da NOVA matriz adm.
% em [kV]
V1a = Ya(1,2:3)*[E1b;E1c]/(-Ya(1,1));
%%% FIM [solucao do exemplo]