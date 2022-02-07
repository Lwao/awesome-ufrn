clc,clear;

k1=13.5;
k2=1;

tms_cons=[0.9;0.2]; % 51/51N
tms_conc=[0.15;0.2]; % 51/51N
pickup_cons=[20.4;390;0.2*30;240]; % 51/50/51N/50N
pickup_conc=[2.8;26;0.5;15]*120; % 51/50/51N/50N
I=[1e0:1e5];

t_fase_cons=(k1*tms_cons(1))./((I/pickup_cons(1)).^k2-1);
t_fase_conc=(k1*tms_conc(1))./((I/pickup_conc(1)).^k2-1);

t_neutro_cons=(k1*tms_cons(2))./((I/pickup_cons(3)).^k2-1);
t_neutro_conc=(k1*tms_conc(2))./((I/pickup_conc(3)).^k2-1);

t_fase_cons(I>=pickup_cons(2))=0.05;
t_fase_conc(I>=(26*120))=0.07;

t_neutro_cons(I>=pickup_cons(4))=0.05;
t_neutro_conc(I>=(15*120))=0.07;

I_ANSI=348.6;
t_ANSI=4;

I_INRUSH=126;
t_INRUSH=0.1;

t51ns_cons=3;
t51ns_conc=5;

I51ns_cons=I(I>=4.8);
I51ns_conc=I(I>=12);

figure;
hold on;
title('Coordenograma de fase');
loglog(I, t_fase_cons, 'k-', 'linewidth', 2) 
loglog(I, t_fase_conc, 'k--', 'linewidth', 2) 
scatter(I_ANSI, t_ANSI, [], 'k', 'c', 'filled');
scatter(I_INRUSH, t_INRUSH, [], 'k', 'c', 'filled');
text (I_ANSI-0.5e2, t_ANSI-1e0, "ANSI");
text (I_INRUSH-0.3e2, t_INRUSH-3e-2, "INRUSH");
text (2.4e1, 4e2, "51");
text (3.7e2, 7e2, "51");
text (4.3e2, 6.5e-2, "50");
text (3.4e3, 9e-2, "50");
xlim([1.6e1 1e4])
ylim([3e-2 1e3])
xlabel('Corrente (A)');
ylabel('Tempo (s)');
legend(['Consumidor';'Concessionaria']);
grid minor;
hold off;

figure;
hold on;
title('Coordenograma de neutro');
loglog(I, t_neutro_cons, 'k-', 'linewidth', 2) 
loglog(I, t_neutro_conc, 'k--', 'linewidth', 2) 
loglog(I51ns_cons, t51ns_cons*ones(length(I51ns_cons),1), 'k-', 'linewidth', 1)
loglog(I51ns_conc,t51ns_conc*ones(length(I51ns_conc),1), 'k--', 'linewidth', 1)
text(8.5e0, 1.6e1, "51N");
text(6.8e1, 1.7e2, "51N");
text(2.6e2, 6.5e-2, "50N");
text(2e3, 9e-2, "50N");
text(6.5e3, t51ns_cons+1, "51NS");
text(6.5e3, t51ns_conc+2, "51NS");
xlim([5e0 1e4])
ylim([3e-2 3e2])
xlabel('Corrente (A)');
ylabel('Tempo (s)');
legend(['Consumidor';'Concessionaria']);
grid minor;
hold off;