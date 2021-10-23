clc,clear
%% 3 BITS CONDITIONS

EbN0 = [0:10];
wait_bar = waitbar(0,'Loading...');
for i = 1:3
   waitbar(i/3, wait_bar);
   [param{i}, msg{i}] = init(EbN0,10^(i+2));  % EbN0 = [0,10]dB, 10^(i+2) bits
   msg{i} = channel(param{i},msg{i});         % pass signal trough channel
   msg{i} = receiver(param{i},msg{i});        % decod signal
   BER{i} = ber(msg{i},EbN0);                 % compute bit error rate
end
Pe = qfunc(sqrt(2*10.^(EbN0/10)));            % compute theoric probability of error
close(wait_bar)

%% PLOT ERROR MEASUREMENTS

for i = 1:length(msg)
    figure;
    hold on, semilogy(EbN0,BER{i}), semilogy(EbN0,Pe);
    title(strcat('BER and P_e comparsion for n=',num2str(length(msg{i}.bits)),' bits'))
    xlabel('EbN0 [dB-Hz]')
    ylabel('Error rate')
    legend('BER', 'P_e')
end
movegui('center');