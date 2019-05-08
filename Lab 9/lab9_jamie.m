plot(Times,Channel1V,'.-')
hold on
plot(Times,Channel2V,'.-')
xlabel('Time (s)') 
ylabel('Voltage (V)')
legend('Input wave','Output wave')
xlim([0,1e-3])

%%
clf;

p4 = polyfit(Times(3800:5000),Channel2V1(3800:5000),1);
y4 = polyval(p4,Times);

p5 = polyfit(Times(5500:6300),Channel2V1(5500:6300),1);
y5 = polyval(p5,Times);

plot(Times,Channel1V1,'.-')
hold on 
plot(Times,Channel2V1,'.-')
plot(Times,y4)
plot(Times,y5)
xlabel('Time (s)')
ylabel('Voltage (V)')
legend('Input wave','Output wave')
xlim([-1e-3,2e-3])
ylim([1,5])

% p4 = polyfit(Times(3900:4900),Channel2V1(3900:4900),1);
% y4 = polyval(p4,Times);