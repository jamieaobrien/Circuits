load('Lab2Data.mat')
%% Experiment 1 
 spacingCurrent = logspace(-2, -9);
 spacingVoltage = linspace(0.7460, .3191);
%% Voltage-Current Characteristic
plot(Vin1b,Iin1b)
xlabel('Current (A)')
ylabel('Voltage (V)')
t1 = exp(log(Is) + (Vin1b./uT));
%%
fit1(Vin1b, Iin1b,g)


%% Extract Saturation Current and Thermal Voltage
d = log(Iin1a);
p = polyfit(Vin1a,d,1)
y = polyval(p,Vin1a)
plot(Vin1a,log(Iin1a),'o')
hold on
plot(Vin1a,y)
b = p(1)
m = p(2)
uT = 1/m
Is = exp(b)
g = ((1/m).*Vin1a) + b;
% plot(Vin1a,g,'*')
legend('Experimental','Is = 3.0681e-16, uT = -0.0307')
xlabel('Voltage (V)')
ylabel('Log of Current')


%% Semi-log of Voltage-current, current-voltage, and theoretical
clf
b = p(2)
m = p(1)
uT = 1/m
Is = exp(b)
f = Is*exp(-Vin1a./uT);
g = (m.*Vin1a) + b;

semilogy(Vin1a,Iin1a)
hold on
semilogy(Vin1b,Iin1b)
semilogy(Vin1a,exp(g))
xlabel('Current (A)')
ylabel('Voltage (V)')
legend('Current-Voltage Characteristic','Voltage-Current Characteristic','Is = 6.8568e-15 A, uT = 0.0623 V')

%% loglog
rd =diff(Vin1a)./diff(Iin1a);
loglog(Iin1a(1:end-1),rd,'o')
hold on
t = uT./Iin1a;
loglog(Iin1a,t)
legend('Experimental','uT = 0.0263 V')
xlabel('Current (A)')
ylabel('Incremental Diode Resistance (Ohms)')
 %% Exp. 2

figure()
plot(Vin2_100,Vout2_100);
hold on
plot(Vin2_1000,Vout2_1000);
plot(Vin2_10k,Vout2_10k);
legend('100','1000','10000')


%%

L1 = log(Iin2_100(1:68));
L2 = log(Iin2_1000(1:68));
L3 = log(Iin2_10k(1:68));

fit2(Vin2_100(1:68),Vin2_1000(1:68),Vin2_10k(1:68),y1(1:68),L1,L2,L3)