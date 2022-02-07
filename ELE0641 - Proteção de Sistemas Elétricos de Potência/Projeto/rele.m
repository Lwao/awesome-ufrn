clc,clear;

k = 1.1;
Icar_max = 17.57;
RTC = 30;
Icc2f = 321;
tap51 = [k*Icar_max/RTC, Icc2f/RTC]

Icar_max = 17.57;
RTC = 30;
Icc3f = 320;
tap50 = [8*Icar_max/RTC, Icc3f/RTC]

Icar_max = 17.57;
RTC = 30;
Iccftm = 188;
tap51n = [0.1*Icar_max/RTC, Iccftm/RTC]

Icar_max = 17.57;
RTC = 30;
Iccft = 194;
tap50n = [8*0.3*Icar_max/RTC, Iccft/RTC]

RTC = 30;
tap51 = 0.68
tap50 = 13
tap51n = 0.2
tap50n = 8
disp("")
ajusteCarga = (RTC*tap51/Icar_max - 1)*100
pickup51 = RTC*tap51
pickup50 = RTC*tap50
pickup51n = RTC*tap51n
pickup50n = RTC*tap50n
disp("")
t51 = (13.5*0.15)/((2271/(120*2.8))^1-1) - 0.2
tms = (t51/13.5)*((2271/(RTC*tap51))^1-1)
m=20;
Ilim = m*RTC*tap51n
t51n = (13.5*0.2)/((Ilim /(120*0.2))^1-1) - 0.2
tms = (t51n/13.5)*((Ilim /(RTC*tap51n))^1-1)