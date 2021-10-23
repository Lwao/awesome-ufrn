% % A = [0 0 1 0 0; 0 0 0 1 0; 0 0 0 0 1; 0 0 0 0 0; 0 0 0 0 0];
% % B = [0;0;0;0;1];
% % C = [1 0 0 0 0];
% % A = [1 0 0;0 1 0; 0 0 1];
% % B = [0.1;0.2;0.3];
% % C = [1 2 3];
% A = [0 1; -2 -3];
% B = [0; 2];
% C = [1 0];
% D = 0;
% sysSS = ss(A,B,C,D);
% sysTF = tf(sysSS);
% %sys = ss(tf([1,2],[1,4,2]));
% 
% sysSSD = c2d(sysSS,1,'zoh');
% sysTFD = c2d(sysTF,1,'zoh');
% 
% phi = sysSSD.a;
% gamma = sysSSD.b;


sysORI = tf([2],[1,0.5,0]);
sysMF = tf([2],[1,0.5,2]);
%step(sysORI)
sysD = c2d(sysMF,0.1,'zoh');
sysDn =  c2d(sysORI,0.1,'zoh');