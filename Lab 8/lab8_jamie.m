load('lab8data.mat')


%% Experiment 2

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