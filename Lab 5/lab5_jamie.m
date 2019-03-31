load('Lab5Data.mat')
%% Experiment 1
Isatn = -Icn;
epsilon = 5e-4;
[Isn, VTn, kappan]=ekvfit(Vgn, Isatn, epsilon);
Isatp = -Icp;
VGP = 5 - Vgp;
[Isp, VTp, kappap]=ekvfit(VGP, Isatp, epsilon);
Vddp = 5;
Vddn = 0;
Ut = 0.025;

ekvn = Isn .* ((log(1 + exp((kappan.*(Vgn - VTn) - Vddn)./(2*Ut)))).^2);

ekvp = Isp .* ((log(1 + exp((kappap.*(VGP - VTp) - Vddp)./(2.*Ut)))).^2);

figure
semilogy(Vgn,-Icn,'Marker','.','Markersize',8)
hold on
semilogy(Vgn,ekvn,'b')
semilogy(Vgp,-Icp,'Marker','.','MarkerSize',8)
%semilogy(VGP,ekvp,'r*-')

xlabel('Gate Voltage (V)')
ylabel('Channel Current (A)')
legend('nMos','nMos theoretical','pMos','pMos theoretical')





%%
clf
%gmn = (kappan./Ut).*(sqrt(Isn.*-Icn)).*(1 - exp(-sqrt(-Icn./Isn)));
%gmn = kappan.*(-Icn./Ut);
gmn = diff(-Icn)./diff(Vgn);
gmp = diff(Icp)./diff(Vgp);

loglog(Icn(1:end-1),gmn,'Marker','.','MarkerSize',8)
hold on 
loglog(Icp(1:end-1),gmp,'Marker','.','MarkerSize',8)
xlabel('Channel Current (A)')
ylabel('Incremental transconductance (S)')
legend('nMOS','pMOS')
%% Experiment 2
%nmos
pn1 = polyfit(Vsn(250:end),log(-Icn(250:end)),1);
yn1 = polyval(pn1,Vsn)
clf
semilogy(Vsn,-Icn,'.','MarkerSize',8)
hold on
semilogy(Vsn,exp(yn1))
xlabel('Source Voltage (V)')
ylabel('Channel Current (A)')

legend('experimental','fit')

%%
%pmos
pp1 = polyfit(Vsp(1:20),log(-Icp(1:20)),1);
yp1 = polyval(pp1,Vsp);
figure
semilogy(Vsp,-Icp,'.','MarkerSize',8)
hold on
semilogy(Vsp,exp(yp1))
xlabel('Gate Voltage (V)')
ylabel('Channel Current (A)')
legend('experimental','fit')

%%
gsn = diff(Isatn)./diff(Vsn);
gsp = diff(-Isatp)./diff(Vsp);

loglog(Isatn(1:end-1),gsn,'.')
hold on 
loglog(Isatp(1:end-1),gsp,'.')
hold off
xlabel('Channel Current(A)')
ylabel('Incremental Source Conductance (S)')
legend('nMOS','pMOS')


%% Experiment 3
%nmos
clf
semilogy(Vdn500mV,Icn500mV,'.','MarkerSize',8)
hold on

semilogy(Vdn600mV,Icn600mV,'.','MarkerSize',8)
semilogy(Vdn700mV,Icn700mV,'.','MarkerSize',8)
semilogy(Vdn5V,Icn5V,'.','MarkerSize',8)


xlabel('Drain Voltage (V)')
ylabel('Channel Current (A)')
legend('Vd = 500mV','Vd = 600mV','Vd = 700mV','Vd = 5V')


%%
%pmos
figure
semilogy(Vdp0V,Icp0V,'Marker','.','MarkerSize',8)

hold on
semilogy(Vdp4400mV,Icp4400mV,'Marker','.','MarkerSize',8)
% semilogy(Vdp4500mV,-Icp4500mV,'Marker','.','MarkerSize',8)
% semilogy(Vdp4550mV,-Icp4550mV,'Marker','.','MarkerSize',8)

xlabel('Drain Voltage (V)')
ylabel('Channel Current (A)')
legend('Vd = 0V','Vd = 4400mV','Vd = 4500mV','Vd = 4550V')

%% early voltage

%semilogx


%% instrinsic gain










