funcprot(0)
function xdot = OL(t, x) // malha aberta 
    u = 1;
    xdot(1) = x(2);
    xdot(2) = 2*u-0.5*x(2);
endfunction

function xdot = CL(t, x) // malha fechada
    u = 1;
    xdot(1) = x(2);
    xdot(2) = 2*u-0.5*x(2)-2*x(1);
endfunction

function xdot = OL_PD(t, x) // malha aberta com PD    
    u = 1;
    d = 9999999*(t==0);
    xdot(1) = x(2);
    xdot(2) = 4.8542*u+2.7829*d-0.5*x(2);
endfunction

function xdot = CL_PD(t, x) // malha fechada com PD
    u = 1;
    d = (t==0);
    xdot(1) = x(2);
    xdot(2) = 4.8542*u+2.7829*d-3.2829*x(2)-4.8542*x(1);
endfunction

//parâmetros da ode
y0 = [0;0];
t = linspace(0,20,10001);
t0 = t(1);

//solução
y1 = ode(y0, t0, t, OL);
y2 = ode(y0, t0, t, CL);
y3 = ode(y0, t0, t, OL_PD);
y4 = ode(y0, t0, t, CL_PD);


//plotando
set(gca(),"auto_clear","off");


plot2d(t,[y1(1,:)',y2(1,:)',y3(1,:)',y4(1,:)'],[1,2,3,4]);
e=gce();

hl=captions(e.children,['OL';'CL';'OL_PD';'CL_PD']);
hl=captions(e.children,['OL';'CL';'OL_PD';'CL_PD'],'in_upper_right');

hl.legend_location='in_upper_right'
hl.fill_mode='on';

