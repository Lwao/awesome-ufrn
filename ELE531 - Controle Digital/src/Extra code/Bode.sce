limit = 10000;
s = poly(0, "s");
P_EST = syslin('c', 10/(s^2+2*s+25));
P_INS = syslin('c', 2/(s*(s+0.5)));


// margens de estabilidade
[MF_p, fcg_p] = p_margin(P_EST);
[MG_p, fcf_p] = g_margin(P_EST);
fcg_p = 2*%pi*fcg_p;
fcf_p = 2*%pi*fcf_p;
[MF_ppd, fcg_ppd] = p_margin(P_INS);
[MG_ppd, fcf_ppd] = g_margin(P_INS);
fcg_ppd = 2*%pi*fcg_ppd;
fcf_ppd = 2*%pi*fcf_ppd;

bode(P_EST);

printf("Stability margins (P_EST)\nMF = %f°\nMG = %f dB\nfcg = %f rad/s\nfcf = %f rad/s", MF_p, MG_p, fcg_p, fcf_p);
printf("Stability margins (P_INS)\nMF = %f°\nMG = %f dB\nfcg = %f rad/s\nfcf = %f rad/s", MF_ppd, MG_ppd, fcg_ppd, fcf_ppd);

