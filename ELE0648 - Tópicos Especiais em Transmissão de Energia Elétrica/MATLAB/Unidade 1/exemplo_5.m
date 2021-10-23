E = 1;                     % tensao do gerador [p.u]
a = -0.5+1j*sqrt(3)/2;     %

V1 = 2*E/3;                % tensao de sequencia positiva [p.u]
V2 = -E/3;                 % tensao de sequencia negativa [p.u]
V0 = V2;                   % tensao de sequencia zero [p.u]
VC = [V0;V1;V2];           % vetor de tensoes de componentes de sequencia

T = [1, 1, 1;              % matriz de transformacao
     1, a^2, a;
     1, a, a^2];              
 
 VF = T*VC;                % vetor de tensoes de componentes de fase
 