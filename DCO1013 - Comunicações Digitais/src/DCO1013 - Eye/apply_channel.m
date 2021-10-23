% primeiro devem ser executados eye1.m ou eye2.m para que as mensagens
% formatadas sejam devidamente criadas para que possa transmiti-las pelo
% canal customiz�vel
%% canal 

%%%
% adicionar AWGN                                              'awgn'
% adicionar atraso temporal fracion�rio aleat�rio �nico       'delay'
% adicionar atraso temporal fracion�rio aleat�rio por s�mbolo 'jitter'
% adicionar desvio em fase e frequ�ncia aleat�rios            'shift' 
% convolver sinal por canal telef�nico (Haykin)               'telephone'
% canal Rayleigh com propriedades semi-aleat�rias             'rayleigh'  ~need comm toolbox
% canal Rician com propriedades semi-aleat�rias               'rician'    ~need comm toolbox
%%%
% as caracter�sticas do canal podem ser inseridas em qualquer ordem, desde
% que estejam ap�s os 3 primeiros argumentos principais

SNR = 30; % rela��o sinal ru�do [dB]
SPS = T.symbol; % n�mero de amostras por s�mbolo
ch.RZ = kanal(wave.RZ,SNR,SPS,'awgn','delay','telephone');
ch.NRZ = kanal(wave.NRZ,SNR,SPS,'awgn','rician','rayleigh');
ch.sine = kanal(wave.sine,SNR,SPS,'awgn','delay','jitter','telephone');
ch.rcos = kanal(wave.rcos,SNR,SPS,'shift');


%% diagramas de olho

eye.RZ = eyediagram(real(ch.RZ),2*T.symbol,T.symbol,T.symbol/2);      title('RZ eye-diagram');
eye.NRZ = eyediagram(real(ch.NRZ),2*T.symbol,T.symbol,T.symbol/2);    title('NRZ eye-diagram');
eye.sine = eyediagram(real(ch.sine),2*T.symbol,T.symbol,T.symbol/2);  title('Half-sine eye-diagram');
eye.rcos = eyediagram(real(ch.rcos),2*T.symbol,T.symbol);             title('Raised-cosine eye-diagram');   
