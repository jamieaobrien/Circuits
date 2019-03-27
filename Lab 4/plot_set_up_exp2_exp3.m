load('') % .mat file
%%
clf

loglog(Ix250 ,Iz250 ,'Marker','.','MarkerSize',12) % Ix1, Iz1, Marker stuff - I found this looks pretty good
hold on
loglog(Ix25k ,Iz25k ,'Marker','.','MarkerSize',12) % Ix2, Iz2, Marker stuff - I found this looks pretty good
loglog(Ix2k ,Iz2k ,'Marker','.','MarkerSize',12) % Ix3, Iz3, Marker stuff - I found this looks pretty good
xlabel('Log of Ix (A)')
ylabel('Log of Iz (A)')

legend('250','25k','2k') % name them, probably something to do with each value of Iy

%%
clf

loglog(Ix250Si ,Iz250Si ,'Marker','.','MarkerSize',12) % Iy1, Iz1, Marker stuff - I found this looks pretty good
hold on
loglog(Ix25kSi ,Iz25kSi ,'Marker','.','MarkerSize',12) % Iy2, Iz2, Marker stuff - I found this looks pretty good
loglog(Ix2kSi , Iz2kSi,'Marker','.','MarkerSize',12) % Iy3, Iz3, Marker stuff - I found this looks pretty good
xlabel('Log of Iy (A)')
ylabel('Log of Iz (A)')

legend('','','') % name them, probably something to do with each value of Ix
