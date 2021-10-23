% Fun��o prcos() gera um pulso com formato 'raised cosine' por interm�dio 
% da fun��o @rcosfir, que cria um filtro FIR de resposta ao impulso desejada
function y = prcos(rollfac, length, T)
    % rollfac = 0 at� 1 (fator de rolloff);
    % length � a largura do pulso baseado no n�mero de per�odos para 
    % truncar a resposta do 'raised cosine' baseado no n�mero T
    % length = 2T+1;
    % T � a taxa de amostras por s�mbolos sinal
    y=rcosfir(rollfac, length, T, 1, 'normal');
    
    % o campo 'normal' se refere � gera��o de uma pulso 'raised cosine'
    % normal. para um filtro TX e RX poderia ser utilizado um par de
    % filtros 'root raised cosine' trocando o par�metro 'normal' por
    % 'sqrt'. estes filtros diferenciam do 'raised cosine', pois sua
    % resposta no dom�nio da frequ�ncia se configura como a raiz quadrada
    % da resposta para o 'raised cosine' normal. isso permite que ao sinal
    % passar pelo filtro TX e RX, na sa�da do RX obtenha-se um sinal com
    % formata��o de 'raised cosine' devido a raiz quadrada do 'root 
    % raised cosine'
end
