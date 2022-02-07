clc
% calculo de cc
z1th = 0.8589 + 1j*1.6296;
z2th = z1th;
z0th = 1.7967 + 1j*2.8326;
z = 1j*0.057;
Rt = 5;

ST = 500e3;
Sb = 100e6;
VB = 13.8e3;
Vb = 380;

IbBT = Sb/(sqrt(3)*Vb);
IbAT = Sb/(sqrt(3)*VB);
ZbBT = Vb^2/Sb;
ZbAT = VB^2/Sb;
ZbT_BT = Vb^2/ST;
ZbT_AT = VB^2/ST;

Z = z * ZbT_AT/ZbAT;

disp("Curtos no PE")
Icc3f = abs(1/(z1th)) * IbAT
Icc2f = abs(1j*sqrt(3)/(2*z1th)) * IbAT
IccFT = abs(3/(2*z1th+z0th)) * IbAT
IccFTm = abs(3/(2*z1th+z0th+3*Rt/ZbAT)) * IbAT
disp("")

disp("Curtos na BT")
Icc3f = abs(1/(z1th+Z)) * IbBT
Icc2f = abs(1j*sqrt(3)/(2*z1th+2*Z)) * IbBT
IccFT = abs(3/(2*z1th+3*Z)) * IbBT
IccFTm = abs(3/(2*z1th+3*Z+3*Rt/ZbBT)) * IbBT
disp("")

% cc referidos na AT
n = 13800/220;
N = 13800/380;

disp("Curtos na AT")
IAcc_3fAT = Icc3f/N
IBcc_3fAT = IAcc_3fAT
ICcc_3fAT = IAcc_3fAT
disp("")
IAcc_2fAT = Icc2f/n
IBcc_2fAT = 2*Icc2f/n
ICcc_2fAT = IAcc_2fAT
disp("")
IAcc_FTAT = IccFT/n
IBcc_FTAT = 0
ICcc_FTAT = IAcc_FTAT
disp("")
IAcc_FTmAT = IccFTm/n
IBcc_FTmAT = 0
ICcc_FTmAT = IAcc_FTmAT