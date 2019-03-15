load('Exp2Data') % .mat file
load('Exp3Data') % .mat file
%%
clf

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
xlabel('Log of Iy (A)')
ylabel('Log of Iz (A)')

Iz1theo2 = sqrt((3/250)*(Iy1source));
Iz2theo2 = sqrt((3/2500)*(Iy1source));
Iz3theo2 = sqrt((3/25000)*(Iy1source));

loglog(Ix1,Iz1theo2,'b')
loglog(Ix1,Iz2theo2,'r')
loglog(Ix1,Iz3theo2,'g')


legend('I_x = 12mA','I_x = 1.2mA','I_x = 120\muA', 'I_z = sqrt(12mA*I_y)', 'I_z = sqrt(1.2mA*I_y)', 'I_z = sqrt(120\muA*I_y)') % name them, probably something to do with each value of Ix

%%
clf

loglog(Ix250,-Iz250, 'b','Marker','.','MarkerSize',12) % Ix1, Iz1, Marker stuff - I found this looks pretty good
hold on
loglog(Ix250,-Iz2k,'r','Marker','.','MarkerSize',12) % Ix2, Iz2, Marker stuff - I found this looks pretty good
loglog(Ix250,-Iz25k, 'g','Marker','.','MarkerSize',12) % Ix3, Iz3, Marker stuff - I found this looks pretty good
xlabel('Log of Ix (A)')
ylabel('Log of Iz (A)')

Iz1theo3 = (Ix250.^2)/(10^-3);
Iz2theo3 = (Ix250.^2)/(10^-4);
Iz3theo3 = (Ix250.^2)/(10^-5);

loglog(Ix1,Iz1theo3)
loglog(Ix1,Iz2theo3)
loglog(Ix1,Iz3theo3)

legend('I_y = 1mA','I_y = 100\muA','I_y = 10\muA', 'I_z = (I_x)^2/1mA', 'I_z = (I_x)^2/100\muA', 'I_z = (I_x)^2/10\muA') % name them, probably something to do with each value of Iy


%%
clf

loglog(Ix250Si,-Iz250Si, 'b','Marker','.','MarkerSize',12) % Ix1, Iz1, Marker stuff - I found this looks pretty good
hold on
loglog(Ix250Si,-Iz2kSi,'r','Marker','.','MarkerSize',12) % Ix2, Iz2, Marker stuff - I found this looks pretty good
loglog(Ix250Si,-Iz25kSi, 'g','Marker','.','MarkerSize',12) % Ix3, Iz3, Marker stuff - I found this looks pretty good
xlabel('Log of Iy (A)')
ylabel('Log of Iz (A)')

Iz1theo4 = (Ix250Si.^2)/(3/250);
Iz2theo4 = (Ix250Si.^2)/(3/2500);
Iz3theo4 = (Ix250Si.^2)/(3/25000);

loglog(Ix1,Iz1theo4,'b')
loglog(Ix1,Iz2theo4,'r')
loglog(Ix1,Iz3theo4,'g')

legend('I_x = 12mA','I_x = 1.2mA','I_x = 120\muA', 'I_z = (12mA)^2/I_y', 'I_z = (1.2mA)^2/I_y', 'I_z = (120\muA)^2/I_y') % name them, probably something to do with each value of Iy



