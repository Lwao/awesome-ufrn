funcprot(0)
//planta
A = [0 1; 0 -0.5];
B = [0; 2];
C = [1 0];
//u = 1/0.238;
u = 1/0.7707942;
//K = ppol(A,B,[(-2+2.0976*%i) (-2-2.0976*%i)]); // definido
//K = ppol(A,B,[(-1.5383+1.5772*%i) (-1.5383-1.5772*%i)]); // do PD
K = ppol(A,B,[(-1.132+1.146*%i) (-1.132-1.146*%i)]); // do PD otimizado


function xdot_P = plant(t, x)    
    // planta
    xdot_P = A*x+B*u;
endfunction
function xdot_K = feedback(t, x)    
    // planta com controlador
    xdot_K = (A-B*K)*x+B*u;
endfunction

//parâmetros da ode
y0 = [0; 0];
t = linspace(0,10,1001);
t0 = t(1);

//solução
yp = ode(y0, t0, t, plant);
yk = ode(y0, t0, t, feedback);

//plotando
set(gca(),"auto_clear","off");

plot2d(t,[yp(1,:)',yk(1,:)'],[1,2]);
e=gce();

hl=captions(e.children,['Plant';'State feedback']);
hl=captions(e.children,['Plant';'State feedback'],'in_upper_right');

hl.legend_location='in_upper_right'
hl.fill_mode='on';
 


