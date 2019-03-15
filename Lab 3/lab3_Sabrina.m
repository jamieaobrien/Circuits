
load('Lab3Data_Exp1and2.mat')
 
Ic1 = Ie1 - Ib1;

B = Ic1./Ib1;

Ict = Ib1.*B;
Ibt = Ic1./B;

Beta = 150;


rb = Vb1./Ib1;
rbt = B./gm;

gm = Ic1./Vb1;
gmt = B./rb;


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

ylabel('Collector Current (log(A))')
xlabel('Base Voltage (V)')


%Making best fit line
segment_Vb1k = Vb1k(35:50);
segment_Ic1k = log(Ic1k(35:50));
p1 = polyfit(segment_Vb1k,segment_Ic1k,1); %V1 is the x axis, I1 is the y axis, 1 gives us linear coefficients (y=mx+b so p1=[m b])
y1 = polyval(p1,Vb1k); % generates y values using the coefficents from polyfit
Ut = 1/p1(1);
Is = exp(p1(2));

% theoretical = log(Is)+(1./Ut)*Vb100

semilogy(Vb1k(20:80), exp(y1(20:80)))

legend('100 Ohm Resisitor','1k Ohm Resisitor','10k Ohm Resisitor','Theoretical Fit, Is = 2.07e-16, Ut = 0.0284')


%% Experiment 2 - plot 2a

clf

plot(Vb100,Ic100,'--', 'MarkerSize',1)
hold on
ylabel('Collector Current (A)')
xlabel('Base Voltage (V)')



p100 = polyfit(Vb100(76:226),Ic100(76:226),1); %V1 is the x axis, I1 is the y axis, 1 gives us linear coefficients (y=mx+b so p1=[m b])
y100 = polyval(p100,Vb100(40:350)); % generates y values using the coefficents from polyfit
root100 = roots(p100);
plot(Vb100(40:350),y100)

m100 = 1/p100(1)


lgd = legend('Experimental','1/m = 105 Ohms, V_{on} = .6935 V');
title(lgd,'100 Ohm Resistor')



%% Experiment 2 - plot 2b

clf

plot(Vb1k,Ic1k,'--', 'MarkerSize',1)
hold on
ylabel('Collector Current (A)')
xlabel('Base Voltage (V)')


p1k = polyfit(Vb1k(100:500),Ic1k(100:500),1); %V1 is the x axis, I1 is the y axis, 1 gives us linear coefficients (y=mx+b so p1=[m b])
y1k = polyval(p1k,Vb1k(40:501)); % generates y values using the coefficents from polyfit
root1k = roots(p1k);
plot(Vb1k(40:501),y1k)

m1k = 1/p1k(1)

lgd = legend('Experimental','1/m = 1027 Ohms, V_{on} = .6565 V');
title(lgd,'1k Ohm Resistor')

%% Experiment 2 - plot 2c

clf

plot(Vb10k,Ic10k,'--', 'MarkerSize',1)
hold on
ylabel('Collector Current (A)')
xlabel('Base Voltage (V)')

p10k = polyfit(Vb10k(100:500),Ic10k(100:500),1); %V1 is the x axis, I1 is the y axis, 1 gives us linear coefficients (y=mx+b so p1=[m b])
y10k = polyval(p10k,Vb10k(40:501)); % generates y values using the coefficents from polyfit
root10k = roots(p10k);
plot(Vb10k(40:501),y10k)

m10k = 1/p10k(1)

lgd = legend('Experimental','1/m = 10260 Ohms, V_{on} = .6011 V');
title(lgd,'10k Ohm Resistor')


%% Experiment 2 rb100

clf

rb100 = diff(Vb100)./diff(Ib100)
loglog(Ib100(1:end-1), rb100, 'o','markersize', 4)
hold on

rb100_theoretical = (Ut./Ib100) + 100*Beta
loglog(Ib100, rb100_theoretical)

lgd = legend('Experimental','Theoretical');
title(lgd,'100 Ohm Resistor')
xlabel('Base Current I_b (log(A))')
ylabel('Incremental Resistance of the Base Terminal R_b (log(Ohms))')

%% Experiment 2 rb1k

clf

rb1k = diff(Vb1k)./diff(Ib1k);
rb1k(21) = rb1k(22);

loglog(Ib1k(20:end-1), rb1k(20:end), 'o','markersize', 4)
hold on

rb1k_theoretical = (Ut./Ib1k) + 1000*Beta
loglog(Ib1k(20:end), rb1k_theoretical(20:end))

lgd = legend('Experimental','Theoretical');
title(lgd,'1k Ohm Resistor')
xlabel('Base Current I_b (log(A))')
ylabel('Incremental Resistance of the Base Terminal R_b (log(Ohms))')

%% Experiment 2 rb10k

clf;

rb10k = diff(Vb10k)./diff(Ib10k);
rb10k(21) = rb10k(22);

loglog(Ib10k(1:end-1), rb10k(1:end), 'o','markersize', 4)
hold on

rb10k_theoretical = (Ut./Ib10k) + 10000*Beta
loglog(Ib10k(1:end), rb10k_theoretical(1:end))

lgd = legend('Experimental','Theoretical');
title(lgd,'10k Ohm Resistor')
xlabel('Base Current I_b (log(A))')
ylabel('Incremental Resistance of the Base Terminal R_b (log(Ohms))')

%% Exp 2 rb consolidate

clf

loglog(Ib100(1:end-1), rb100, 'o','markersize', 4)
hold on
loglog(Ib100, rb100_theoretical)
loglog(Ib1k(20:end-1), rb1k(20:end), 'o','markersize', 4)
loglog(Ib1k(20:end), rb1k_theoretical(20:end))

loglog(Ib10k(1:end-1), rb10k(1:end), 'o','markersize', 4)
loglog(Ib10k(1:end), rb10k_theoretical(1:end))


legend('Experimental, 100 Ohms','Theoretical, 100 Ohms', 'Experimental, 1k Ohms','Theoretical, 1k Ohms','Experimental, 10k Ohms','Theoretical, 10k Ohms');

xlabel('Base Current I_b (log(A))')
ylabel('Incremental Resistance of the Base Terminal R_b (log(Ohms))')

%% Experiment 2 gm100
clf;

gm100 = diff(Ic100)./diff(Vb100);
gm100(24) = gm100(25)
loglog(Ic100(1:end-1),gm100, 'o', 'markersize', 4)
hold on

gm100_theoretical = (1/100).* ((1+ (Ut./(Ic100.*100))).^-1);
loglog(Ic100,gm100_theoretical)
lgd = legend('Experimental','Theoretical')
title(lgd,'100 Ohm Resistor')
xlabel('Collector Current I_c (log(A))')
ylabel('Incremental Transconductance Gain G_m (log(Mhos))')
%% Experiment 2 gm1k
clf;

gm1k = diff(Ic1k)./diff(Vb1k);
gm1k(24) = gm1k(25)
loglog(Ic1k(1:end-1),gm1k, 'o', 'markersize', 4)
hold on

gm1k_theoretical = (1/1000).* ((1+ (Ut./(Ic1k.*1000))).^-1);
loglog(Ic1k,gm1k_theoretical)
lgd = legend('Experimental','Theoretical')
title(lgd,'1k Ohm Resistor')
xlabel('Collector Current I_c (log(A))')
ylabel('Incremental Transconductance Gain G_m (log(Mhos))')

%% Experiment 2 gm10k
clf;

gm10k = diff(Ic10k)./diff(Vb10k);
gm10k(11) = gm10k(12)
loglog(Ic10k(1:end-1),gm10k, 'o', 'markersize', 4)
hold on

gm10k_theoretical = (1/10000).* ((1+ (Ut./(Ic10k.*10000))).^-1);
loglog(Ic10k,gm10k_theoretical)
lgd = legend('Experimental','Theoretical')
title(lgd,'10k Ohm Resistor')
xlabel('Collector Current I_c (log(A))')
ylabel('Incremental Transconductance Gain G_m(log(Mhos))')

%% Experiment 2 gm consolidate


clf;


loglog(Ic100(1:end-1),gm100, 'o', 'markersize', 4)
hold on
loglog(Ic100,gm100_theoretical)

loglog(Ic1k(1:end-1),gm1k, 'o', 'markersize', 4)
loglog(Ic1k,gm1k_theoretical)

loglog(Ic10k(1:end-1),gm10k, 'o', 'markersize', 4)
loglog(Ic10k,gm10k_theoretical)

legend('Experimental, 100 Ohms','Theoretical, 100 Ohms', 'Experimental, 1k Ohms','Theoretical, 1k Ohms','Experimental, 10k Ohms','Theoretical, 10k Ohms');

xlabel('Collector Current I_c (log(A))')
ylabel('Incremental Transconductance Gain G_m (log(Mhos))')



