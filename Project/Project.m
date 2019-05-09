%%
figure
plot(v1,IxU1DRAIN, 'k')
hold on
plot(v1,IxU4DRAIN, 'b')
plot(v1,IxU7DRAIN, 'c')
plot(v1,IxU10DRAIN, 'm')
plot(v1,IxU15DRAIN, 'r')
plot(v1,IxU18DRAIN, 'k-*')
plot(v1,IxU21DRAIN, 'b-*')

xlabel('Gate Voltage (V)')
ylabel('Drain Current (A)')
legend('Ix0', 'Ix1', 'Ix2', 'Ix3', 'Ix4', 'Ix5', 'Ix6')

%%
figure
semilogy(v1,IxU4DRAIN, 'b')
hold on
semilogy(v1,IxU1DRAIN, 'k')
semilogy(v1,IxU7DRAIN, 'c')
semilogy(v1,IxU10DRAIN, 'm')
semilogy(v1,IxU15DRAIN, 'r')
semilogy(v1,IxU18DRAIN, 'k-*')
semilogy(v1,IxU21DRAIN, 'b-*')

xlabel('Gate Voltage (V)')
ylabel('Drain Current (A)')
legend('Ix0','Ix1', 'Ix2', 'Ix3', 'Ix4', 'Ix5', 'Ix6')
%%
figure
semilogy(v1,IxU4DRAIN, 'b')
hold on
semilogy(v1,IxU1DRAIN, 'k')
semilogy(v1,IxU7DRAIN, 'c')
semilogy(v1,IxU10DRAIN, 'm')
semilogy(v1,IxU15DRAIN, 'r')
semilogy(v1,IxU18DRAIN, 'k-*')
semilogy(v1,IxU21DRAIN, 'b-*')


xlim([1.5, 5])
xlabel('Gate Voltage (V)')
ylabel('Drain Current (A)')
legend('Ix0','Ix1', 'Ix2', 'Ix3', 'Ix4', 'Ix5', 'Ix6')

%%

x=[0,1,2,3,4,5,6]
y=[IxU4DRAIN(end),IxU1DRAIN(end),IxU7DRAIN(end),IxU10DRAIN(end),IxU15DRAIN(end),IxU18DRAIN(end),IxU21DRAIN(end)]
figure
semilogy(0,IxU4DRAIN(end), 'bo')
hold on
semilogy(1,IxU1DRAIN(end), 'ko')
semilogy(2,IxU7DRAIN(end), 'co')
semilogy(3,IxU10DRAIN(end), 'mo')
semilogy(4,IxU15DRAIN(end), 'ro')
semilogy(5,IxU18DRAIN(end), 'k-*')
semilogy(6,IxU21DRAIN(end), 'b-*')
p1 = polyfit(x,y,1);
y1 = polyval(p1,x)
% x.^p1(1).*exp(p1(2))
semilogy(x,y1,'r-')

xlabel('Gate Voltage (V)')
ylabel('Drain Current (A)')
legend('Ix0','Ix1', 'Ix2', 'Ix3', 'Ix4', 'Ix5', 'Ix6')