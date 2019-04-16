load('lab7datawithI1ab2.mat')
%% Experiment 1
% Construct a differential amplifier with an nMOS differential pair and a pMOS current mirror. 
% Set the bias voltage so that your bias current is just at threshold. Connect V2 to a constant
% voltage source and sweep V1 from one rail to the other, measuring Vout for at least three 
% different values of V2 that are above the bias voltage. In your report, include a single plot 
% showing all of these voltage transfer characteristics (VTCs). Repeat this experiment for an 
% above-threshold bias current. Does the behavior of the circuit differ substantially when biased 
% in strong inversion compared to that which it exhibits in weak or moderate inversion?


% Plot for just at threshold, Vb at .65V
% clf;
figure()
plot(V1, Vout2, 'b')
hold on
plot(V1, Vout3, 'r')
plot(V1, Vout4, 'k')

xlabel('V1 (V)')
ylabel('Vout (v)')
legend('V2 = 2V', 'V2 = 3V', 'V2 = 4V')

%% Plot for  bias, Vb at 1.5V
% clf;
figure()
plot(V1, Vout_above2, 'b')
hold on
plot(V1, Vout_above3, 'r')
plot(V1, Vout_above4, 'k')

xlabel('V1 (V)')
ylabel('Vout (v)')
legend('V2 = 2V', 'V2 = 3V', 'V2 = 4V')



%%

Idiff2 = I1bb2 - I2bb2;
Isum2 = I1bb2 + I2bb2;
Idiff3 = I1bb3 - I2bb3;
Isum3 = I1bb3 + I2bb3;
Idiff4 = I1bb4 - I2bb4;
Isum4 = I1bb4 + I2bb4;

plot(Vdm,I1bb2,'b.')
hold on
plot(Vdm,I2bb2,'b.-')
plot(Vdm,Idiff2,'b')
plot(Vdm,Isum2,'b:')
plot(Vdm,I1bb3,'r.')
plot(Vdm,I2bb3,'r.-')
plot(Vdm,Idiff3,'r')
plot(Vdm,Isum3,'r:')
plot(Vdm,I1bb4,'k.')
plot(Vdm,I2bb4,'k.-')
plot(Vdm,Idiff4,'k')
plot(Vdm,Isum4,'k:','MarkerSize',5)
xlabel('V1-V2 (V)')
ylabel('Current (A)')
legend('I1,V2=2V','I2,V2=2V','I1-I2,V2=2V','I1+I2,V2=2V','I1,V2=3V','I2,V2=3V','I1-I2,V2=3V','I1+I2,V2=3V','I1,V2=4V','I2,V2=4V','I1-I2,V2=4V','I1+I2,V2=4V','Location','eastoutside')
%%
figure
plot(Vdm,Vbb2,'b.')
hold on
plot(Vdm,Vbb3,'r.')
plot(Vdm,Vbb4,'k.')
xlabel('V1-V2 (V)')
ylabel('Voltage @ Node V (V)')
legend('V2=2V','V2=3V','V2=4V','Location','Northwest')

%%

p2 = polyfit(Vdm(40:60),Idiff2(40:60),1);
p3 = polyfit(Vdm(40:60),Idiff3(40:60),1);
p4 = polyfit(Vdm(40:60),Idiff4(40:60),1);
y2 = polyval(p2,Vdm);
y3 = polyval(p3,Vdm);
y4 = polyval(p4,Vdm);

plot(Vdm,Idiff2,'b.')
hold on
plot(Vdm,Idiff3,'r.')
plot(Vdm,Idiff4,'k.')
plot(Vdm(20:80),y2(20:80),'b')
plot(Vdm(20:80),y3(20:80),'r')
plot(Vdm(20:80),y4(20:80),'k')
xlabel('V1-V2 (V)')
ylabel('I1-I2 (A)')
ylim([-1e-6,1e-6])
legend('V2=2V','V2=3V','V2=4V','V2=2V fit','V2=3V fit','V2=4V fit','Location','Northwest')

ylim([-(10^(-6)) 10^(-6)])



%%
load('Lab7NewABData.mat')
figure
Idiffab = I1ab2 - I2ab2;
Isumab = I1ab2 + I2ab2;
figure
plot(Vdm,I1ab2,'b.')
hold on
plot(Vdm,I2ab2,'r.')
plot(Vdm,Idiffab,'k.')
plot(Vdm,Isumab,'m.')
xlabel('V1-V2 (V)')
ylabel('Current (A)')
legend('I1','I2','I1-I2','I1+I2','Location','northwest')

figure 
plot(Vdm2,Vab2,'b.')
xlabel('V1-V2 (V)')
ylabel('Voltage @ Node V (V)')


