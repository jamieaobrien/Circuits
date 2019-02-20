%% Exp. 2 Vin vs. Vout

figure()
plot(Vin2_100,Vout2_100);
hold on
plot(Vin2_1000,Vout2_1000);
plot(Vin2_10k,Vout2_10k);
legend('100','1000','10000')
xlabel('Input Voltage (V)')
ylabel('Output Voltage (V)')

%% Exp. 2 Vin vs. log(Iin)

%Making best fit line
segment_Vin2_100 = Vin2_100(42:62);
segment_Iin2_100 = log(Iin2_100(42:62));
p1 = polyfit(segment_Vin2_100,segment_Iin2_100,1); %V1 is the x axis, I1 is the y axis, 1 gives us linear coefficients (y=mx+b so p1=[m b])
y1 = polyval(p1,Vin2_100); % generates y values using the coefficents from polyfit
%plot(segment_Vin2_100,y1,'m-') % plot the line of best fit (x axis is still our V1)

figure()
semilogy(Vin2_100,Iin2_100);
hold on
semilogy(Vin2_1000,Iin2_1000);
semilogy(Vin2_10k,Iin2_10k);
semilogy(Vin2_100, Iin2_100);
legend('100','1000','10000')
xlabel('Input Voltage (V)')
ylabel('Input Current (log(A))')



%% Exp. 2 Vin vs. log(Iin)

figure()
plot(Vin2_100,Iin2_100);
xlabel('Input Voltage (V)')
ylabel('Input Current (A)')
figure()
plot(Vin2_1000,Iin2_1000);
xlabel('Input Voltage (V)')
ylabel('Input Current (A)')
figure()
plot(Vin2_10k,Iin2_10k);
xlabel('Input Voltage (V)')
ylabel('Input Current (A)')


