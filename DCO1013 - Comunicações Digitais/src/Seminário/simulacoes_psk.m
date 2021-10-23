gain=[-4:0.5:20];

%% BPSK
clearvars -except gain
for n=1:length(gain)
    EbN0=gain(n);
    sim('BPSK');
    ber(n) = ErrorVec(1);
end
pe = qfunc(sqrt(2*10.^(gain/10)));
hold on, plot(gain,log10(ber),'*'), plot(gain,log10(pe))
save('bpsk_sim.mat','ber','pe','gain')

%% QPSK
clearvars -except gain
for n=1:length(gain)
    EbN0=gain(n);
    sim('QPSK');
    ber(n) = ErrorVec(1);
end
M = 4;
pe = MPSK_teorico_certo(M,gain);
hold on, plot(gain,log10(ber),'*'), plot(gain,log10(pe))
save('qpsk_sim.mat','ber','pe','gain')

%% 8-PSK
clearvars -except gain
for n=1:length(gain)
    EbN0=gain(n);
    sim('PSK8');
    ber(n) = ErrorVec(1);
end
M = 8;
pe = MPSK_teorico_certo(M,gain);
save('psk8_sim.mat','ber','pe','gain')

%% 16-PSK
clearvars -except gain
for n=1:length(gain)
    EbN0=gain(n);
    sim('PSK16');
    ber(n) = ErrorVec(1);
end
M = 16;
pe = MPSK_teorico_certo(M,gain);
save('psk16_sim.mat','ber','pe','gain')