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
loglog(Isatn(1:end-1),gmn,'b.','MarkerSize',8)
hold on 

loglog(Isatn,gmn_weak,'b--')
loglog(Isatn,gmn_strong,'b')
loglog(Isatp(1:end-1),gmp,'r.','MarkerSize',8)
loglog(Isatp,gmp_weak,'r--')
loglog(Isatp,gmp_strong,'r')

xlabel('Channel Current (A)')
ylabel('Incremental transconductance (S)')
legend('nMOS','nMOS strong inversion fit','nMOS weak inversion fit','pMOS','pMOS weak inversion fit','pMOS strong inversion fit')
%% Experiment 2
%nmos
pn1 = polyfit(Vsn(80:131),log(-Icn(80:131)),1);
yn1 = polyval(pn1,Vsn)
pp1 = polyfit(Vsp(150:180),log(-Icp(150:180)),1);
yp1 = polyval(pp1,Vsp);
% did I fit the line to the right part of the curve?
clf
semilogy(Vsn,-Icn,'b.','MarkerSize',8)
hold on
semilogy(Vsn,exp(yn1),'b')
semilogy(Vsp,-Icp,'r.','MarkerSize',8)
semilogy(Vsp,exp(yp1),'r')
ylim([10^(-10) 10^(-2)])
xlabel('Source Voltage (V)')
ylabel('Channel Current (A)')

legend('nMOS','nMOS fit','pMOS','pMOS fit')

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
legend('Experimental','Weak inversion fit')

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

loglog(Isatn(1:end-1),gsn,'b.')
hold on 
loglog(Isatn,gsn_weak,'b--')
loglog(Isatn,gsn_strong,'b')
loglog(Isatp(1:end-1),gsp,'r.')
loglog(Isatp,gsp_weak,'r--')
loglog(Isatp,gsp_strong,'r')

hold off
xlabel('Channel Current(A)')
ylabel('Incremental Source Conductance (S)')
legend('nMOS','nMOS weak inversion fit','nMOS strong inversion fit','pMOS','pMOS weak inversion fit','pMOS strong inversion fit')


%% Experiment 3
%nmos
% this one is fine I think
figure
semilogy(Vdn500mV,Icn500mV,'.','MarkerSize',8)
% semilogy(Vdn500mV,exp(polyval(np1,Vdn500mV,1)))
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
semilogy(Vdp4550mV,Icp4550mV,'Marker','.','MarkerSize',8)
%Made this ish negative just so it would fit on graph but ughhh gotta
%mention in lab how it trash

% hold off

xlabel('Drain Voltage (V)')
ylabel('Channel Current (A)')
legend('Vg = 0V','Vg = 4400mV','Vg = 4550mV')


%% Voltage
clf

semilogy(Vdn500mV,Icn500mV,'.','MarkerSize',8)
hold on
np1 = polyfit(Vdn500mV(200:end),log(Icn500mV(200:end)),1);
ny1 = polyval(np1,Vdn500mV(200:end))
semilogy(Vdn500mV(200:end), ny1)

% semilogy(Vdn500mV,exp(polyval(np1,Vdn500mV,1)))
% semilogy(Vdn600mV,Icn600mV,'.','MarkerSize',8)
% semilogy(Vdn700mV,Icn700mV,'.','MarkerSize',8)
% semilogy(Vdn5V,Icn5V,'.','MarkerSize',8)

ylim([10^(-4) 10^(-1.5)])
xlabel('Drain Voltage (V)')
ylabel('Channel Current (A)')
legend('Vg = 500mV','Vg = 600mV','Vg = 5V')

nr1 = roots(np1);



%% early voltage
% not sure what parts of the curves to do a fit on
% if you can tell me where to do the fit then i can finsh this
%Early voltage is x intercept of linear fit of the top flat part, Isat is
%the y intercept, for the pMOS the fits need to be made by doing
%5V-(vector) according to paige, basically treat like nMOS and find x
%intercept

%semilogx

np1 = polyfit(Vdn500mV(200:end),log(-Icn500mV(200:end)),1);
nr1 = roots(np1);
Isatn1 = np1(end)
np2 = polyfit(Vdn600mV(200:end),log(-Icn600mV(200:end)),1);
nr2 = roots(np2);
Isatn2 = np2(end);
np3 = polyfit(Vdn5V(200:end),log(-Icn5V(200:end)),1);
nr3 = roots(np3);
Isatn3 = np3(end);

p1 = polyfit(Vdp0V(5:75),log(Icp0V(5:75)),1);
pr1 = roots(p1);
Isatp1 = p1(end);
p2 = polyfit(Vdp4400mV(5:75),log(Icp4400mV(5:75)),1);
pr2 = roots(p2);
Isatp2 = p2(end);
p3 = polyfit(Vdp4550mV(5:75),log(Icp4550mV(5:75)),1);
pr3 = roots(p3);
Isatp3 = p3(end)
clf
semilogx(Isatn1,nr1,'o','MarkerSize',10)
hold on 
semilogx(Isatn2,nr2,'o','MarkerSize',7)
semilogx(Isatn3,nr3,'o','MarkerSize',8)
semilogx(Isatp1,pr1,'o','MarkerSize',8)
semilogx(Isatp2,pr2,'o','MarkerSize',8)
semilogx(Isatp3,pr3,'o','MarkerSize',8)

xlabel('Saturation Current (A)')
ylabel('Early Voltage (V)')
legend('nMOS Vg = 500mV','nMOS Vg = 600mV','nMOS Vg = 5V','pMOS Vg = 0V','pMOS Vg = 4400mV','pMOS Vg = 4550mV')


%% instrinsic gain

nro1 = 1/nr1(1);
nro2 = 1/nr2(1);
nro3 = 1/nr3(1);
pro1 = 1/p1(1);
pro2 = 1/p2(1);
pro3 = 1/p3(1);


ngain1 = nro1*(((sqrt(Isn*Isatn1))/Ut)*(1-exp(-sqrt(Isatn1/Isn))));
ngain2 = nro2*(((sqrt(Isn*Isatn2))/Ut)*(1-exp(-sqrt(Isatn2/Isn))));
ngain3 = nro3*(((sqrt(Isn*Isatn3))/Ut)*(1-exp(-sqrt(Isatn3/Isn))));
pgain1 = pro1*(((sqrt(Isp*Isatp1))/Ut)*(1-exp(-sqrt(Isatp1/Isp))));
pgain2 = pro2*(((sqrt(Isp*Isatp2))/Ut)*(1-exp(-sqrt(Isatp2/Isp))));
pgain3 = pro3*(((sqrt(Isp*Isatp3))/Ut)*(1-exp(-sqrt(Isatp3/Isp))));
clf
loglog(Isatn1,ngain1,'o','MarkerSize',8)
hold on
loglog(Isatn2,ngain2,'o','MarkerSize',8)
loglog(Isatn3,ngain3,'o','MarkerSize',10)
loglog(Isatp1,pgain1,'o','MarkerSize',8)
loglog(Isatp2,-pgain2,'o','MarkerSize',8)
loglog(Isatp3,-pgain3,'o','MarkerSize',8)

xlabel('Saturation Current (A)')
ylabel('Intrinsic Gain')
legend('nMOS Vg = 500mV','nMOS Vg = 600mV','nMOS Vg = 5V','pMOS Vg = 0V','pMOS Vg = 4400mV','pMOS Vg = 4550mV')

