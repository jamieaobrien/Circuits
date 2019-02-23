 load('Lab3Data_Exp1and2.mat')
 
 %% Experiment 1 - Plot 1 - working on theoretical
clf
Ic1 = Ie1 - Ib1;
Ict = Ib1.*B;
Ibt = Ic1./B;
yyaxis left
h = semilogx(Vb1, Ib1);
ylabel('Base Current (A)')
yyaxis right
h2 = semilogx(Vb1, Ic1);
hold on
semilogx(Vb1,Ict,'k*')
%semilogx(Vbt,Ibt,'m*')

legend('Ib','Ic','T','Tb')
ylabel('Collector Current (A)')
xlabel('Base Voltage (V)')
%% Experiment 1 - Plot 2 - done but looks weird???
figure

B = Ic1./Ib1;
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



