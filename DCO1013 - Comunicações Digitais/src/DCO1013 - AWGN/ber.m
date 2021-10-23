function BER = ber(msg,EbN0)
    for i = 1:length(EbN0)
        BER(i) = mean(double(msg.decod(i,:) ~= msg.nrz)); % bit error rate
    end
end