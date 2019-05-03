load('Exp2Data.mat') % .mat file
load('Exp3Data.mat') % .mat file
%%
clf
loglog(Ix250 ,Iz250 ,'Marker','.','MarkerSize',12) % Ix1, Iz1, Marker stuff - I found this looks pretty good
hold on
loglog(Ix25k ,Iz25k ,'Marker','.','MarkerSize',12) % Ix2, Iz2, Marker stuff - I found this looks pretty good
loglog(Ix2k ,Iz2k ,'Marker','.','MarkerSize',12) % Ix3, Iz3, Marker stuff - I found this looks pretty good
xlabel('Log of Ix (A)')
ylabel('Log of Iz (A)')

legend('250','25k','2k') % name them, probably something to do with each value of Iy

loglog(Ix1,-Iz1 ,'b','Marker','.','MarkerSize',12) % Ix1, Iz1, Marker stuff - I found this looks pretty good
hold on
loglog(Ix2,-Iz2,'r','Marker','.','MarkerSize',12) % Ix2, Iz2, Marker stuff - I found this looks pretty good
loglog(Ix3,-Iz3,'g','Marker','.','MarkerSize',12) % Ix3, Iz3, Marker stuff - I found this looks pretty good
xlabel('Log of Ix (A)')
ylabel('Log of Iz (A)')

Iz1theo1 = sqrt(Ix1.*(10^-3));
Iz2theo1 = sqrt(Ix1.*(10^-4));
Iz3theo1 = sqrt(Ix1.*(10^-5));

loglog(Ix1,Iz1theo1,'b')
loglog(Ix1,Iz2theo1,'r')
loglog(Ix1,Iz3theo1,'g')

legend('I_y = 1mA','I_y = 100\muA','I_y = 10\muA', 'I_z = sqrt(I_x*1mA)', 'I_z = sqrt(I_x*100\muA)', 'I_z = sqrt(I_x*10\muA)') % name them, probably something to do with each value of Iy




%%
clf

loglog(Iy1source,-Iz1source,'b','Marker','.','MarkerSize',12) % Iy1, Iz1, Marker stuff - I found this looks pretty good
hold on
loglog(Iy1source,-Iz2source,'r','Marker','.','MarkerSize',12) % Iy2, Iz2, Marker stuff - I found this looks pretty good
loglog(Iy1source,-Iz3source,'g','Marker','.','MarkerSize',12) % Iy3, Iz3, Marker stuff - I found this looks pretty good
xlabel('Iy (A)')
ylabel('Iz (A)')

% Iz1theo2 = sqrt((3/250)*(Iy1source));
% Iz2theo2 = sqrt((3/2500)*(Iy1source));
% Iz3theo2 = sqrt((3/25000)*(Iy1source));

p1 = polyfit(Iy1source(1:15),-Iz1source(1:15),1);
y1 = polyval(p1,Iy1source);
p2 = polyfit(Iy2source(1:15),-Iz2source(1:15),1);
y2 = polyval(p2, Iy2source);
p3 = polyfit(Iy3source(1:15),-Iz3source(1:15),1);
y3 = polyval(p3, Iy3source);


loglog(Ix1,y1,'b')
loglog(Ix1,y2,'r')
loglog(Ix1,y3,'g')

ylim([10e-6,10e-2])
legend('I_x = 12mA','I_x = 1.2mA','I_x = 120\muA', 'I_x = 12mA fit', 'I_x = 1.2mA fit', 'I_x = 120\muA fit') % name them, probably something to do with each value of Ix


%%
clf
% loglog(Ix250Si ,Iz250Si ,'Marker','.','MarkerSize',12) % Iy1, Iz1, Marker stuff - I found this looks pretty good
% hold on
% loglog(Ix25kSi ,Iz25kSi ,'Marker','.','MarkerSize',12) % Iy2, Iz2, Marker stuff - I found this looks pretty good
% loglog(Ix2kSi , Iz2kSi,'Marker','.','MarkerSize',12) % Iy3, Iz3, Marker stuff - I found this looks pretty good

loglog(Ix250,-Iz250, 'b','Marker','.','MarkerSize',12) % Ix1, Iz1, Marker stuff - I found this looks pretty good
hold on
loglog(Ix250,-Iz2k,'r','Marker','.','MarkerSize',12) % Ix2, Iz2, Marker stuff - I found this looks pretty good
loglog(Ix250,-Iz25k, 'g','Marker','.','MarkerSize',12) % Ix3, Iz3, Marker stuff - I found this looks pretty good
xlabel('Ix (A)')
ylabel('Iz (A)')
% 
% Iz1theo3 = (Ix250.^2)/(10^-3);
% Iz2theo3 = (Ix250.^2)/(10^-4);
% Iz3theo3 = (Ix250.^2)/(10^-5);

p4 = polyfit(log(Ix250) ,log(-Iz250),2);
y4 = polyval(p1,log(Ix250));
p5 = polyfit(log(Ix25k) ,log(-Iz25k),3);
y5 = polyval(p2, log(Ix25k));
p6 = polyfit(log(Ix2k) , log(-Iz2k),4);
y6 = polyval(p3, log(Ix2k));

loglog(Ix1,exp(y4),'b')
loglog(Ix1,exp(y5),'r')
loglog(Ix1,exp(y6),'g')

legend('I_y = 1mA','I_y = 100\muA','I_y = 10\muA', 'I_y = 1mA fit', 'I_y = 100\muA fit', 'I_y = 10\muA fit') % name them, probably something to do with each value of Iy


%%
clf

loglog(Ix250Si,-Iz250Si, 'b','Marker','.','MarkerSize',12) % Ix1, Iz1, Marker stuff - I found this looks pretty good
hold on
loglog(Ix250Si,-Iz2kSi,'r','Marker','.','MarkerSize',12) % Ix2, Iz2, Marker stuff - I found this looks pretty good
loglog(Ix250Si,-Iz25kSi, 'g','Marker','.','MarkerSize',12) % Ix3, Iz3, Marker stuff - I found this looks pretty good

xlabel('Log of Iy (A)')
ylabel('Log of Iz (A)')
% 
% Iz1theo4 = (Ix250Si.^2)/(3/250);
% Iz2theo4 = (Ix250Si.^2)/(3/2500);
% Iz3theo4 = (Ix250Si.^2)/(3/25000);

p7 = polyfit(log(Ix250Si(3:33)),log(-Iz250Si(3:33)),1);
y7 = polyval(p7,log(Ix250Si));
p8 = polyfit(log(Ix2kSi(15:32)),log(-Iz2kSi(15:32)),1);
y8 = polyval(p8,log(Ix2kSi));
p9 = polyfit(log(Ix25kSi(25:30)),log(-Iz25kSi(25:30)),1);
y9 = polyval(p9,log(Ix25kSi));

loglog(Ix1,exp(y7),'b')
loglog(Ix1,exp(y8),'r')
loglog(Ix1,exp(y9),'g')
ylim([10e-11,10e-1])
legend('I_x = 12mA','I_x = 1.2mA','I_x = 120\muA', 'I_x = 12mA fit', 'I_x = 1.2mA fit', 'I_x = 120\muA fit') % name them, probably something to do with each value of Iy



