% Função prcos() gera um pulso com formato 'raised cosine' por intermédio 
% da função @rcosfir, que cria um filtro FIR de resposta ao impulso desejada
function y = prcos(rollfac, length, T)
    % rollfac = 0 até 1 (fator de rolloff);
    % length é a largura do pulso baseado no número de períodos para 
    % truncar a resposta do 'raised cosine' baseado no número T
    % length = 2T+1;
    % T é a taxa de amostras por símbolos sinal
    y=rcosfir(rollfac, length, T, 1, 'normal');
    
    % o campo 'normal' se refere à geração de uma pulso 'raised cosine'
    % normal. para um filtro TX e RX poderia ser utilizado um par de
    % filtros 'root raised cosine' trocando o parâmetro 'normal' por
    % 'sqrt'. estes filtros diferenciam do 'raised cosine', pois sua
    % resposta no domínio da frequência se configura como a raiz quadrada
    % da resposta para o 'raised cosine' normal. isso permite que ao sinal
    % passar pelo filtro TX e RX, na saída do RX obtenha-se um sinal com
    % formatação de 'raised cosine' devido a raiz quadrada do 'root 
    % raised cosine'
end
