% Gerar diagramas de olho para mensagens binárias formatadas por 
% diferentes formatos de pulsos
clear;clc;

%% dados e parâmetros
T.symbol = 64;                             % número de amostras por cada período de símbolo
msg.size = 400;                            % número de símbolos na mensagem
msg.data = sign(randn(1,msg.size));        % mensagem PAM binária aleatória 
msg.dataup = upsample(msg.data, T.symbol); % gera trem de impulsos com T.symbol amostras por símbolo que codifica a mensagem

%% forma de onda dos trens de pulsos
wave.RZ = conv(msg.dataup,prz(T.symbol));     % filtragem da mensagem com pulso RZ             
wave.RZ = wave.RZ(1:end-T.symbol+1);          % trem de pulsos RZ polar 
wave.NRZ = conv(msg.dataup,pnrz(T.symbol));   % filtragem da mensagem com pulso NRZ
wave.NRZ = wave.NRZ(1:end-T.symbol+1);        % trem de pulsos NRZ polar
wave.sine = conv(msg.dataup,psine(T.symbol)); % filtragem da mensagem com pulso meia senoide          
wave.sine = wave.sine(1:end-T.symbol+1);      % trem de pulsos HS polar

T.rcos=4; % número de períodos para truncar a resposta do filtro 
wave.rcos = conv(msg.dataup,prcos(0.5,T.rcos,T.symbol)); % filtragem da mensagem com pulso RC (rolloff = 0.5)  
wave.rcos = wave.rcos(2*T.rcos*T.symbol:end-2*T.rcos*T.symbol+1); % trem de pulsos RC polar

%% diagramas de olho

eye.RZ = eyediagram(wave.RZ,2*T.symbol,T.symbol,T.symbol/2);      title('RZ eye-diagram');
eye.NRZ = eyediagram(wave.NRZ,2*T.symbol,T.symbol,T.symbol/2);    title('NRZ eye-diagram');
eye.sine = eyediagram(wave.sine,2*T.symbol,T.symbol,T.symbol/2 ); title('Half-sine eye-diagram');
eye.rcos = eyediagram(wave.rcos,2*T.symbol,T.symbol);             title('Raised-cosine eye-diagram');   

% eyediagram
% 1º eyediagram: vetor de dados
% 2º argumento: número de amostras que serão traçadas por ciclo na janela
% 3º argumento: define os rótulos do eixo x para -#argumento/2 até #argumento/2
% 4º argumento: causa um deslocamento de #argumento+1 no sinal que vai aparecer na janela 

% em geral, a função @eyediagram prepara um vetor 't' para acompanhar o
% vetor sinal 'x' para plotar: plot(t,x); tal que 't' é um vetor de 
% valores periódicos definidos pelos argumentos da função @eyediagram e 
% que permitem que esses trechos periódicos que coincidem com as posições
% de 'x', permitirão que valores sequenciais de 'x' sejam plotados, 
% repetidamente no mesmo trecho da janela restrita pelos argumentos 
% do @eyediagram
