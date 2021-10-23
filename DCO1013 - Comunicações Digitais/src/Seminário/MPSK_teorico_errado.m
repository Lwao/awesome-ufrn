function Pb = MPSK_teorico_errado(M, EbN0)
    EbN0 = 10.^(EbN0/10);
    Pb = 2*qfunc(sqrt(2*EbN0)*sin(pi/M));
end