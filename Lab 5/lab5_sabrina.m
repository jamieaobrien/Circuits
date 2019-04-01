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
gmn = diff(Isatn)./diff(Vgn);
gmp = diff(-Isatp)./diff(Vgp);
% NEED THEORETICAL FITS
gmn_weak = (kappan/Ut).*Isatn;
gmn_strong = (kappan/Ut).*sqrt(Isn.*Isatn);

gmp_weak = -(kappap/Ut).*Isatp;
gmp_strong = -(kappap/Ut).*sqrt(Isp.*Isatp);

% i don't think it looks right - am i finding gm the right way?
loglog(Isatn(1:end-1),gmn,'Marker','.','MarkerSize',8)
hold on 
loglog(Isatn,gmn_weak)
loglog(Isatn,gmn_strong)

loglog(Isatp,gmp_weak)
loglog(Isatp,gmp_strong)
loglog(Isatp(1:end-1),gmp,'Marker','.','MarkerSize',8)
xlabel('Channel Current (A)')
ylabel('Incremental transconductance')
legend('nMOS','pMOS')
%% Experiment 2
%nmos
pn1 = polyfit(Vsn(80:131),log(-Icn(80:131)),1);
yn1 = polyval(pn1,Vsn)
% did I fit the line to the right part of the curve?
clf
semilogy(Vsn,-Icn,'.','MarkerSize',8)
hold on
semilogy(Vsn,exp(yn1))
ylim([10^(-10) 10^(-2)])
xlabel('Source Voltage (V)')
ylabel('Channel Current (A)')

legend('experimental','fit')

%%
%pmos
pp1 = polyfit(Vsp(150:180),log(-Icp(150:180)),1);
yp1 = polyval(pp1,Vsp);
% did I fit the line to the right part of the curve?
figure
semilogy(Vsp,-Icp,'.','MarkerSize',8)
hold on
semilogy(Vsp,exp(yp1))
ylim([10^(-10) 10^(-2)])
xlabel('Source Voltage (V)')
ylabel('Channel Current (A)')
legend('experimental','fit')

%%
clf
gsn = diff(Isatn)./diff(Vsn);
gsp = diff(-Isatp)./diff(Vsp);
% needs theoretical fits - i don't think this looks right 
% should gs be the slope from the fits above?

gsn_weak = (1/Ut).*Isatn;
gsn_strong = (1/Ut).*sqrt(Isn.*Isatn);

gsp_weak = (1/Ut).*Isatp;
gsp_strong = (1/Ut).*sqrt(Isp.*Isatp);

loglog(Isatn(1:end-1),gsn,'.')
hold on 
loglog(Isatn,gsn_weak)
loglog(Isatn,gsn_strong)

loglog(Isatp,gmp_weak)
loglog(Isatp,gmp_strong)
loglog(Isatp(1:end-1),gsp,'.')
hold off
xlabel('Channel Current(A)')
ylabel('Incremental Source Conductance')
legend('nMOS','pMOS')


%% Experiment 3
%nmos
% this one is fine I think
clf
semilogy(Vdn500mV,Icn500mV,'.','MarkerSize',8)
hold on

semilogy(Vdn600mV,Icn600mV,'.','MarkerSize',8)
% semilogy(Vdn700mV,Icn700mV,'.','MarkerSize',8)
semilogy(Vdn5V,Icn5V,'.','MarkerSize',8)

ylim([10^(-4) 10^(-1.5)])
xlabel('Drain Voltage (V)')
ylabel('Channel Current (A)')
legend('Vg = 500mV','Vg = 600mV','Vg = 5V')


%%
%pmos
% data looks weird - can't get all four curves to look okay on one plot
clf
% figure
semilogy(Vdp0V,-Icp0V,'Marker','.','MarkerSize',8)
% 
hold on
semilogy(Vdp4400mV,-Icp4400mV,'Marker','.','MarkerSize',8)
% hold off
% figure
% hold on
% semilogy(Vdp4500mV,Icp4500mV,'Marker','.','MarkerSize',8)
hold on
semilogy(Vdp4550mV,Icp4550mV,'Marker','.','MarkerSize',8)
%Made this ish negative just so it would fit on graph but ughhh gotta
%mention in lab how it trash

% hold off

xlabel('Drain Voltage (V)')
ylabel('Channel Current (A)')
legend('Vg = 0V','Vg = 4400mV','Vg = 4500mV','Vg = 4550V')

%% early voltage
% not sure what parts of the curves to do a fit on
% if you can tell me where to do the fit then i can finsh this


%Early voltage is x intercept of linear fit of the top flat part, Isat is
%the y intercept, for the pMOS the fits need to be made by doing
%5V-(vector) according to paige, basically treat like nMOS and find x
%intercept
%semilogx


%% instrinsic gain


%once early voltage is done this should be easy







