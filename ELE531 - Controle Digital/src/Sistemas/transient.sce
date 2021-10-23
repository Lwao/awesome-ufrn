funcprot(0)
function [tp,ts,qsi,wn,os] = transient_analysis(a,b,h)
    x = log(b)/(2*h);
    y = acos(a/(2*sqrt(b)))/h;
    
    wn = sqrt(x^2+y^2);
    qsi = sqrt(1-y^2/(y^2+x^2));
    
    tp = %pi/(wn*sqrt(1-qsi^2));
    ts = 4/(qsi*wn);  
    os = exp(-(%pi*qsi)/(sqrt(1-qsi^2)))  
endfunction

[tp_est,ts_est,qsi_est,wn_est,os_est] = transient_analysis(a_est,b_est,h_est)
[tp_ins,ts_ins,qsi_ins,wn_ins,os_ins] = transient_analysis(a_ins,b_ins,h_ins)
