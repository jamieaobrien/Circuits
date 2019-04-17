load('lab8data.mat')
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
plot(V1, Vout2, 'b.-')
hold on
plot(V1, Vout3, 'r.-')
plot(V1, Vout4, 'k.-')

xlabel('V1 (V)')
ylabel('Vout (v)')
legend('V2 = 2V', 'V2 = 3V', 'V2 = 4V')

%% Plot for  bias, Vb at 1.5V
% clf;
figure()
plot(V1, Vout_above2, 'b.-')
hold on
plot(V1, Vout_above3, 'r.-')
plot(V1, Vout_above4, 'k.-')

xlabel('V1 (V)')
ylabel('Vout (v)')
legend('V2 = 2V', 'V2 = 3V', 'V2 = 4V')


%% Experiment 2
% For a single value of V2, sweep V1 around V2 in fine increments while measuring Vout. Fit a straight 
% line to the steep part of the curve and determine the differential-mode voltage gain of your circuit
% from the slope of the best-fit line. In your report, include a plot showing Vout versus Vdm along with
% the best-fit line. 

% V2 = 3V

p2 = polyfit(Vdm(32:34),Vout_exp2(32:34),1);
y2 = polyval(p2,Vdm);


figure
plot(Vdm,Vout_exp2,'b.-')
hold on 
plot(Vdm,y2,'r')

hold off
xlabel('V1-V2 (V)')
ylabel('Output Voltage (V)')
legend('Data','Linear fit')
ylim([-1,6])

%%
% Next, set the differential-mode input voltage to zero and measure the current flowing into the output 
% of the amplifier as you sweep Vout from one rail to the other. Fit a straight line to the shallow part 
% of this output current–voltage characteristic, which should correspond to the range of output voltages over which the gain of the circuit is large, and determine the incremental output resistance of the circuit from the slope of the best-fit line. In your report, include a plot showing the output current-voltage characteristic along with the best-fit line. Finally, fix the output voltage somewhere in the middle of the range of output voltages for which the circuit’s gain is large and measure the current flowing out of the amplifier as you sweep V1 around V2. Fit a straight line to the curve around where V1 = V2 and extract a value of the incremental transconductance gain of the circuit with the output voltage fixed 3 from the slope of the best-fit line. In your report, include a plot showing Iout versus Vdm along with the best-fit line.


p3 = polyfit(Vout_exp2(32:34),Iout_fixed(32:34),1);
y3 = polyval(p3,Vout_exp2);


figure
plot(Vout_exp2,Iout_fixed,'.-')
hold on 
plot(Vout_exp2,y3,'r')

hold off
xlabel('Output Voltage (V)')
ylabel('Output Current (A)')
legend('Data','Linear fits')
ylim([-1e-4,1e-4])


p4 = polyfit(Vdm(30:37),Iout_fixed(30:37),1);
y4 = polyval(p4,Vdm);

figure
plot(Vdm,Iout_fixed,'.-')
hold on
plot(Vdm,y4,'r')
hold off
xlabel('V1-V2 (V)')
ylabel('Output Current (A)')
legend('Data','Linear fit')
ylim([-4e-5,2e-5])

%% Experiment 3

%Vout_Vin_exp3
p5 = polyfit(Vout_sweep(30:100),Vout_exp3(30:100),1);
y5 = polyval(p5,Vout_sweep);

figure
plot(Vout_sweep,Vout_exp3,'.-')
hold on 
plot(Vout_sweep,y5,'r')
hold off
xlabel('Input Voltage (V)')
ylabel('Output Voltage (V)')
legend('Data','Linear fit')


%Vout_Vin_diff_exp3
p6 = polyfit(Vout_sweep(30:80),Vout_Vin(30:80),1);
y6 = polyval(p6,Vout_sweep);

figure
plot(Vout_sweep,Vout_Vin,'.-')
hold on
plot(Vout_sweep,y6,'r')
hold off
xlabel('Input Voltage (V)')
ylabel('Vout - Vin (V)')
legend('Data','Linear fit')
