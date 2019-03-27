%% Exp. 2 Vin vs. Vout

p1 = polyfit(Vin2_100(70:90),Vout2_100(70:90),1); %V1 is the x axis, I1 is the y axis, 1 gives us linear coefficients (y=mx+b so p1=[m b])
y1 = polyval(p1,Vin2_100); % generates y values using the coefficents from polyfit

figure()
plot(Vin2_100,Vout2_100,'Marker','.','MarkerSize',8);
hold on
plot(Vin2_1000,Vout2_1000,'Marker','.','MarkerSize',8);
plot(Vin2_10k,Vout2_10k,'Marker','.','MarkerSize',8);
plot(Vin2_100,y1, 'k--');
legend('100 Ohm Resistor','1k Ohm Resistor','10k Ohm Resistor','Best fit line (m = 1.001)','Location','northwest')
xlabel('Input Voltage (V)')
ylabel('Output Voltage (V)')
title('Applied Input Voltage Vs. Voltage Across Transistor')





%% Exp. 2 Vin vs. log(Iin)

%Making best fit line
segment_Vin2_100 = Vin2_100(42:62);
segment_Iin2_100 = log(Iin2_100(42:62));
p2 = polyfit(segment_Vin2_100,segment_Iin2_100,1); %V1 is the x axis, I1 is the y axis, 1 gives us linear coefficients (y=mx+b so p1=[m b])
y1 = polyval(p2,Vin2_100); % generates y values using the coefficents from polyfit
%plot(segment_Vin2_100,y1,'m-') % plot the line of best fit (x axis is still our V1)
jjj = p2(2) + p2(1).*Vin2_100;
figure()
semilogy(Vin2_100,Iin2_100,'Marker','.','MarkerSize',8);
hold on
semilogy(Vin2_1000,Iin2_1000,'Marker','.','MarkerSize',8);
semilogy(Vin2_10k,Iin2_10k,'Marker','.','MarkerSize',8);
semilogy(Vin2_100(6:end),exp(y1),'m-')
legend('100','1000','10000')
xlabel('Input Voltage (V)')
ylabel('Input Current (log(A))')



%% Exp. 2 Vin vs. log(Iin)
clf
pR100 = polyfit(Vin2_100(1:30),Iin2_100(1:30),1); %V1 is the x axis, I1 is the y axis, 1 gives us linear coefficients (y=mx+b so p1=[m b])
yR100 = polyval(pR100,Vin2_100(1:45)); % generates y values using the coefficents from polyfit
rootR100 = roots(pR100);

plot(Vin2_100,Iin2_100);
hold on
plot(Vin2_100(1:45),yR100)
xlabel('Input Voltage (V)')
ylabel('Input Current (A)')
title('100 Ohm Resistor')
legend('100 Ohm Resistor','Best fit line (x-intercept = .6558V)')

%%
pR1000 = polyfit(Vin2_1000(1:30),Iin2_1000(1:30),1); %V1 is the x axis, I1 is the y axis, 1 gives us linear coefficients (y=mx+b so p1=[m b])
yR1000 = polyval(pR1000,Vin2_1000(1:45)); % generates y values using the coefficents from polyfit
rootR1000 = roots(pR1000);

clf
plot(Vin2_1000,Iin2_1000);
hold on
plot(Vin2_1000(1:45),yR1000)
xlabel('Input Voltage (V)')
ylabel('Input Current (A)')
title('1000 Ohm Resistor')
legend('1000 Ohm Resistor','Best fit line (x-intercept = .6029V)')


%%
pR10k = polyfit(Vin2_10k(1:35),Iin2_10k(1:35),1); %V1 is the x axis, I1 is the y axis, 1 gives us linear coefficients (y=mx+b so p1=[m b])
yR10k = polyval(pR10k,Vin2_10k(1:50)); % generates y values using the coefficents from polyfit
rootR10k = roots(pR10k);

clf
plot(Vin2_10k,Iin2_10k);
hold on
plot(Vin2_10k(1:50),yR10k)
xlabel('Input Voltage (V)')
ylabel('Input Current (A)')
title('10k Ohm Resistor')
legend('10k Ohm Resistor','Best fit line (x-intercept = .5482V)')

%% Making Ion as func of R
clf
Ut = 1/p2(1);
Rs = [100, 1000, 10000];
Ions_theoretical = Ut.*(1./Rs)



Ions = [Iin2_100(35), Iin2_1000(40), Iin2_10k(46)]
loglog(Rs, Ions, 'bo');
hold on
loglog(Rs, Ions_theoretical);
xlabel('Resistance (log(Ohms))')
ylabel('Current (log(A))')
title('Ion as function of R')
legend('Measured values for Ion','Theoretical: Ion = Ut/R, Ut = .0258V')


%% Making Von as func of R
clf
Is = exp(p2(2));

Vons = [.6558, .6029, .5482];
Vons_theoretical = Ut.*log(Ions_theoretical./Is);
semilogx(Rs, Vons, 'bo');
hold on
semilogx(Rs, Vons_theoretical);
xlabel('Resistance (log(Ohms))')
ylabel('Voltage (V)')
title('Von as function of R')
legend('Measured values for Von','Theoretical: Von = Ut*log(Ion/Is), Ut = .0258V, Is = 4.167e-15A')







