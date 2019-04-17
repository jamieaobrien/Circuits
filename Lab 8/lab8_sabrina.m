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



