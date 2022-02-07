1.. O número de pás influencia no coeficiente de performance da turbina eólica. Do ponto de vista técnico, o aumento no número de pás geram benefícios como menor ruído, maior área de cobertura e baixo custo. Porém como o TSR é reduzido ao aumentar o número de pás, costumeiramente realiza-se uma troca, permitindo o uso de 3 pás em turbinas modernas para evitar-se turbulência e redução na eficiência em demasia.

2.. O torque gerado pelas duas pás é dado por:

$\begin{aligned}
    T = n \cdot d \cdot F \cdot c = 8000 \; Nm
\end{aligned}$

Onde: $n=2$ é o número de pás na turbina, $d=20 \; m$ a distância do centro de gravidade da pá até o rotor, $F=1000 \; N$ a força exercida por cada pá e $c = 0.2$ o coeficiente de arrasto.

Caso as pás girem a $\omega = 30 \; rpm = \frac{2\pi}{60}30 \; rad/s$, a potência total gerada pela turbina é:

$\begin{aligned}
    P = T \cdot \omega \approx 25 \; kW
\end{aligned}$


3.. Ainda considerando a mesma turbina do item 2, a expressão para seu coeficiente de performance $C_p(TSR) = 0.4 sin(TSR)$ permite descobrir o $C_p$ máximo, assim:

$\begin{aligned}
    \frac{dC_p}{dTSR} = 0.4 cos(TSR) = 0
\end{aligned}$

O valor de $TSR$ que satisfaz a expressão é $TSR=1.57$, permitindo um coeficiente de performance máximo de:

$\begin{aligned}
    C_{p,max}(1.57) = 0.4 sin(1.57) = 0.4
\end{aligned}$

Assim, para este coeficiente de performance e os dados do item anterior, tem-se uma potência de:

$\begin{aligned}
    P_{out} = C_{p,max} \cdot P = 0.4 \cdot 25000 \approx 10 \; kW
\end{aligned}$

4.. Como a velocidade no lado de alta velocidade deve ser $n_{high} = 910 \; rpm$ e a relação de engrenagens é $n_{high}/n_{low} = 200$, facilmente encontra-se a velocidade de rotação no lado de baixa velocidade: $n_{low} = 4.55 \; rpm$.

Essa velocidade rotacional pode ser convertida para a velocidade linear da ponta da pá, que posteriormente será utilizada para encontrar o $TSR$ para a velocidade do vento oferecida $w = 10 \; m/s$. Dessa forma, tem-se:

$\begin{aligned}
    v_{tip} = n_{low} \cdot \pi d  \cdot \frac{1}{60} = 4.55 \cdot 5\pi \cdot \frac{1}{60} = 1.19 \; m/s
\end{aligned}$

Assim o $TSR$ mínimo será:

$\begin{aligned}
    TSR = \frac{v_{tip}}{w} = \frac{1.19}{10} = 0.119
\end{aligned}$

5.. Os principais componentes da geração eólica são:

- Torre: mantém as pás de rotação em uma altitude suficiente para garantir máxima exposição às rajadas de vento;
- Pás de rotação: fabricadas em materiais poliméricos, comprimentos que variam de 5 a 60 metros, responsáveis por capturar a força cinética do vento;
- Rotor: ponto de acoplamento das pás e transmite o movimento rotativo para o eixo de rotação lento;
- Nacelle: compartimento localizado no topo da torre e possui caixa multiplicadores, gerador, chassis, sistema de controle eletrônico, sistema hidráulico e sistema de guinada para girar as pás para o ponto de maior velocidade do vento;
- Caixa multiplicadora: responsável por transformar as rotações das pás de baixa velocidade em alta velocidade, com saída conectada ao eixo de alta velocidade e fornece velocidade suficiente para o gerador funcionar;
- Gerador: conversor da energia mecânica de giro em energia elétrica.