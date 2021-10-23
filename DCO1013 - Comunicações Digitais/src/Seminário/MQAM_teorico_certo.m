function Pb = MQAM_teorico_certo(M, EbN0)
    EbN0 = 10.^(EbN0/10);
    acc1 = 2*(1-1/sqrt(M))/log2(sqrt(M));
    acc2 = sqrt(3*log2(sqrt(M))/(M-1)*2*EbN0);
    Pb = acc1*qfunc(acc2);
end