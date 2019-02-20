%% Experiment 1 
load('matlab.mat')
clf
p1 = polyfit(V1,I1,1); %V1 is the x axis, I1 is the y axis, 1 gives us linear coefficients (y=mx+b so p1=[m b])
y1 = polyval(p1,V1); % generates y values using the coefficents from polyfit
t1 = V1./422; % calculate y values theoretically - I=V/R, our resistor was 422 ohms
plot(V1,I1,'*') % plot our experimental results
hold on % for multiple lines on same plot
plot(V1,y1,'m-') % plot the line of best fit (x axis is still our V1)
plot(V1,t1,'c-') % plot theoretical results
legend('Experimental','Best fit (m = 0.0024)','Theoretical') % make a legend - goes in order of what was plotted
xlabel('Voltage (V)') % label x axis
ylabel('Current (A)') % label y axis
slope1 = p1(1); % pull out the slope from the polyfit results

r11 = corrcoef(I1,y1)
r12 = corrcoef(I1,t1)
r13 = corrcoef(y1,t1)


Resistance = 100*slope1;

%% Experiment 2
load('Lab1Data.mat')
p2 = polyfit(Vin2,Vout2,1); % finding linear coefficients for line of best fit
y2= polyval(p2,Vin2); % generate y values for line of best fit
R1 = 9950.3; % R1
R2 = 9933.9; % R2
t2 = (R2/(R1+R2)).*Vin2; % calculate y values theoretically
clf
plot(Vin2,Vout2,'*'); % plot experimental data
hold on
plot(Vin2,y2,'m-'); % plot line of best fit
plot(Vin2,t2,'c-'); % plot theoritcal results
legend('Experimental','Best fit (m = 0.5022)','Theoretical') 
xlabel('Input Voltage (V)')
ylabel('Output Voltage (V)')
slope2 = p2(1); % slope
r21 = corrcoef(Vout2,y2)
r22 = corrcoef(Vout2,t2)
r23 = corrcoef(t2,y2)
%% Experiment 3
p3 = polyfit(Iin3,Iout3,2); % get coefficients
y3= polyval(p3,Iin3); % generate y values
t3 = -(R1/(R1+R2)).*Iin3; % calculate theoretical y values
clf
plot(Iin3,Iout3,'*'); % plot experimental data
hold on
plot(Iin3,y3,'m-','MarkerSize',12); % plot best fit
plot(Iin3,t3,'c-','MarkerSize',10); % plot theoretical results
legend('Experimental','Best fit (m = -0.5022)','Theoretical')
xlabel('Input Current (I)')
ylabel('Output Current (I)')
slope3 = p3(2);
r3 = corrcoef(Iout3,y3)
r31 = corrcoef(Iout3,t3)
R32 = corrcoef(y3,t3)
%% Experiment 4
pos = [10,100,1000,10000];
pos2 = [1,2,3,4];
n = [1, 2, 3, 4]; 

Iouts1 = [IoutR1(16),IoutR2(16),IoutR3(16),IoutR4(16)];
Iexpected1 = [(-1.5/4.)*(1/10000), (-1.5/8.)*(1/10000),(-1.5/12.)*(1/10000),(-1.5/16.)*(1/10000)]

Iouts = [IoutR1(end),IoutR2(end),IoutR3(end),IoutR4(end)];
Iexpected = [(-5/4.)*(1/10000), (-5/8.)*(1/10000),(-5/12.)*(1/10000),(-5/16.)*(1/10000)]

%I_t = [1.5/(

R3 = 99354;
R4 = 99304;
R5 = 99369;
R6 = 99356;
R7 = 99444;
R8 =  99406;
R9 = 99355;
R10 = 99322;
R11 = 99369;
R12 = 99260;
R13 = 99260;
R14 = 99270;
I1exp = -(5/R1)*((R4 + (((1/(R5+R6))+(1/(R7+(((1/(R8+R9))+(1/(R10+(((1/(R11+R12))+(1/(R13+R14)))^-1))))^-1))))^-1))/(R2+R3+(R4 + (((1/(R5+R6))+(1/(R7+(((1/(R8+R9))+(1/(R10+(((1/(R11+R12))+(1/(R13+R14)))^-1))))^-1))))^-1))))
IoutR1(end)
clf
%semilogy(pos2,Iouts1,'*b');
%hold on
%semilogy(pos2,Iexpected1,'*c');
%hold on
%semilogy(pos2,Iouts,'*r');
%hold on
%semilogy(pos2,Iexpected,'*m');
%hold on
semilogy(pos2,Iexpected1,'*c','MarkerSize',10); %theoretical @ 1.5V
hold on
semilogy(pos2,Iouts1,'-','MarkerSize',12); %experimental @ 1.5V
hold on
plot(pos2,Iexpected,'*r','MarkerSize',10); %Eperimental @ 5 volts
hold on
plot(pos2,Iouts,'-','MarkerSize',12); %theoretical @ 5V
legend('Experimental Current @ 1.5V','Theoretical Current @ 1.5V', 'Experimental Current @ 5V','Theoretical Current @ 5V');
ylabel('Measured Current hrough Branch (log(A))');
xlabel('Position');
Iouts
Iexpected
