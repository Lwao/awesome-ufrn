% Função psine() gera um pulso senoidal de meio período T (período total 2T)
function pout=psine(T)
    % o pulso senoidal de período completo seria: sin(2*pi*[0:T-1]/T)e
    % possuiria período T
    pout=sin(pi*[0:T-1]/T);
end