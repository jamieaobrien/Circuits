load('Lab5Data.mat')
%% Experiment 1
Isatn = -Icn;
epsilon = 5e-4;
[Isn, VTn, kappan]=ekvfit(Vgn, Isatn, epsilon);
Isatp = -Icp;
VGP = 5 - Vgp;
[Isp, VTp, kappap]=ekvfit(Vgp, Isatp, epsilon);
Vddp = 5;
Vddn = 0;
Ut = 0.025;


ekvn = Isn .* ((log(1 + exp((kappan.*(Vgn - VTn) - 0)./(2*Ut)))).^2);
ekvp = Isp .* ((log(1 + exp((kappap.*(Vgp - VTp) - 0)./(2.*Ut)))).^2); % the zero should be 5 but it won't work that way

figure
semilogy(Vgn,-Icn,'.','Markersize',8)
hold on
semilogy(Vgn,ekvn,'b')
semilogy(Vgp,-Icp,'.','MarkerSize',8)
semilogy(Vgp,ekvp,'r')

xlabel('Gate Voltage (V)')
ylabel('Channel Current (A)')
legend('nMos','nMos theoretical','pMos','pMos theoretical')





%% 
clf
%gmn = (kappan./Ut).*(sqrt(Isn.*-Icn)).*(1 - exp(-sqrt(-Icn./Isn)));
%gmn = kappan.*(-Icn./Ut);
gmn = diff(-Icn)./diff(Vgn);
gmp = diff(Icp)./diff(Vgp);
% NEED THEORETICAL FITS
% i don't think it looks right - am i finding gm the right way?
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
% did I fit the line to the right part of the curve?
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
% did I fit the line to the right part of the curve?
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
% needs theoretical fits - i don't think this looks right 
% should gs be the slope from the fits above?
loglog(Isatn(1:end-1),gsn,'.')
hold on 
loglog(Isatp(1:end-1),gsp,'.')
hold off
xlabel('Channel Current(A)')
ylabel('Incremental Source Conductance (S)')
legend('nMOS','pMOS')


%% Experiment 3
%nmos
% this one is fine I think
clf
semilogy(Vdn500mV,Icn500mV,'.','MarkerSize',8)
hold on

semilogy(Vdn600mV,Icn600mV,'.','MarkerSize',8)
semilogy(Vdn700mV,Icn700mV,'.','MarkerSize',8)
semilogy(Vdn5V,Icn5V,'.','MarkerSize',8)


xlabel('Drain Voltage (V)')
ylabel('Channel Current (A)')
legend('Vg = 500mV','Vg = 600mV','Vg = 700mV','Vg = 5V')


%%
%pmos
% data looks weird - can't get all four curves to look okay on one plot
figure
semilogy(Vdp0V,Icp0V,'Marker','.','MarkerSize',8)

hold on
semilogy(Vdp4400mV,Icp4400mV,'Marker','.','MarkerSize',8)
hold off
figure
semilogy(Vdp4500mV,Icp4500mV,'Marker','.','MarkerSize',8)
hold on
semilogy(Vdp4550mV,Icp4550mV,'Marker','.','MarkerSize',8)
hold off
xlabel('Drain Voltage (V)')
ylabel('Channel Current (A)')
legend('Vg = 0V','Vg = 4400mV','Vg = 4500mV','Vg = 4550V')

%% early voltage
% not sure what parts of the curves to do a fit on
% if you can tell me where to do the fit then i can finsh this
%semilogx


%% instrinsic gain


%once early voltage is done this should be easy







