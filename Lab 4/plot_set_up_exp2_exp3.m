load('') % .mat file
%%
clf

loglog( , ,'Marker','.','MarkerSize',12) % Ix1, Iz1, Marker stuff - I found this looks pretty good
hold on
loglog( , ,'Marker','.','MarkerSize',12) % Ix2, Iz2, Marker stuff - I found this looks pretty good
loglog( , ,'Marker','.','MarkerSize',12) % Ix3, Iz3, Marker stuff - I found this looks pretty good
xlabel('Log of Ix (A)')
ylabel('Log of Iz (A)')

legend('','','') % name them, probably something to do with each value of Iy

%%
clf

loglog( , ,'Marker','.','MarkerSize',12) % Iy1, Iz1, Marker stuff - I found this looks pretty good
hold on
loglog( , ,'Marker','.','MarkerSize',12) % Iy2, Iz2, Marker stuff - I found this looks pretty good
loglog( , ,'Marker','.','MarkerSize',12) % Iy3, Iz3, Marker stuff - I found this looks pretty good
xlabel('Log of Iy (A)')
ylabel('Log of Iz (A)')

legend('','','') % name them, probably something to do with each value of Ix
