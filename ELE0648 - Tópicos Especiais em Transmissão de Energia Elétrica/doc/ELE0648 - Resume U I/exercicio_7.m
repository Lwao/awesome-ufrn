Vn = 525e3;             % tensao nominal da linha [V]
E = Vn/sqrt(3);         % tensao do gerador [V]
len = 300e3;            % comprimento da linha [m]
a = -0.5+1j*sqrt(3)/2;  %

% reatancias indutivas [ohm]
X1 = 1j*90;
X2 = X1;
X0 = 1j*420;
% reatancias capacitivas [ohm]
Xc1 = -1j*1473.6;
Xc2 = Xc1;
Xc0 = -1j*2210.4;
% impedancias de Thevenin
Zeq1 = X1*2*Xc1/(X1+2*Xc1);
Zeq2 = Zeq1;
Zeq0 = X0*2*Xc0/(X0+2*Xc0);
% tensoes e correntes em [V] e [A]
Ev = E*2*Xc1/(X1+2*Xc1); 
I = Ev/(2*Zeq1+Zeq0);
V1 = Ev - I*Zeq1;
V2 = - I*Zeq2;
V0 = - I*Zeq0;

VC = [V0;V1;V2];
T = [1, 1, 1;              % matriz de transformacao
     1, a^2, a;
     1, a, a^2];              
 
 VF = T*VC;                % vetor de tensoes de componentes de fase
 