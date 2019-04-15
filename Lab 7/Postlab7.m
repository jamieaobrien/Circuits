%%
load('Postlab7.mat')
%%
Idiff2 = I1bb2 - I2bb2;
Isum2 = I1bb2 + I2bb2;
Idiff3 = I1bb3 - I2bb3;
Isum3 = I1bb3 + I2bb3;
Idiff4 = I1bb4 - I2bb4;
Isum4 = I1bb4 + I2bb4;

plot(Vdm,I1bb2,'b.')
hold on
plot(Vdm,I2bb2,'b:','MarkerSize',20)
plot(Vdm,Idiff2,'b.-')
plot(Vdm,Isum2,'bx')
plot(Vdm,I1bb3,'r.')
plot(Vdm,I2bb3,'r:')
plot(Vdm,Idiff3,'r.-')
plot(Vdm,Isum3,'rx')
plot(Vdm,I1bb4,'k.')
plot(Vdm,I2bb4,'k:')
plot(Vdm,Idiff4,'k.-')
plot(Vdm,Isum4,'kx')
xlabel('V1-V2 (V)')
ylabel('Current (A)')
legend('I1,V2=2V','I2,V2=2V','I1-I2,V2=2V','I1+I2,V2=2V','I1,V2=3V','I2,V2=3V','I1-I2,V2=3V','I1+I2,V2=3V','I1,V2=4V','I2,V2=4V','I1-I2,V2=4V','I1+I2,V2=4V','Location','eastoutside')

figure
plot(Vdm,Vbb2,'b.')
hold on
plot(Vdm,Vbb3,'r.')
plot(Vdm,Vbb4,'k.')
xlabel('V1-V2 (V)')
ylabel('Voltage @ Node V (V)')
legend('V2=2V','V2=3V','V2=4V','Location','Northwest')


%%
Vx = vx(1:51);
Vy1 = Vn001(1:51);
Vy2 = Vn001(53:103);
Vy3 = Vn001(105:155);
Vy4 = Vn001(157:207);
Vy5 = Vn001(209:259);

Vz1 = sqrt(Vx.^2 + 1)
Vz2 = sqrt(Vx.^2 + 4)
Vz3 = sqrt(Vx.^2 + 9)
Vz4 = sqrt(Vx.^2 + 16)
Vz5 = sqrt(Vx.^2 + 25)

plot(Vx, Vy1, 'ro')
hold on
plot(Vx, Vy2, 'bo')
hold on
plot(Vx, Vy3, 'ko')
hold on
plot(Vx, Vy4, 'go')
hold on
plot(Vx, Vy5, 'co')

plot(Vx, Vz1, 'r-')
plot(Vx, Vz2, 'b-')
plot(Vx, Vz3, 'k-')
plot(Vx, Vz4, 'g-')
plot(Vx, Vz5, 'c-')

lgd = legend('Exp Vy = 1V','Exp Vy = 2V', 'Exp Vy = 3V', 'Exp Vy = 4V', 'Exp Vy = 5V','Theo Vy = 1V','Theo Vy = 2V', 'Theo Vy = 3V', 'Theo Vy = 4V', 'Theo Vy = 5V');
title('Vz as a Function fo Vx and Vy');
ylabel('Vz (V)');
xlabel('Vx (V)')