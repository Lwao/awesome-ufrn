clc, clear
Z0 = 45;       % characteristic impedance of line [Ohms]
ZL = 50;       % load impedance [Ohms]
t = 0:10;      % time duration [ns]
I = 3.5;       % source current [mA]
VS(1) = Z0*I;  % initial source voltage 
VL(1) = 0;     % initial load voltage
gammaL = (ZL-Z0)/(ZL+Z0); % ref. coef. at load
gammaS = 1;               % ref. coef. at source
for i = 2:length(t)
   if(mod(i,2) == 0) % if even index or odd time value
       VS(i) = VS(i-1); % keeps previous value
       VL(i) = VS(i-1)+(VS(i-1)-VL(i-1))*gammaL; 
   else
       VS(i) = VL(i-1)+(VL(i-1)-VS(i-1))*gammaS; 
       VL(i) = VL(i-1); % keeps previous value
   end
end

figure, hold on, stairs(t,VS), stairs(t,VL)
title(strcat('Voltage in each end of the line for: Z_0 = ', num2str(Z0), '\Omega'))
legend('V(0)', 'V(l)', 'Location', 'southeast')
xlabel('Time [ns]')
ylabel('Voltage [mV]')
grid on