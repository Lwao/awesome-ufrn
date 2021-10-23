//DEFININDO A FUNÇÃO vs PARA SER POSTERIORMENTE RETIFICADA
t = [0:1/6000:8191/6000]
v = 34*cos(2*%pi*377*t)

//ZERANDO AS COMPONENTES NEGATIVA DO SINAL
for i = 1:1:8192
    if v(i) < 0 then
     v(i) = 0; 
   else v(i) = v(i);
   end,
end

//PLOTANDO O GRÁFICO DE v1[n]=v[n]
plot(v) 
xlabel('tempo em segundos');
ylabel('amplitude);

n = length(v);
f = fft(v);

half = n/2; 
mag(1:half) = abs(f(half+1:n));
mag(half+1:n) = abs(f(1:half));

frequencies = [-3000:6000/8192:3000-1/8192]
//espectro de amplitude na faixa -3000Hz a 3000Hz
plot2d3(frequencies, mag)
xlabel('frequência em Hertz');
ylabel('amplitude');


//FILTRO PASSA BAIXA
h=iir(6, 'lp', 'butt', 16/6000, [0 0]);
B=coeff(h(2)); 
B=B(7:-1:1);
A=coeff(h(3));
A=A(7:-1:1);
[hzm, fr]=frmag(B, A, 512);

//RESULTADO DO FILTRADO
g = filter(B, A, v);

//CENTRANDO AS COMPONENTES FILTRADAS NO PONTO (0,0)
ff = fft(g);

half = n/2;
mag2(1:half) = abs(ff(half+1:n));
mag2(half+1:n) = abs(ff(1:half));

//ESPECTRO DE AMPLITUDE DO SINAL FILTRADO NA FAIXA DE -3000hZ a 3000Hz 
plot(frequencies, mag2)



