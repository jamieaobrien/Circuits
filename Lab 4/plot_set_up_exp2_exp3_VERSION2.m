load('Exp2Data.mat') % .mat file
% load('Exp3Data.mat') % .mat file
%%
clf
load('Exp2aData_LTSpice.mat')
% loglog(Ix250 ,Iz250 ,'Marker','.','MarkerSize',12) % Ix1, Iz1, Marker stuff - I found this looks pretty good
% hold on
% loglog(Ix25k ,Iz25k ,'Marker','.','MarkerSize',12) % Ix2, Iz2, Marker stuff - I found this looks pretty good
% loglog(Ix2k ,Iz2k ,'Marker','.','MarkerSize',12) % Ix3, Iz3, Marker stuff - I found this looks pretty good
% xlabel('Log of Ix (A)')
% ylabel('Log of Iz (A)')
% 
% legend('250','25k','2k') % name them, probably something to do with each value of Iy

loglog(ix,Iz1_exp2a ,'b','Marker','.','MarkerSize',12) % Ix1, Iz1, Marker stuff - I found this looks pretty good
hold on
loglog(ix,Iz2_exp2a,'r','Marker','.','MarkerSize',12) % Ix2, Iz2, Marker stuff - I found this looks pretty good
loglog(ix,Iz3_exp2a,'g','Marker','.','MarkerSize',12) % Ix3, Iz3, Marker stuff - I found this looks pretty good
xlabel('Ix (A)')
ylabel('Iz (A)')

Iz1theo1 = sqrt(ix.*(10^-3));
Iz2theo1 = sqrt(ix.*(10^-4));
Iz3theo1 = sqrt(ix.*(10^-5));

loglog(ix,Iz1theo1,'b')
loglog(ix,Iz2theo1,'r')
loglog(ix,Iz3theo1,'g')

legend('I_y = 1mA','I_y = 100\muA','I_y = 10\muA', 'I_z = sqrt(I_x*1mA)', 'I_z = sqrt(I_x*100\muA)', 'I_z = sqrt(I_x*10\muA)') % name them, probably something to do with each value of Iy




%%
clf
load('Exp2bData_LTSpice.mat')

loglog(iy,Iz1_exp2b ,'b','Marker','.','MarkerSize',12) % Ix1, Iz1, Marker stuff - I found this looks pretty good
hold on
loglog(iy,Iz2_exp2b,'r','Marker','.','MarkerSize',12) % Ix2, Iz2, Marker stuff - I found this looks pretty good
loglog(iy,Iz3_exp2b,'g','Marker','.','MarkerSize',12) % Ix3, Iz3, Marker stuff - I found this looks pretty good
xlabel('Iy (A)')
ylabel('Iz (A)')

Iz1theo2 = sqrt((10^-3).*(iy));
Iz2theo2 = sqrt((10^-4)*(iy));
Iz3theo2 = sqrt((10^-5)*(iy));
% 
% p1 = polyfit(Iy1source(1:15),-Iz1source(1:15),1);
% y1 = polyval(p1,Iy1source);
% p2 = polyfit(Iy2source(1:15),-Iz2source(1:15),1);
% y2 = polyval(p2, Iy2source);
% p3 = polyfit(Iy3source(1:15),-Iz3source(1:15),1);
% y3 = polyval(p3, Iy3source);


% loglog(iy,y1,'b')
% loglog(iy,y2,'r')
% loglog(iy,y3,'g')

loglog(iy,Iz1theo2,'b')
loglog(iy,Iz2theo2,'r')
loglog(iy,Iz3theo2,'g')

ylim([10e-8,10e-2])
legend('I_x = 1mA','I_x = 100\muA','I_x = 10\muA', 'I_x = 1mA fit', 'I_x = 100\muA fit', 'I_x = 10\muA fit') % name them, probably something to do with each value of Ix


%%
clf
load('Exp3aData_LTSpice.mat')

loglog(ix,Iz1_exp3a ,'b','Marker','.','MarkerSize',12) % Ix1, Iz1, Marker stuff - I found this looks pretty good
hold on
loglog(ix,Iz2_exp3a,'r','Marker','.','MarkerSize',12) % Ix2, Iz2, Marker stuff - I found this looks pretty good
loglog(ix,Iz3_exp3a,'g','Marker','.','MarkerSize',12) % Ix3, Iz3, Marker stuff - I found this looks pretty good
xlabel('Ix (A)')
ylabel('Iz (A)')

% 
Iz1theo3 = (ix.^2)/(10^-3);
Iz2theo3 = (ix.^2)/(10^-4);
Iz3theo3 = (ix.^2)/(10^-5);
% 
loglog(ix,(Iz1theo3),'b')
loglog(ix,(Iz2theo3),'r')
loglog(ix,(Iz3theo3),'g')


legend('I_y = 1mA','I_y = 100\muA','I_y = 10\muA', 'I_y = 1mA fit', 'I_y = 100\muA fit', 'I_y = 10\muA fit') % name them, probably something to do with each value of Iy


%%
clf
load('Exp3bData_LTSpice.mat')

loglog(iy,Iz1_exp3b, 'b','Marker','.','MarkerSize',12) % Ix1, Iz1, Marker stuff - I found this looks pretty good
hold on
loglog(iy,Iz2_exp3b,'r','Marker','.','MarkerSize',12) % Ix2, Iz2, Marker stuff - I found this looks pretty good
loglog(iy,Iz3_exp3b, 'g','Marker','.','MarkerSize',12) % Ix3, Iz3, Marker stuff - I found this looks pretty good

xlabel('Iy (A)')
ylabel('Iz (A)')
% 
% Iz1theo4 = (Ix250Si.^2)/(3/250);
% Iz2theo4 = (Ix250Si.^2)/(3/2500);
% Iz3theo4 = (Ix250Si.^2)/(3/25000);

Iz1theo4 = (10^-3)^2./iy;
Iz2theo4 = (10^-4)^2./iy;
Iz3theo4 = (10^-5)^2./iy;



loglog(iy,Iz1theo4,'b')
loglog(iy,Iz2theo4,'r')
loglog(iy,Iz3theo4,'g')

% ylim([10e-11,10e-1])
legend('I_x = 1mA','I_x = 100\muA','I_x = 10\muA', 'I_x = 1mA fit', 'I_x = 100\muA fit', 'I_x = 10\muA fit') % name them, probably something to do with each value of Ix



