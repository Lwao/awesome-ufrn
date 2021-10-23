% Gerar diagramas de olho para mensagens bin�rias formatadas por 
% diferentes formatos de pulsos
clear;clc;

%% dados e par�metros
T.symbol = 64;                             % n�mero de amostras por cada per�odo de s�mbolo
msg.size = 400;                            % n�mero de s�mbolos na mensagem
msg.data = sign(randn(1,msg.size));        % mensagem PAM bin�ria aleat�ria 
msg.dataup = upsample(msg.data, T.symbol); % gera trem de impulsos com T.symbol amostras por s�mbolo que codifica a mensagem

%% forma de onda dos trens de pulsos
wave.RZ = conv(msg.dataup,prz(T.symbol));     % filtragem da mensagem com pulso RZ             
wave.RZ = wave.RZ(1:end-T.symbol+1);          % trem de pulsos RZ polar 
wave.NRZ = conv(msg.dataup,pnrz(T.symbol));   % filtragem da mensagem com pulso NRZ
wave.NRZ = wave.NRZ(1:end-T.symbol+1);        % trem de pulsos NRZ polar
wave.sine = conv(msg.dataup,psine(T.symbol)); % filtragem da mensagem com pulso meia senoide          
wave.sine = wave.sine(1:end-T.symbol+1);      % trem de pulsos HS polar

T.rcos=4; % n�mero de per�odos para truncar a resposta do filtro 
wave.rcos = conv(msg.dataup,prcos(0.5,T.rcos,T.symbol)); % filtragem da mensagem com pulso RC (rolloff = 0.5)  
wave.rcos = wave.rcos(2*T.rcos*T.symbol:end-2*T.rcos*T.symbol+1); % trem de pulsos RC polar

%% diagramas de olho

eye.RZ = eyediagram(wave.RZ,2*T.symbol,T.symbol,T.symbol/2);      title('RZ eye-diagram');
eye.NRZ = eyediagram(wave.NRZ,2*T.symbol,T.symbol,T.symbol/2);    title('NRZ eye-diagram');
eye.sine = eyediagram(wave.sine,2*T.symbol,T.symbol,T.symbol/2 ); title('Half-sine eye-diagram');
eye.rcos = eyediagram(wave.rcos,2*T.symbol,T.symbol);             title('Raised-cosine eye-diagram');   

% eyediagram
% 1� eyediagram: vetor de dados
% 2� argumento: n�mero de amostras que ser�o tra�adas por ciclo na janela
% 3� argumento: define os r�tulos do eixo x para -#argumento/2 at� #argumento/2
% 4� argumento: causa um deslocamento de #argumento+1 no sinal que vai aparecer na janela 

% em geral, a fun��o @eyediagram prepara um vetor 't' para acompanhar o
% vetor sinal 'x' para plotar: plot(t,x); tal que 't' � um vetor de 
% valores peri�dicos definidos pelos argumentos da fun��o @eyediagram e 
% que permitem que esses trechos peri�dicos que coincidem com as posi��es
% de 'x', permitir�o que valores sequenciais de 'x' sejam plotados, 
% repetidamente no mesmo trecho da janela restrita pelos argumentos 
% do @eyediagram
