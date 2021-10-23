clc, clear
qam4 = load('qam4_sim');
qam8 = load('qam8_sim');
qam16 = load('qam16_sim');
qam64 = load('qam64_sim');

EbN0 = qam4.gain;

figure, title('Modulações M-QAM')
hold on, 

ax1 = plot(EbN0,log10(qam4.ber/log2(4)),'*');
ax2 = plot(EbN0,log10(qam8.ber/log2(8)),'*');
ax3 = plot(EbN0,log10(qam16.ber/log2(16)),'*');
ax4 = plot(EbN0,log10(qam64.ber/log2(64)),'*');

ax1 = plot(EbN0,log10(qam4.pe)); 
ax2 = plot(EbN0,log10(qam8.pe)); 
ax3 = plot(EbN0,log10(qam16.pe)); 
ax4 = plot(EbN0,log10(qam64.pe));

set(gca,'XTick',[-4:2:20])
set(gca,'XTickLabel',[-4:2:20])

legend([ax1,ax2,ax3,ax4],'4-QAM','8-QAM','16-QAM','64-QAM')
xlabel('E_bN_0 [dB]'), ylabel('log_{10}(P_b)'), set(gca,'ylim',[-6 0]);
set(gca,'XGrid','on','YGrid','on')


