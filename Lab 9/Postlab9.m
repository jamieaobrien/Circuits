%%
load('Postlab9data.mat')

%%
clf;
plot(time, Vv1_low)
hold on;
plot(time, Vvout_low)

xlabel('Time (s)')
ylabel('Voltage (V)')
legend('V1: .75V to 1V ', 'Vout')
xlim([0,2e-5])

Vc_a = .75 + (1-.75)*.63
Tau_a = [4.50986607142609e-06]-[1.08789062500000e-06]
% 
% Time_const_1a = ([1.20507812500000e-06]-[8.79312053568309e-06])*.63
% 
% 



%% 
clf;
plot(time1, Vv1_mid)
hold on;
plot(time1, Vvout_mid)

xlabel('Time (s)')
ylabel('Voltage (V)')
legend('V1: 2.5V to 2.75V ', 'Vout')
xlim([0,2e-5])



Vc_b = 2.5 + (2.75-2.5)*.63
Tau_b = [5.02883928571181e-06]-[1e-06]

% Time_const_2a = ([1.14648437500000e-06] - [9.05818749996879e-06])*.63


%% 
clf;
plot(time2, Vv1_high)
hold on;
plot(time2, Vvout_high)

xlabel('Time (s)')
ylabel('Voltage (V)')
legend('V1: 4.4V to 4.75V ', 'Vout')
xlim([0,2e-5])


Vc_c = 4.4 + (4.75-4.4)*.63
Tau_c = [7.04613839285466e-06]

%%
clf;
p3 = polyfit(log(time2(24:45)),log(Vvout_high(24:45)),1);
y3 = time2.^p3(1).*exp(p3(2))


loglog(time2, Vv1_high)
hold on;
loglog(time2, Vvout_high)
plot(time2, y3)
