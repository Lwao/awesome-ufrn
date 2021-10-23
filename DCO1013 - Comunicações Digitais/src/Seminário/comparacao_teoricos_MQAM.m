EbN0 = -4:0.5:20; % [dB]

%% ERRADOS
Pb_QAM4 = log10(MQAM_teorico_errado(4, EbN0));
Pb_QAM8 = log10(MQAM_teorico_errado(8, EbN0));
Pb_QAM16 = log10(MQAM_teorico_errado(16, EbN0));
Pb_QAM64 = log10(MQAM_teorico_errado(64, EbN0));

figure, title('Modulações M-QAM')
hold on, plot(EbN0,Pb_QAM4), plot(EbN0,Pb_QAM8), plot(EbN0,Pb_QAM16), plot(EbN0,Pb_QAM64),
xlabel('E_bN_0 [dB]'), ylabel('log_{10}(P_b)'), set(gca,'ylim',[-8 0]);
legend('4-QAM','8-QAM','16-QAM','64-QAM')
set(gca,'XGrid','on','YGrid','on')
set(gca,'XTick',[-4:2:20])
set(gca,'XTickLabel',[-4:2:20])
%% CERTOS
Pb_QAM4 = log10(MQAM_teorico_certo(4, EbN0));
Pb_QAM8 = log10(MQAM_teorico_certo(8, EbN0));
Pb_QAM16 = log10(MQAM_teorico_certo(16, EbN0));
Pb_QAM64 = log10(MQAM_teorico_certo(64, EbN0));

figure, title('Modulações M-QAM')
hold on, plot(EbN0,Pb_QAM4), plot(EbN0,Pb_QAM8), plot(EbN0,Pb_QAM16), plot(EbN0,Pb_QAM64),
xlabel('E_bN_0 [dB]'), ylabel('log_{10}(P_b)'), set(gca,'ylim',[-8 0]);
legend('4-QAM','8-QAM','16-QAM','64-QAM')
set(gca,'XGrid','on','YGrid','on')
set(gca,'XTick',[-4:2:20])
set(gca,'XTickLabel',[-4:2:20])