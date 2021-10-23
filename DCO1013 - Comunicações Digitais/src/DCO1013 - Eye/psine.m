% Fun��o psine() gera um pulso senoidal de meio per�odo T (per�odo total 2T)
function pout=psine(T)
    % o pulso senoidal de per�odo completo seria: sin(2*pi*[0:T-1]/T)e
    % possuiria per�odo T
    pout=sin(pi*[0:T-1]/T);
end