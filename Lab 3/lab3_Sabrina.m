load('Lab3Data_Exp1and2.mat')
 
Ic1 = Ie1 - Ib1;

B = Ic1./Ib1;

Ict = Ib1.*B;
Ibt = Ic1./B;

rb = Vb1./Ib1;
rbt = B./gm;

gm = Ic1./Vb1;
gmt = B./rb;
%% Experiment 1 - Plot 1 - working on theoretical
yyaxis left
h = semilogy(Vb1, Ib1);
ylabel('Base Current (A)')
yyaxis right
h2 = semilogy(Vb1, Ic1);
hold on
%semilogy(Vb1,Ict,'k')
%semilogy(Vb1,Ibt,'m')

legend('Ib','Ic','T','Tb')
ylabel('Collector Current (A)')
xlabel('Base Voltage (V)')
%% Experiment 1 - Plot 2 - done but looks weird???
figure


semilogx(Ib1,B,'*')

xlabel('Base Current (A)')
ylabel('Current gain, B')

%%
% clf
% rb = diff(Vb1)./diff(Ib1);
% loglog(Ib1(1:end-1),rb)
% xlabel('Current (A)')
% ylabel('Incremental base resistance,rb')

%% Experiment 1 - Plot 3 - theoretical?????
figure
rb = Vb1./Ib1;
rbt = B./gm;
loglog(Ib1,rb,'*')
hold on
loglog(Ib1,rbt,'o')
legend('rb','T')
xlabel('Current (A)')
ylabel('Incremental base resistance,rb')
%%
% clf 
% gm = diff(Ic1)./diff(Vb1);
% loglog(Ic1(1:end-1),gm)
% xlabel('Collector Current (A)')
% ylabel('Incremental Transconductance Gain, gm')
% ylabel('Incremental base resistance, rb')

%% Experiment 1 - Plot 4 - theoretical???
figure
gm = Ic1./Vb1;
gmt = B./rb;
loglog(Ic1,gm)
hold on
loglog(Ic1,gmt)
legend('gm','gmt')
xlabel('Collector Current (A)')
ylabel('Incremental Transconductance Gain, gm')
%% Experiment 2 - plot 1

clf

Ic100 = -Ie100 - Ib100;
Ic1k = -Ie1k - Ib1k;
Ic10k = -Ie10k - Ib10k;


%semilogx(Vb1,Ict,'b')
semilogy(Vb100,Ic100,'m')
hold on
semilogy(Vb1k,Ic1k,'c')
semilogy(Vb10k,Ic10k,'k')

%semilogx(Vbt,Ibt,'m*')

legend('100','1k','10k')
ylabel('Collector Current (log(A))')
xlabel('Base Voltage (V)')

%% Experiment 2 - plot 2a

clf

plot(Vb100,Ic100,'m')
hold on
ylabel('Collector Current (A)')
xlabel('Base Voltage (V)')


p100 = polyfit(Vb100(76:226),Ic100(76:226),1); %V1 is the x axis, I1 is the y axis, 1 gives us linear coefficients (y=mx+b so p1=[m b])
y100 = polyval(p100,Vb100(40:350)); % generates y values using the coefficents from polyfit
root100 = roots(p100);
plot(Vb100(40:350),y100)


%% Experiment 2 - plot 2b

clf

plot(Vb1k,Ic1k,'c')
ylabel('Collector Current (A)')
xlabel('Base Voltage (V)')

%% Experiment 2 - plot 2b

clf

plot(Vb10k,Ic10k,'k')
ylabel('Collector Current (A)')
xlabel('Base Voltage (V)')

