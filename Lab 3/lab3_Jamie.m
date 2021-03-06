load('Lab3Data_Exp1and2.mat')
%%
Ic1 = -Ie1 - Ib1;

p = polyfit(Vb1(50:75),log(Ib1(50:75)),1);
y = polyval(p,Vb1);

g = p(1).*Vb1 + p(2);
uT_Ib = 1./p(1);
Is_Ib = log(p(2));

p1 = polyfit(Vb1(101:141),log(Ib1(101:141)),1);
y1 = polyval(p1,Vb1);
uT_Ib = 1./p1(1);
Is_Ib = exp(p1(2));


B = Ic1./Ib1;


rb = Vb1./Ib1;
pg = polyfit(Vb1(101:141),log(Ic1(101:141)),1);
uT_Ic = 1./(pg(1));
Is_Ic = exp(pg(2));
yg = polyval(pg,Vb1);
gm = Ic1./Vb1;
gmt = B./rb;

rbt = B./gm;
%% Experiment 1 - Plot 1 - working on theoretical
clf
yyaxis left
h = semilogy(Vb1, Ib1,'.');
hold on
semilogy(Vb1,exp(y1),'-')
ylim([10e-12,10e-4])
hold off
ylabel('Base Current (A)')
yyaxis right
h2 = semilogy(Vb1, Ic1,'.');
hold on
semilogy(Vb1,exp(yg),'-')
ylim([10e-10,10e0])
hold off
%semilogy(Vb1,exp(y),'m*');
%semilogy(Vb1,Ict,'k')
%semilogy(Vb1,Ibt,'m')

legend('Ib','Ib Fit','Ic', 'Ic Fit')
ylabel('Collector Current (A)')
xlabel('Base Voltage (V)')

%% Experiment 1 - Plot 1 - working on theoretical
clf
semilogy(Vb1, Ib1,'b.');
hold on
semilogy(Vb1,exp(y1),'b-')
% ylim([10e-12,10e-4])
% hold off
ylabel('Base Current (A)')
semilogy(Vb1, Ic1,'r.');
% hold onRR
semilogy(Vb1,exp(yg),'r-')
% ylim([10e-10,10e0])
hold off
%semilogy(Vb1,exp(y),'m*');
%semilogy(Vb1,Ict,'k')
%semilogy(Vb1,Ibt,'m')

legend('I_b','I_b fit','I_c', 'I_c fit')
ylabel('Current (A)')
xlabel('Base Voltage (V)')


%% Experiment 1 - Plot 2 
figure


semilogx(abs(Ib1),B,'o')

xlabel('Base Current (A)')
ylabel('Current gain, B')

%% Experiment 1 - Plot 3 
figure
rb = diff(Vb1)./diff(Ib1);
rbt = uT_Ib./Ib1;
%p2 = polyfit(Ib1(1:end-1),rb,1);
%y2 = polyval(p2,Ib1);

loglog(Ib1(1:end-1),rb,'b.')
hold on
loglog(Ib1,rbt,'b-')
%loglog(Ib1,exp(y2))
legend('r_b','Theoretical')
xlabel('Current (A)')
ylabel('Incremental base resistance,r_b')


%% Experiment 1 - Plot 4 - theoretical???
figure
gm = diff(Ic1)./diff(Vb1);
%gm1 = Ic1./Vb1;
gmt = Ic1./uT_Ib;
%gmt1 = Ic1./uT_Ib;
%p3 = polyfit(log(Ic1),log(gm),1);
% y3 = polyval(p3,log(Ic1));
%yyaxis left
% h1 = loglog(Ic1(1:end-1),gm,'o')
% hold on
% 
% yyaxis right
loglog(Ic1(1:end-1),gm,'b.')
hold on
%loglog(Ic1,gm1,'k*-')
loglog(Ic1,gmt,'b-')
ylim([10e-9,10e0])
legend('g_m','g_m fit')
xlabel('Collector Current (A)')
ylabel('Incremental Transconductance Gain, g_m')


%% Experiment 3 - plot 1
load('lab3DataExp3.mat')
clf
p2 = polyfit(Vin1003(20:30),Vout1003(20:30),1);
y2 = polyval(p2,Vin1003);

x = ones(51);
x = x.*(-p2(2));

vony = linspace(-1,4,51);

plot(Vin1003,Vout1003,'b')
hold on 
plot(Vin1003,y2,'b--')
plot(x,vony,'k')
xlabel('Input Voltage (V)')
ylabel('Output Voltage (V)')
legend('Voltage Transfer Characteristic (VTC)','VTC fit','Vin=Von')


%% Experiment 4
% clear all
load('Lab3DataExp4.mat');
vony1 = linspace(-1,6,51);
p3 = polyfit(Vin200(20:40),Vout200(20:40),1);
y3 = polyval(p3,Vin200(10:60));
p4 = polyfit(Vin300(20:40),Vout300(20:40),1);
y4 = polyval(p4,Vin300(10:50));
p5 = polyfit(Vin400(17:25),Vout400(17:25),1);
y5 = polyval(p5,Vin400(10:40));
clf
plot(Vin1003,Vout1003,'b-')
hold on
plot(Vin1003,y2,'b--')
plot(Vin200,Vout200,'c-')
plot(Vin200(10:60),y3,'c--')
plot(Vin300,Vout300,'r-')
plot(Vin300(10:50),y4,'r--')
plot(Vin400,Vout400,'m-')
plot(Vin400(10:40),y5,'m--')
plot(x,vony1,'k')
xlabel('Input Voltage (V)')
ylabel('Output Voltage (V)')
legend('Follower, R=100','R=100 fit','Inverter, R=200','R=200 fit','Inverter, R=300','R=300 fit','Inverter, R=400','R=400 fit', 'Vin=Von')

