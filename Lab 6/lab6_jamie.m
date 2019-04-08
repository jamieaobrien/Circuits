load('lab6data.mat')
%% Experiment 1
Ut = 0.025;
epsilon = 5e-4;
Isata = -Ic1a;
[Isa, VTa, kappaa]=ekvfit(Vg1a, Isata, epsilon);
% [Isb, VTb, kappab]=ekvfit(Vg1b, -Ic1b, epsilon);
% [Isc, VTc, kappac]=ekvfit(Vg1c, -Ic1c, epsilon);
% [Isd, VTd, kappad]=ekvfit(Vg1c, -Ic1d, epsilon);

% ekva = Isa .* ((log(1 + exp((kappaa.*(Vg1a - VTa) - 0)./(2*Ut)))).^2);
% ekva = Isb .* ((log(1 + exp((kappab.*(Vg1b - VTb) - 0)./(2*Ut)))).^2);
% ekva = Isc .* ((log(1 + exp((kappac.*(Vg1c - VTc) - 0)./(2*Ut)))).^2);
% ekvd = Isd .* ((log(1 + exp((kappad.*(Vg1d - VTd) - 0)./(2*Ut)))).^2);

figure
semilogy(Vg1a,-Ic1a,'Marker','.','MarkerSize',10)
hold on
semilogy(Vg1b,-Ic1b,'Marker','.','MarkerSize',10)
semilogy(Vg1c,-Ic1c,'Marker','.','MarkerSize',10)
semilogy(Vg1c,-Ic1c,'Marker','.','MarkerSize',10)

% semilogy(Vg1a,ekva)
% semilogy(Vg1b,Isb)
% semilogy(Vg1c,Isc)
% semilogy(Vg1d,Isd)
hold off

xlabel('Gate Voltage (V)')
ylabel('Channel Current (A)')
legend('Q1','Q2','Q3','Q4')
%%
Ic_mean = (Ic1a + Ic1b + Ic1c + Ic1d)./4;
diff_a = (Ic_mean - Ic1a)./Ic_mean;
diff_b = (Ic_mean - Ic1b)./Ic_mean;
diff_c = (Ic_mean - Ic1c)./Ic_mean;
diff_d = (Ic_mean - Ic1d)./Ic_mean;
figure
semilogx(Ic_mean,diff_a,'.')
hold on
semilogx(Ic_mean,diff_b,'.')
semilogx(Ic_mean,diff_c,'.')
semilogx(Ic_mean,diff_d,'.')
hold off
xlabel('Mean Channel Current (A)')
ylabel('Percent Difference from Mean')
legend('Q1','Q2','Q3','Q4')
%% Experiment 2
figure
semilogy(Vg210mV,Ic210mV,'.')
hold on
semilogy(Vg210mVp,Ic210mVp,'.')
semilogy(Vg210mVs,Ic2dd,'.') % we don't have the data for this one
semilogy(Vg25V,Ic25V,'.')
semilogy(Vg25Vp,Ic25Vp,'.')
semilogy(Vg25Vs,Ic25Vs,'.')
hold off
xlabel('Gate Voltage (V)')
ylabel('Channel Current (A)')
legend('Single, Vd = 10mV','Parallel, Vd = 10mV','Series, Vd = 10mV','Single, Vd = 5V', 'Parallel, Vd = 5V','Series, Vd = 5V')

%%

ratio_ps10mV = Ic210mVp ./ Ic210mV;
ratio_ps5V = Ic25Vp ./ Ic25V;

figure 
plot(Vg210mV,ratio_ps10mV,'.')
hold on
plot(Vg25V,ratio_ps5V,'.')
hold off
xlabel('Gate Voltage (V)')
ylabel('Parallel to Single Ratio')
legend('Vd = 10mV','Vd = 5V')
%%

% ratio_sc10mV = Ic210mV ./ Ic210mVs;
ratio_sc5V = Ic25V ./ Ic25Vs;

% plot(Vg210mV,ratio_sc10mV)
hold on
plot(Vg25V,ratio_sc5V,'.')
hold off
xlabel('Gate Voltage (V)')
ylabel('Single to Series Ratio')
legend('Vdd = 10mV','Vdd = 5V')


%% Experiment 3
pa = polyfit(-Iina,Iouta,1);
ya = polyval(pa,-Iina);
figure
plot(-Iina,Iouta,'.')
hold on
plot(-Iina,ya)
plot([0,.001],[0,.0005])

hold off
xlabel('Input Current (A)')
ylabel('Output Current (A)')
legend('Experimental Data','Linear Fit, Divider Ratio = .5029','Theoretical Fit, Divider Ratio = .5')

pa(1)

%%
x = [0,.001];
y = .00222 - (.5) * x;
pb = polyfit(Iinb,Ioutb,1);
yb = polyval(pb,Iinb);
figure
plot(Iinb,Ioutb,'.')
hold on
plot(Iinb,yb)
plot(x,y)

hold off
xlabel('Input Current (A)')
ylabel('Output Current (A)')
legend('Experimental Data','Linear Fit, Divider Ratio = .4546','Theoretical Fit, Divider Ratio = .5')

pb(1)
pb(2)
