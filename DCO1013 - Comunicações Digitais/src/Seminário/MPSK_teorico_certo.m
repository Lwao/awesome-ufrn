function Pb = MPSK_teorico_certo(M, EbN0)
    EbN0 = 10.^(EbN0/10);
    Pb = 2*qfunc(sqrt(2*EbN0*log2(M))*sin(pi/M))/log2(M);
end