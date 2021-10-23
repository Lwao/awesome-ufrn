clc, clear
%% MESSAGES INITIALIZATION
[param1,msg1] = init(5,100);  % EbN0 = 5dB, 100 bits
[param2,msg2] = init(10,100); % EbN0 = 10dB, 100 bits

msg1 = channel(param1,msg1);
msg2 = channel(param2,msg2);

%% PLOTS

max1 = 1.5*max(max(real(msg1.noisy),imag(msg1.noisy)));
max2 = 1.5*max(max(real(msg2.noisy),imag(msg2.noisy)));

figure;
hold on, constellation(msg1.noisy, max1), constellation(msg1.pam, max1)
title('Noisy and pure binary baseband polar for EbN0 = 5 dB');
legend('Noisy','Pure'); hold off

figure;
hold on, constellation(msg2.noisy, max2), constellation(msg2.pam, max2) 
title('Noisy and pure binary baseband polar for EbN0 = 10 dB');
legend('Noisy','Pure'); hold off