%H = tf([0.0098354, 0.00967728],[1, -1.9512294, 0.9512294],0.1)%insMA
%H = tf([0.0004966, 0.0004933],[1, -1.977724, 0.9801987],0.01)%estMA 
%H = tf([1.5246247, 0.6167311, -0.869181],[1, -1.9512294, 0.9512294],0.1)%insC 
H = tf([170.46632, -156.92777, -167.98258, 155.07328],[200, -595.5448, 591.58454, -196.03974],0.01)%estC 
%h = 0.1;
h = 0.01;
figure();
rlocus(H)
%pzmap(H)
%zgrid(h)
axis equal
