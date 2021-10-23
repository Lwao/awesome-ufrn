function out = kanal(varargin) %in, SNR, SPS
    in = varargin{1};       % input signal
    SNR = varargin{2};      % signal-to-noise ratio
    SPS = varargin{3};      % sample per symbol
    
    flag_awgn = false;      % channel with awgn
    flag_shift = false;     % channel with freq+phase shift
    flag_delay = false;     % channel with single time delay
    flag_jitter = false;    % channel with jitter
    flag_telephone = false; % channel with telephone channel characteritics (Haykin)
    flag_rayleigh = false;  % Rayleigh channel with random path delays/gains and default properties
    flag_rician = false;    % Rician channel with random path delays/gains and default properties
    
    for i=4:nargin % activate necessary flags
        if(ischar(varargin{i}))
            flag_awgn = flag_awgn + (length(varargin{i})==length('awgn') && all(varargin{i}=='awgn'));
            flag_shift = flag_shift + (length(varargin{i})==length('shift') && all(varargin{i}=='shift'));
            flag_delay = flag_delay + (length(varargin{i})==length('delay') && all(varargin{i}=='delay'));
            flag_jitter = flag_jitter + (length(varargin{i})==length('jitter') && all(varargin{i}=='jitter'));
            flag_telephone = flag_telephone + (length(varargin{i})==length('telephone') && all(varargin{i}=='telephone'));
            flag_rayleigh = flag_rayleigh + (length(varargin{i})==length('rayleigh') && all(varargin{i}=='rayleigh'));
            flag_rician = flag_rician + (length(varargin{i})==length('rician') && all(varargin{i}=='rician'));
        end
    end
    
    n = length(in); % modulated noiseless signal size
    out = in;       % signal distorted by channel
    
    %% AWGN
    out = (1-flag_awgn)*out+flag_awgn*awgn(out,SNR); % noisy message
    %% <0.1% random frequency shift + random phase shift
    err = rand*0.001; % percentage of frequency error 
    ang= 2*pi*rand; % random phase shift
    out = out .* exp(flag_shift*(2j*pi*[0:n-1]*err/SPS + 1j*ang));
    %% delay (the max. delay is equivalent to a complete symbol)
    vfd = dsp.VariableFractionalDelay('InterpolationMethod', 'FIR');
    out = (1-flag_delay)*out(:) + flag_delay*step(vfd,out(:),rand*SPS);
    out = out';
    %% jitter (random delay in each symbol)
    release(vfd);
    clearvars vfd
    temp = [];
    out = out(:);
    vfd = dsp.VariableFractionalDelay('InterpolationMethod', 'FIR');
    for i = 1:floor(n/SPS)
        temp = [temp; step(vfd,out((i-1)*SPS+1:SPS*i),rand*SPS/2)];
        release(vfd);
    end
    temp(end:n) = 0;
    out = (1-flag_jitter)*out(:) + flag_jitter*temp;
    out = out';
    %% telephone channel
    A = [1,-2.838,3.143,-1.709,0.458,-0.049]; 
    B = 0.1*[1,-1];
    out = (1-flag_telephone)*out+flag_telephone*filter(B,A,out);
    %% Rayleigh channel
    rayleighchan = comm.RayleighChannel(...
    'SampleRate',10000*SPS, ...
    'PathDelays',[rand*2 rand*3 rand*1 rand*5]*1e-6, ...
    'AveragePathGains',[rand*1.1 rand*1.2 rand*1.3 rand*1.4], ...
    'NormalizePathGains',true, ...
    'MaximumDopplerShift',SPS/10, ...
    'RandomStream','mt19937ar with seed', ...
    'Seed',30);
     out = (1-flag_rayleigh)*out(:)+flag_rayleigh*step(rayleighchan,out(:));
     out = out';
     %% Rician channel
     ricianchan = comm.RicianChannel(...
    'SampleRate',10000*SPS, ...
    'PathDelays',[rand*2 rand*3 rand*1 rand*5]*1e-6, ...
    'AveragePathGains',[rand*1.1 rand*1.2 rand*1.3 rand*1.4], ...
    'KFactor',2.8,...
    'DirectPathDopplerShift',5.0,...
    'DirectPathInitialPhase',0.5,...
    'MaximumDopplerShift',SPS/10,...
    'RandomStream','mt19937ar with seed', ...
    'Seed',30, ...
    'PathGainsOutputPort',true);
     out = (1-flag_rician)*out(:)+flag_rician*step(ricianchan,out(:));
     out = out';
end