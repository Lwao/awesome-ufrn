function msg = channel(param,msg)
    snr = 10.^(param.SNR/10);                 % transform SNR from dB to linear
    m = param.size*param.SPS;                 % length of version of msg
    n = length(param.EbN0);                   % number of versions of the msg based in EbN0 size
    complex = randn(n,m)+1j*randn(n,m);       % complex gaussian vector
    amplitude = sqrt(1./snr(:));              % noise amplitude (standard deviation)
    noise = repmat(amplitude,1,m).*complex;   % AWGN matrix
    msg.noisy = repmat(msg.pam,n,1) + noise;  % noisy nrz message
end

