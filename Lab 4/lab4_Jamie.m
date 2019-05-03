load('Exp1Data.mat')
%%
Ic1a = -Ie1a - Ib1a;
Ic1b = -Ie1b - Ib1b;
Ic1c = -Ie1c - Ib1c;
Ic1d = -Ie1d - Ib1d;
Ic_avg = (Ic1a + Ic1b + Ic1c + Ic1d)./4;

pa = polyfit(Vb1a(1:30), log(Ic1a(1:30)), 1);
pb = polyfit(Vb1b(1:30), log(Ic1b(1:30)), 1);
pc = polyfit(Vb1c(1:30), log(Ic1c(1:30)), 1);
pd = polyfit(Vb1d(1:30), log(Ic1d(1:30)), 1);

Is_a = exp(pa(1));
Is_b = exp(pb(1));
Is_c = exp(pc(1));
Is_d = exp(pd(1));

uT_a = 1./pa(2);
uT_b = 1./pb(2);
uT_c = 1./pc(2);
uT_d = 1./pd(2);

B_a = Ic1a ./ Ib1a;
B_b = Ic1b ./ Ib1b;
B_c = Ic1c ./ Ib1c;
B_d = Ic1d ./ Ib1d;
%% Exp 1 plot 1
clf
semilogy(Vb1a, Ib1a,'b.');
hold on
semilogy(Vb1b,Ib1b,'r.')
semilogy(Vb1c,Ib1c,'k.')
semilogy(Vb1d,Ib1d,'c.')

semilogy(Vb1a, Ic1a,'b.-');

semilogy(Vb1b,Ic1b,'r.-')
semilogy(Vb1c,Ic1c,'k.-')
semilogy(Vb1d,Ic1d,'c.-')
hold off
%semilogy(Vb1,exp(y),'m*');
%semilogy(Vb1,Ict,'k')
%semilogy(Vb1,Ibt,'m')

%legend('Iba','Ibb','Ibc','Ibd','Ica','Icb',Icc','Icd')
legend('Q1 Ib','Q2 Ib','Q3 Ib','Q4 Ib','Q1 Ic','Q2 Ic','Q3 Ic','Q4 Ic')
ylabel('Current (A)')
xlabel('Base Voltage (V)')


%% Exp 1 plot 2
clf

diff_a = Ic_avg - Ic1a;
diff_b = Ic_avg - Ic1b;
diff_c = Ic_avg - Ic1c;
diff_d = Ic_avg - Ic1d;

perc_a = diff_a ./ Ic_avg;
perc_b = diff_b ./ Ic_avg;
perc_c = diff_c ./ Ic_avg;
perc_d = diff_d ./ Ic_avg;

plot(Vb1a, perc_a,'Marker','.','MarkerSize',12)
hold on
plot(Vb1b, perc_b,'Marker','.','MarkerSize',12)
plot(Vb1c, perc_c,'Marker','.','MarkerSize',12)
plot(Vb1d, perc_d,'Marker','.','MarkerSize',12)

ylabel('Percentage Difference from Average Collector Current')
xlabel('Base Voltage (V)')

legend('Q1','Q2','Q3','Q4')


%% Exp 1 plot 3
clf

semilogx(abs(Ib1a), -B_a,'Marker','.','MarkerSize',12)
hold on
semilogx(abs(Ib1b), -B_b,'Marker','.','MarkerSize',12)
semilogx(abs(Ib1c), -B_c,'Marker','.','MarkerSize',12)
semilogx(abs(Ib1d), -B_d,'Marker','.','MarkerSize',12)
ylim([-910,-00])
ylabel('Current Gain, B')
xlabel('Log of Current (A)')

legend('Q1','Q2','Q3','Q4')