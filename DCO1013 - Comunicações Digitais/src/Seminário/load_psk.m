clc, clear
psk2 = load('bpsk_sim');
psk4 = load('qpsk_sim');
psk8 = load('psk8_sim');
psk16 = load('psk16_sim');

EbN0 = psk2.gain;

figure, title('Modulações M-PSK')
hold on, 

ax1 = plot(EbN0,log10(psk2.ber),'*');
ax2 = plot(EbN0,log10(psk4.ber/log2(4)),'*');
ax3 = plot(EbN0,log10(psk8.ber/log2(8)),'*');
ax4 = plot(EbN0,log10(psk16.ber/log2(16)),'*');

ax1 = plot(EbN0,log10(psk2.pe)); 
ax2 = plot(EbN0,log10(psk4.pe)); 
ax3 = plot(EbN0,log10(psk8.pe)); 
ax4 = plot(EbN0,log10(psk16.pe));

legend([ax1,ax2,ax3,ax4],'BPSK','QPSK','8-PSK','16-PSK')

set(gca,'XTick',[-4:2:20])
set(gca,'XTickLabel',[-4:2:20])

xlabel('E_bN_0 [dB]'), ylabel('log_{10}(P_b)'), set(gca,'ylim',[-6 0]);
set(gca,'XGrid','on','YGrid','on')


