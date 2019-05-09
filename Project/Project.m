load('ProjectData.mat')
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
semilogy(v1,IxU4DRAIN, '.-')
hold on
semilogy(v1,IxU1DRAIN, '.-')
semilogy(v1,IxU7DRAIN, '.-')
semilogy(v1,IxU10DRAIN, '.-')
semilogy(v1,IxU15DRAIN, '.-')
semilogy(v1,IxU18DRAIN, '.-')
semilogy(v1,IxU21DRAIN, '.-')

xlabel('Gate Voltage (V)')
ylabel('Drain Current (A)')
legend('Ix0','Ix1', 'Ix2', 'Ix3', 'Ix4', 'Ix5', 'Ix6')
%%
figure
semilogy(v1,IxU4DRAIN, '.-')
hold on
semilogy(v1,IxU1DRAIN, '.-')
semilogy(v1,IxU7DRAIN, '.-')
semilogy(v1,IxU10DRAIN, '.-')
semilogy(v1,IxU15DRAIN, '.-')
semilogy(v1,IxU18DRAIN, '.-')
semilogy(v1,IxU21DRAIN, '.-')


xlim([1.5, 5])
xlabel('Gate Voltage (V)')
ylabel('Drain Current (A)')
legend('Ix0','Ix1', 'Ix2', 'Ix3', 'Ix4', 'Ix5', 'Ix6')

%%

clf

x=[0,1,2,3,4,5,6]
I0_test = IxU4DRAIN(31)*2.^x
y=[IxU4DRAIN(31),IxU1DRAIN(31),IxU7DRAIN(31),IxU10DRAIN(31),IxU15DRAIN(31),IxU18DRAIN(31),IxU21DRAIN(31)]
figure
semilogy(0,IxU4DRAIN(31), 'o')
hold on
semilogy(1,IxU1DRAIN(31), 'o')
semilogy(2,IxU7DRAIN(31), 'o')
semilogy(3,IxU10DRAIN(31), 'o')
semilogy(4,IxU15DRAIN(31), 'o')
semilogy(5,IxU18DRAIN(31), 'o')
semilogy(6,IxU21DRAIN(31), 'o')
semilogy(x,I0_test)
p1 = polyfit(x,log(y),1);
p2 = polyfit(x,log(I0_test),1)

y1 = polyval(p1,x)
y1=exp(p1(1)*x + p1(2))


% plot(x,y1)

% semilogy(x,y,'r-')

xlabel('n_{th} position')
ylabel('Drain Current (A)')
legend('Ix0','Ix1', 'Ix2', 'Ix3', 'Ix4', 'Ix5', 'Ix6', 'Theoretical fit, m=log(2)')

%%
% plot(0,IxU4DRAIN(25), 'bo')
% hold on
% plot(1,IxU1DRAIN(25), 'ko')
% plot(2,IxU7DRAIN(25), 'co')
% plot(3,IxU10DRAIN(25), 'mo')
% plot(4,IxU15DRAIN(25), 'ro')
% plot(5,IxU18DRAIN(25), 'k-*')
% plot(6,IxU21DRAIN(25), 'b-*')

plot(x,y1)