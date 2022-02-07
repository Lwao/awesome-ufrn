1.a.

Os sistemas PV isolados funcionam fornecendo energia diretamente aos equipamentos elétricos de um consumidor de energia elétrica. Neste caso, como o fornecimento de energia pelo sistema PV e o uso simultâneo pelos equipamentos pode não ocorrer, há o risco de desperdício da energia gerada. Portanto, bancos de bateria podem ser utilizados para armazenar a energia gerada enquanto não for utilizada.

Já os sistemas conectados atuam interligados com a rede de energia elétrica da concessionária, portanto o fluxo energético utilizado em um consumidor que possui geração PV pode ser bidirecional, permitindo o uso da energia da rede quando não houver geração PV, ou fornecimento de excedente gerado para a rede elétrica (neste caso a concessionária credita a energia forneceida à rede pelo consumidor). O banco de bateriais ainda é válido para este caso, principalmente nos casos do corte (temporário ou não) do fornecimento pela rede, restando apenas um sistema PV isolado.

1.b.

Uma célula PV é, essencialmente, um material semicondutor formado por uma junção PN. Quando energia luminosa incide sobre essa junção, os fótons transferem energia aos elétrons do material tipo-n e estes se separam do átomo, assim entrando em movimento. A conexão de uma carga aos terminais dessa junção PN permite extrair a energia elétrica do movimento dos elétrons livres.

1.c. 

- Célula PV: estrutura elementar de conversão PV, sendo essencialmente um único diodo.
- Módulo PV: conjunto de células PV protegido das ações do ambiente sobre a estrutura das células.
- Painel PV: conjunto de módulos PV montados em uma única estrutura.
- Arranjo PV: conjunto de módulos/painéis PV que são associados em série e/ou paralelo para fornecer uma saída única em corrente contínua de maior potência e/ou tensão que a gerada por um único módulo/painel.

1.d.

Ambos os sistema PV de único de duplo estágio possuem a mesma estrutura considerando após o banco de capacitores que forma o barramento CC, i.e. o barramento CC fornece o nível de tensão ao inversor e este fornece a tensão alternada à rede elétrica mediada por um filtro de conexão (dos tipos L, LC ou LCL) para remoção de componentes harmônicas de alta ordem e, também realiza o controle para rastreio do ponto de máxima potência do painel PV. Porém, estes possuem suas diferenças na região que separa o painel PV e o barramento CC. Assim

O sistema PV de único estágio possui conexão direta do painel PV com o barramento CC, com custo relativamente baixo pois só dispõe das chaves utilizadas no inversor. Já o sistema de duplo estágio possui essa conexão intermediada por um conversor *boost*. 

O sistema de estágio único necessita que o arranjo PV esteja de certa forma que forneça a tensão de operação (mínimo número de painéis em série) do barramento CC, porém no duplo estágio esse requisito é eliminado, pois o conversor *boost* elevará à tensão desejada. Também a primeira dificulta a implementação do MPPT devido à tensão variável do barramento CC, enquanto que no segundo caso essa tensão é fixada pelo controle do conversor *boost*, no geral facilitando o controle. Considerando a tensão altamente variável do barramento CC, maiores capacitores são necessários para reduzir as flutuações, enquanto que no segundo caso menores capacitores podem ser usador. Porém o duplo estágio introduz maior número de chaves, assim aumentando as perdas.


2.. De acordo com o arranjo apresentado, a tensão total do módulo configura-se pelo equivalente gerado pela associação de 8 células em série em cada *string*, portanto:

$\begin{aligned}
    V_{mod} = 8 \cdot V_{cell} = 8 \cdot 0.5 = 4 \; V
\end{aligned}$

Sendo $V_{cell} = 0.5 \; V$.

Como cada célula contribui com uma potência $P_{cell} = 2 \; W$, a potência total do módulo é a soma da potência de cada célula individual, uma vez que são 4 *strings* paralelas de 8 células cada, ao todo são $n = 4 \cdot 8 = 32$ células, resultando em:

$\begin{aligned}
    P_{mod} = P_{cell} \cdot n = 2 \cdot 32 = 64 \; W
\end{aligned}$

Assim a corrente do módulo é:

$\begin{aligned}
    I{mod} = \frac{P_{mod}}{V_{mod}} = \frac{64}{4} = 16 \; A
\end{aligned}$

3.. Considerando as STC como uma densidade de irradiância de $G=1000 \; W/m^2$ e $T=25 \; \degree C$. Tem-se que o desvio padrão da distribuição de incidência solar é $\sigma = 3 \; h$, portanto a energia gerada pelo módulo durante o dia pode ser encontrada dependendo da sua potência máxima $P_{max} = 200 \; W_p$, assim $E_{ger} = P_{max} \sqrt{2\pi}\sigma = 200 \cdot \sqrt{2\pi} \cdot 3 = 1.5 \; kWh$. 

Nestas condições torna-se impossível descobrir a energia incidente sobre o módulo, pois esta poderia ser encontrada a partir da combinação entre as condições ambientais e as dimensões físicas da placa. Em segundo caso poderia ser computado pela eficiência da placa, uma vez já conhecido critérios de potência.

4.. Considera-se: $I_o = 0.1 \; \mu A$, $I_s = 1 \; A$, $T = 30 \degree C = 303.15 \; K$.

A tensão térmica é: $V_T = \frac{kT}{q} = \frac{1.38 \cdot 10^{-23} \cdot 303.15}{1.602 \cdot 10^{-19}} = 0.026114 \; V$.

Portanto a tensão de circuito aberto pode ser encontrada considerando que a corrente do módulo PV é aquela que passa pelo diodo que o modela $I_d=I_s$, isso resulta em: $V_{oc} = V_T * ln(\frac{I_s}{I_o}+1) = 0.42 \; V$.

No caso da corrente de curto circuito, como não haverá tensão sobre o diodo que modela o módulo PV, esta corrente será a mesma que a corrente solar: $I_{sc} = I_s = 1 \; A$.