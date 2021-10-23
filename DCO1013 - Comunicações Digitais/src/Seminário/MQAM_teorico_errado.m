function Pb = MQAM_teorico_errado(M, EbN0)
    EbN0 = 10.^(EbN0/10);
    acc1 = 2*(M-1)/M;
    acc2 = sqrt(6*log2(M)*EbN0/(M^2-1));
    Pb = acc1*qfunc(acc2);
end