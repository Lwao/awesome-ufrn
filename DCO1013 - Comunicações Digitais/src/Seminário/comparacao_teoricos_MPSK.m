EbN0 = -4:0.5:20; % [dB]

%% ERRADOS
Pb_BPSK = log10(qfunc(sqrt(2*10.^(EbN0/10))));
Pb_QPSK = log10(MPSK_teorico_errado(4, EbN0));
Pb_8PSK = log10(MPSK_teorico_errado(8, EbN0));
Pb_16PSK = log10(MPSK_teorico_errado(16, EbN0));

figure, title('Modulações M-PSK')
hold on, plot(EbN0,Pb_BPSK), plot(EbN0,Pb_QPSK), plot(EbN0,Pb_8PSK), plot(EbN0,Pb_16PSK),
xlabel('E_bN_0 [dB]'), ylabel('log_{10}(P_b)'), set(gca,'ylim',[-8 0]);
legend('BPSK','QPSK','8-PSK','16-PSK')
set(gca,'XGrid','on','YGrid','on')
set(gca,'XTick',[-4:2:20])
set(gca,'XTickLabel',[-4:2:20])
%% CERTOS
Pb_BPSK = log10(qfunc(sqrt(2*10.^(EbN0/10))));
Pb_QPSK = log10(MPSK_teorico_certo(4, EbN0));
Pb_8PSK = log10(MPSK_teorico_certo(8, EbN0));
Pb_16PSK = log10(MPSK_teorico_certo(16, EbN0));

figure, title('Modulações M-PSK')
hold on, plot(EbN0,Pb_BPSK), plot(EbN0,Pb_QPSK,'*'), plot(EbN0,Pb_8PSK), plot(EbN0,Pb_16PSK),
xlabel('E_bN_0 [dB]'), ylabel('log_{10}(P_b)'), set(gca,'ylim',[-8 0]);
legend('BPSK','QPSK','8-PSK','16-PSK')
set(gca,'XGrid','on','YGrid','on')
set(gca,'XTick',[-4:2:20])
set(gca,'XTickLabel',[-4:2:20])