% primeiro devem ser executados eye1.m ou eye2.m para que as mensagens
% formatadas sejam devidamente criadas para que possa transmiti-las pelo
% canal customizável
%% canal 

%%%
% adicionar AWGN                                              'awgn'
% adicionar atraso temporal fracionário aleatório único       'delay'
% adicionar atraso temporal fracionário aleatório por símbolo 'jitter'
% adicionar desvio em fase e frequência aleatórios            'shift' 
% convolver sinal por canal telefônico (Haykin)               'telephone'
% canal Rayleigh com propriedades semi-aleatórias             'rayleigh'  ~need comm toolbox
% canal Rician com propriedades semi-aleatórias               'rician'    ~need comm toolbox
%%%
% as características do canal podem ser inseridas em qualquer ordem, desde
% que estejam após os 3 primeiros argumentos principais

SNR = 30; % relação sinal ruído [dB]
SPS = T.symbol; % número de amostras por símbolo
ch.RZ = kanal(wave.RZ,SNR,SPS,'awgn','delay','telephone');
ch.NRZ = kanal(wave.NRZ,SNR,SPS,'awgn','rician','rayleigh');
ch.sine = kanal(wave.sine,SNR,SPS,'awgn','delay','jitter','telephone');
ch.rcos = kanal(wave.rcos,SNR,SPS,'shift');


%% diagramas de olho

eye.RZ = eyediagram(real(ch.RZ),2*T.symbol,T.symbol,T.symbol/2);      title('RZ eye-diagram');
eye.NRZ = eyediagram(real(ch.NRZ),2*T.symbol,T.symbol,T.symbol/2);    title('NRZ eye-diagram');
eye.sine = eyediagram(real(ch.sine),2*T.symbol,T.symbol,T.symbol/2);  title('Half-sine eye-diagram');
eye.rcos = eyediagram(real(ch.rcos),2*T.symbol,T.symbol);             title('Raised-cosine eye-diagram');   
