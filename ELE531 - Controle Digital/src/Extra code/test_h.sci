funcprot(0)

//planta estável contínua
A = [0 1; -25 -2];
B = [0; 10];
C = [1 0];
D = 0;

function xdot_P = plant(t, x)    
    // planta
    //time = linspace(0,10,1001);
    w = 2*%pi*1;
    u = 1;
    //u = sin(w*t);

    xdot_P = A*x+B*u;
endfunction


//dados contínuo
y0 = [0; 0];
h = 0.09/10;
t = 0:h:10
t0 = t(1);

//solução contínua
yc = ode(y0, t0, t, plant);
plot(t,yc(1,:))

