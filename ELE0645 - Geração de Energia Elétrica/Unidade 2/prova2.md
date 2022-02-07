1..

A curva IxV da corrente em função da tensão de um módulo PV mostra como a física do semicondutor das células se comportam, permitindo compreender os pontos em que a existe a corrente de curto circuito e a tensão de circuito aberto, mas também como máximo valor de tensão limita o máximo valor de corrente. A partir disso obtém-se a curva PxV da potência em função da tensão, que sendo um reflexo da curva anterior, mostra como o joelho da curva apresenta o ponto de máxima potência.

No contexto de variação de irradiação, observa-se um deslocamento vertical da curva IxV de forma a obter correntes maiores para os mesmos valores de tensão, fazendo com que o joelho da curva PxV se estenda superiormente. Já no contexto de aumento de temperatura, o deslocamento é horizontal na curva IxV, exigindo menores tensões para gerar uma mesma corrente do que situações com menor temperatura. Na curva PxV o efeito é semelhante ao caso anterior, porém deslocando o joelho no sentido superior direito com a diminuição de temperatura.

2.. 

- Topologia de 1 estágio: a tensão do barramento CC é diretamente fornecida pelo módulo PV, portanto as formas de se controlar essa tensão é manter um grande arranjo para garantir a potência e alta capacitância de barramento para evitar flutuações; usa apenas um ivnersor de tensão para conversão CC/CAe é responsável por todo o controle;
- Topologia de 2 estágios: a tensão do barramento CC é a saída de um conversor Boost conectado aos módulos PV, permitindo melhor controle da tensão do barramento; no segundo estágio possui um inversor de tensão para conversão CC/CA com mais facilidade no controle devido a tensão fixa do barramento CC;

No rastreamento de máxima potência o método P&O s eabseia em realizar reduções ou aumentos de tensões e observar o sentido do gradiente de potência. No caso de um gradiente negativo, o sistema está à direita do ponto de máxima potência e vice-versa. Assim o controle deve buscar zerar o gradiente para encotnrar o joelho da curva PxV.

3.. 

- Turbina do tipo 1: turbina de velocidade fixa; gerador de indução a gaiola de esquilo;  saída do gerador diretamente conectada à rede sem conversão de potência; possui caixa multiplicadora para conversão de menor para maior velocidade; pode possuir controle de pitch; precisa de banco de capacitores pois o gerador sempre consumo da rede;
- Turbina do tipo 2: possui gerador de rotor bobinado; pelo tipo do gerador, pode-se utilizar uma resistência e ao regular o consumo de potência dessa resistência, também variando o escorregamento, consequentemente com uma turbina operando em velocidades variáveis para trabalhar com faixa variável de velocidades de vento; na necessidade de menor potência requerida pela rede, mais potência deve ser destinada à reisstência; há caixa multiplicadora; necessita de bancod e capacitores;
- Turbina do tipo 3: possui gerador de indução duplamente alimentado (DFIG); além do gerador de rotor bobina, possui dois conversores injetando tensão variável no circuito do rotor a uma frequência e fase variáveis; esses covnersores são bidirecionais (CC/CA ou CA/CC); há caixa multiplicadora;
- Turbina do tipo 4: não há caixa multiplicadora; gerador síncrono com imã permanente ou elétrico; em alguns casos pode ser um gerador de indução; o gerador deve possuir um alto número de polos para reduzir a velocidade sícnrona; maior nacelle, maior turbina; um conversor de potência entre a rede e o gerador controla a frequência variável para uma fixa;

4.. 

De acordo com o gráfico, o ponto A indica a velocidade mínima em que a turbina é capaz de gerar potência. 

Entre A  e B, a potência de saída da turbina é uma função cúbica da velocidade e do ângulo de inclinação. Neste intervalo o ângulo de inclinação é controlado para que a turbina opere sempre próximo ao seu fator de performance máximo, gerantindo o maior aproveitamento da energia do vento. 

O ponto B representa o início da faixa em que a potência é limitada ao limite permitido pela turbina. Qualquer aumento de velocidade além desse ponto não deve gerar aumento da potência, ao risco de danificar a turbina. Ao exceder a velocidade além do ponto B e também pelo ponto C, a máquina deve ser capaz de desperdiçar a energia do vento para a turbina operar em seu limite de potência. Esse controle é feito pelo ajuste do ângulo de inclinação para que seja produzido menos arrasto.

O ponto D representa o limite máximo de velocidade determinado pela estrutura da turbina, além desse limiar as pás estremessem devido à força centrípeta imposta pelo vento e a potência tende a cair. O controle deve ser capaz de frear para que não chegue essa velocidade e/ou ajustar o ângulo de inclinação para que reduza o coeficiente de performance para zero.