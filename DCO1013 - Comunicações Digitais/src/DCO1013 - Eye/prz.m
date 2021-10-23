% Fun��o prz() gera um pulso retangular RZ de largura T/2
function pout=prz(T)
    % a fun��o implementa o vetor como a concatena��o de dois vetores de
    % 'zeros' na extremidade e de largura T/4; com mais um vetor de 'uns'
    % no meio de largura T/2
    pout=[zeros(1,T/4) ones(1,T/2) zeros(1,T/4)];
end