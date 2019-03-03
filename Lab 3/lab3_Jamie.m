load('Lab3Exp1_2_3Data(part2).mat')
%%
Ic1 = Ie1 - Ib1;

p = polyfit(Vb1(50:75),log(Ib1(50:75)),1);
y = polyval(p,Vb1);

g = p(1).*Vb1 + p(2);
uT_Ib = 1./p(1);
Is_Ib = log(p(2));

p1 = polyfit(Vb1(50:75),log(Ic1(50:75)),1);
y1 = polyval(p1,Vb1);
uT_Ic = 1./p1(1);
Is_Ic = log(p1(2));


B = Ic1./Ib1;


rb = Vb1./Ib1;
gm = Ic1./Vb1;
gmt = B./rb;

rbt = B./gm;
%% Experiment 1 - Plot 1 - working on theoretical
clf
yyaxis left
h = semilogy(Vb1, Ib1);
hold on
semilogy(Vb1,exp(y))
hold off
ylabel('Base Current (A)')
yyaxis right
h2 = semilogy(Vb1, Ic1);
hold on
semilogy(Vb1,exp(y1))
hold off
%semilogy(Vb1,exp(y),'m*');
%semilogy(Vb1,Ict,'k')
%semilogy(Vb1,Ibt,'m')

legend('Ib','Ib Fit','Ic', 'Ic Fit')
ylabel('Collector Current (A)')
xlabel('Base Voltage (V)')


%% Experiment 1 - Plot 2 
figure


semilogy(Ib1,B,':')

xlabel('Base Current (A)')
ylabel('Current gain, B')

%% Experiment 1 - Plot 3 
figure
rb = diff(Vb1)./diff(Ib1);
rbt = uT_Ib./Ib1;
%p2 = polyfit(Ib1(1:end-1),rb,1);
%y2 = polyval(p2,Ib1);

loglog(Ib1(1:end-1),rb,'b:')
hold on
loglog(Ib1,rbt,'b--')
%loglog(Ib1,exp(y2))
legend('rb','rb Theoretical')
xlabel('Current (A)')
ylabel('Incremental base resistance,rb')


%% Experiment 1 - Plot 4 - theoretical???
figure
gm = diff(Ic1)./diff(Vb1);
gm1 = Ic1./Vb1;
gmt = Ic1./uT_Ic;
gmt1 = Ic1./uT_Ib;
%p3 = polyfit(log(Ic1),log(gm),1);
% y3 = polyval(p3,log(Ic1));
%yyaxis left
% h1 = loglog(Ic1(1:end-1),gm,'o')
% hold on
% 
% yyaxis right
loglog(Ic1,gmt)
hold on
%loglog(Ic1,gm1,'k*-')
loglog(Ic1,gmt1,'r--')
legend('gm','gm fit')
xlabel('Collector Current (A)')
ylabel('Incremental Transconductance Gain, gm')


%% Experiment 3 - plot 1

p2 = polyfit(Vin1003(40:end),Vout1003(40:end),1);
y2 = polyval(p2,Vin1003);

plot(Vin1003,Vout1003,'b')
hold on 
plot(Vin1003,y2,'r--')
xlabel('Input Voltage (V)')
ylabel('Output Voltage (V)')
legend('Voltage Transfer Characteristic (VTC)','VTC fit')


%% Experiment 4
% clear all
load('Lab3DataExp4.mat');
p2 = polyfit(Vin1003(40:end),Vout1003(40:end),1);
y2 = polyval(p2,Vin1003);
p3 = polyfit(Vin200,Vout200,15);
y3 = polyval(p3,Vin200);
clf
plot(Vin1003,Vout1003,'b:')
hold on
plot(Vin1003,y2,'b--')
plot(Vin200,Vout200,'c:')
plot(Vin200,y3,'c--')
plot(Vin300,Vout300)
plot(Vin400,Vout400)
xlabel('Input Voltage (V)')
ylabel('Output Voltage (V)')
legend('Follower, R=100','R=100 fit','Inverter, R=200','Inverter, R=300','Inverter, R=400')

