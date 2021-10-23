limit = 10000;
s = poly(0, "s");
//planta
P = syslin('c', 2/(s*(s+0.5)));
//planta+PD
P_PD = syslin('c', 2.4271*(1+0.573302*s)*2/(s*(s+0.5)));


//plots de Bode e Nyquist

//bode(P);
//xname("Diagramas de Bode da planta")
//figure;
//nyquist(P);
//xname("Diagrama de Nyquist da planta")
//figure;
//bode(P_PD);
//xname("Diagramas de Bode da planta com PD")
//figure;
//nyquist(P_PD);
//xname("Diagrama de Nyquist da planta com PD")

// margens de estabilidade
[MF_p, fcg_p] = p_margin(P);
[MG_p, fcf_p] = g_margin(P);
fcg_p = 2*%pi*fcg_p;
fcf_p = 2*%pi*fcf_p;
[MF_ppd, fcg_ppd] = p_margin(P_PD);
[MG_ppd, fcf_ppd] = g_margin(P_PD);
fcg_ppd = 2*%pi*fcg_ppd;
fcf_ppd = 2*%pi*fcf_ppd;

printf("Stability margins (P)\nMF = %f°\nMG = %f dB\nfcg = %f rad/s\nfcf = %f rad/s", MF_p, MG_p, fcg_p, fcf_p);
printf("Stability margins (P+PD)\nMF = %f°\nMG = %f dB\nfcg = %f rad/s\nfcf = %f rad/s", MF_ppd, MG_ppd, fcg_ppd, fcf_ppd);

