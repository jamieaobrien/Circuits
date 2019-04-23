load('lab9data.mat')
%% Experiment 1
% Construct a current-mirror differential amplifier, as shown in Fig. 9.1, with an nMOS differential pair, 
% two simple pMOS current mirrors, and a simple nMOS current mirror. Set the bias voltage of the differential
% pair so that your bias current is on the order of of microamps, which is in moderate inversion.
% 
% As you did in Lab 8, connect the inverting input to a constant voltage source and sweep
% the noninverting input from one rail to the other, measuring Vout for at least three different
% values of the voltage on the inverting input. In your report, include a single plot showing
% all of these VTCs. How does the behavior of this amplifier compare to that of the simple
% differential amplifier that you investigated in Lab 8?


% Set Vb to .65V

% V1_rails 0:.05:5
% V1_rails vs. Vout_exp1_2, Vout_exp1_3, Vout_exp1_4

% clf;
figure()
plot(V1_rails, Vout_exp1_2, 'b.-')
hold on
plot(V1_rails, Vout_exp1_3, 'r.-')
plot(V1_rails, Vout_exp1_4, 'k.-')

xlabel('V1 (V)')
ylabel('Vout (v)')
legend('V2 = 2V', 'V2 = 3V', 'V2 = 4V')


%% Experiment 2
% For a single value of the inverting input voltage, sweep the noninverting input around the
% inverting one in fine increments while measuring Vout. You should try to get several points
% in the high-gain region. Fit a straight line to the steep part of the curve and determine
% the differential-mode voltage gain of your circuit from the slope of the best-fit line. In your
% report, include a plot showing Vout versus Vdm along with the best-fit line.


% Vdm_fine_incr vs. Vout_exp2
% Vdm_fine_incr -.150:.0025:.150

p2 = polyfit(Vdm_fine_incr(32:34),Vout_exp2(32:34),1);
y2 = polyval(p2,Vdm_fine_incr);

figure
plot(Vdm_fine_incr,Vout_exp2,'b.-')
hold on 
plot(Vdm_fine_incr,y2,'r')

hold off
xlabel('V1-V2 (V)')
ylabel('Output Voltage (V)')
legend('Data','Linear fit')
ylim([-1,6])

Adm = p2(1)
%%
% Next, set the differential-mode input voltage to zero and measure the current flowing into
% the output of the amplifier as you sweep Vout from one rail to the other. Fit a straight line
% to the shallow part of this output current–voltage characteristic, which should correspond
% to the range of output voltages over which the gain of the circuit is large, and determine the
% incremental output resistance of the circuit from the slope of the best-fit line. In your report,
% include a plot showing the output current-voltage characteristic along with the best-fit line.
% 

% Vdm = 0
% Vout_rail vs. Iout_sweep


p3 = polyfit(Vout_rail(40:98),Iout_sweep(40:98),1);
y3 = polyval(p3,Vout_rail);


figure
% Either plot like this or zoom in?
plot(Vout_rail(37:101),Iout_sweep(37:101),'.-')
hold on 
plot(Vout_rail,y3,'r')

hold off
xlabel('Output Voltage (V)')
ylabel('Output Current (A)')
legend('Data','Linear fits')
% ylim([-1e-4,1e-4])


Rout = -1/p3(1)

%%
% Finally, fix the output voltage somewhere in the range of output voltages for which the
% circuit’s gain is large and measure the current flowing out of the amplifier as you sweep Vdm
% around zero. You should sweep Vdm over a sufficiently large range that Iout saturates both
% for positive and for negative values of Vdm. Fit a straight line to the curve around where
% Vdm = 0 and extract a value of the incremental transconductance gain of the circuit with the
% output voltage fixed from the slope of the best-fit line. Also, record the limiting values of
% Iout in both the positive and the negative directions. In your report, include a plot showing
% Iout versus Vdm along with the best-fit line.
% 
% From your incremental output resistance and your incremental transconductance gain,
% compute the differential-mode voltage gain of your circuit. How does this value of for the
% differential-mode gain compare to that which you obtained directly from the slope of the
% VTC? How does the differential-mode gain of this amplifier compare with that of the simple
% one that you investigated in Lab 8?

% Vout = 3
% Vdm_large_range vs. Iout_fixed
% Vdm_large_range -1.5:.025:1.50


% its kind weird, fit is not centered at zero? also dont know to to make the line look best....
% p4 = polyfit(Vdm(28:38),-Iout_fixed(28:38),1);
% y4 = polyval(p4,Vdm);

figure
plot(Vdm_large_range,Iout_fixed,'.-')
% hold on
% plot(Vdm_2,y4,'r')
% hold off
xlabel('V1-V2 (V)')
ylabel('Output Current (A)')
legend('Data','Linear fit')
% ylim([-2e-5,5e-5])
xlim([-.1,.1])

% Gm = p4(1)

%% Experiment 3

% Configure your amplifier as a unity-gain follower by connecting the output to the inverting
% input, as you did in Lab 8. Now, load your follower-connected amplifier with a 1 nF capacitor
% connected between the output of your amplifier and ground.
% 
% Apply a small-amplitude square wave to the input of your circuit and observe both the
% input and output waveforms as a function of time. The peak-to-peak amplitude of your
% square wave should be smaller than the range of differential-mode voltages over which the
% Iout versus Vdm curve that you measured in Experiment 2 was approximately linear. The
% DC offset should be sufficiently large that the bias transistor of the differential pair always
% remains in saturation. Adjust the frequency of the square wave and the total simulation time
% so that you can simultaneously see Vout settle into its final value after both an up-going and
% a down-going step. Is the response symmetrical? Does the amplifier exhibit approximately
% linear behavior? Extract a time constant both for the up-going and for the down-going
% output transitions. How do these compare with that which you compute from the measured
% values of the load capacitance and the differential-mode transconductance gain that you
% found in Experiment 2? In your report, include a single plot showing both scope traces
% along with the extracted time constants.

% Vin_exp3_small vs Vout_exp3_small


%%
% Next, increase the amplitude of your square wave so that it is a couple of volts. Again, the
% DC offset should be sufficiently large that the bias transistor of the differential pair always
% remains in saturation. Adjust the frequency of the square wave and the total simulation time
% so that you can simultaneously see Vout settle into its final value after both an up-going and
% a down-going step. Is the response symmetrical? You will probably notice that the output
% of the amplifier follows a linear trajectory in time over most of its response to the large input
% step. This behavior is called slewing, and the constant rate of change of the output voltage
% with respect to time is called the slew rate of the amplifier. Extract a slew rate for both for
% the up-going and for the down-going output transitions. How do these compare with those
% which you compute from the load capacitance and the limiting values of the output current?
% In your report, include a single plot showing both scope traces along with the extracted slew
% rates.

% Vin_exp3_large vs Vout_exp3_large




%%

p5 = polyfit(V1(30:100),Vout_exp3(30:100),1);
y5 = polyval(p5,Vout_sweep);

figure
plot(V1,Vout_exp3,'.-')
hold on 
plot(V1,y5,'r')
hold off
xlabel('Input Voltage (V)')
ylabel('Output Voltage (V)')
legend('Data','Linear fit')

Gincr = p5(1)

% V1 vs Vout_Vin
p6 = polyfit(V1(30:80),Vout_Vin(30:80),1);
y6 = polyval(p6,Vout_sweep);

figure
plot(V1,Vout_Vin,'.-')
% hold on
% plot(V1,y6,'r')
% hold off
xlabel('Input Voltage (V)')
ylabel('Vout - Vin (V)')
legend('Data','Linear fit')
