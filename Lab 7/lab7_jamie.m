load('lab7datawithI1ab2.mat')
%% Experiment 1
% In your report, include a single plot showing I1, I2, I1 ? I2, and I1 + I2, as a function of V1 ? V2 
% for all three values of V2 that you used. Do these current–voltage characteristics change significantly 
% as V2 changes? Also include a plot showing the common-source node voltage, V , as a function of V1 ? V2 
% for all three values of V2. How does the value of V change as V1 goes from below V2 to above it?

% For each of the three values of V2 that you used, fit a straight line to the plot of I1 ?I2 as a 
% function of V1 - V2 around the region where V1 ? V2 (i.e., where V1 ? V2 ? 0). The slope of this line is 
% approximately equal to the (incremental) differential-mode transconductance gain of the differential pair
% Find eq for Gm in packet

% Now, set the bias voltage, Vb, so that the bias current is above threshold. For a single value of V2 that is 
% far enough away from the power supply rail to keep the bias transistor saturated, perform these same measurements. 
% You might want to increase slightly the range over which you sweep V1 ? V2 for these measurements. 
% Make plot similar to the ones that you made for the lower bias current. How does the behavior of the circuit 
% change as the bias current changes from weak or moderate inversion to strong inversion?

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


