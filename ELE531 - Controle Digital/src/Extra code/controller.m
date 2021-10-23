%z = tf('z',0.1);
%z = tf('z',0.01);
s = tf('s');
G_EST = 10/(s^2+2*s+25);
G_INS = 2/(s*(s+0.5));
C_PID = (16.4327*s)+(144.5387)+(317.83/s);
C_PD = 15.5014*s+130.395;
% MF = (G_EST*C_PID)/(1+G_EST*C_PID);
MF = (G_INS*C_PD)/(1+G_INS*C_PD);
% MF = feedback(G*C,1)
step(MF,5)
