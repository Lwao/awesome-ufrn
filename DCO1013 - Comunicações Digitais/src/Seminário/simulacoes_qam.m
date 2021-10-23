gain=[-4:0.5:20];

%% 4-QAM
clearvars -except gain
for n=1:length(gain)
    EbN0=gain(n);
    sim('QAM4');
    ber(n) = ErrorVec(1);
end
M = 4;
pe = MQAM_teorico_certo(M, gain);
% hold on, plot(gain,log10(ber/log2(M)),'*'), plot(gain,log10(pe))
save('qam4_sim.mat','ber','pe','gain')

%% 8-QAM
clearvars -except gain
for n=1:length(gain)
    EbN0=gain(n);
    sim('QAM8');
    ber(n) = ErrorVec(1);
end
M = 8;
pe = MQAM_teorico_certo(M, gain);
% hold on, plot(gain,log10(ber/log2(M)),'*'), plot(gain,log10(pe))
save('qam8_sim.mat','ber','pe','gain')

%% 16-QAM
clearvars -except gain
for n=1:length(gain)
    EbN0=gain(n);
    sim('QAM16');
    ber(n) = ErrorVec(1);
end
M = 16;
pe = MQAM_teorico_certo(M, gain);
% hold on, plot(gain,log10(ber/log2(M)),'*'), plot(gain,log10(pe))
save('qam16_sim.mat','ber','pe','gain')

%% 64-QAM
clearvars -except gain
for n=1:length(gain)
    EbN0=gain(n);
    sim('QAM64');
    ber(n) = ErrorVec(1);
end
M = 64;
pe = MQAM_teorico_certo(M, gain);
% hold on, plot(gain,log10(ber/log2(M)),'*'), plot(gain,log10(pe))
save('qam64_sim.mat','ber','pe','gain')

%%

% pe4 = mqam_ber(4, gain);
% pe8 = mqam_ber(8, gain);
% pe16 = mqam_ber(16, gain);
% pe64 = mqam_ber(64, gain);
% 
% hold on, plot(gain,log10(pe4)), plot(gain,log10(pe8)), plot(gain,log10(pe16)), plot(gain,log10(pe64))
% legend('4','8','16','64')