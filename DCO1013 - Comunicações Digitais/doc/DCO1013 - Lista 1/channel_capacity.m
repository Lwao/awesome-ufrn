clc, clear
SNR = -50:200;
B = [1e3,10e3,100e3]; 
for i=1:length(B) C(i,:) = B(i)*log2(1+10.^(SNR/10)); end
semilogy(SNR,C)
xlabel('Signal-to-noise ratio (dB)')
ylabel('Channel capacity (bps)')
legend('1kHz','10kHz','100kHz')
legend('Location','southeast')

