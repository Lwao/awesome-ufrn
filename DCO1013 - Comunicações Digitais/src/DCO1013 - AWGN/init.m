function [param,msg] = init(EbN0,size)
    param.Eb = 1;                                     % bit energy                       [W]  
    param.Rb = 1;                                     % bit rate                         [bps]
    param.Fs = 1;                                     % sampling rate                    [Hz]
    param.SPS = param.Fs/param.Rb;                    % number of samples per bit        [1/bit]
    param.EbN0 = EbN0;                                % normalized signal-to-noise ratio [dB-Hz]
    param.size = size;                                % number of bits in the message    [bits]
    param.SNR = param.EbN0+10*log10(2/param.SPS);     % signal-to-noise ratio            [dB]

    param.shape_filter = ones(1,param.SPS);           % rectangular pulse shape filter
    msg.bits = round(rand(1,param.size));             % custom random message
    msg.nrz = (2*msg.bits-1);                         % message converted to NRZ
    msg.pam = upsample(msg.nrz, param.SPS);           % upsample message
    msg.pam = filter(param.shape_filter, 1, msg.pam); % interpolation of points 
end