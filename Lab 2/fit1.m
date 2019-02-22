function [fitresult, gof] = fit1(Vin1b, Iin1b,g)
%CREATEFIT1(VIN1B,IIN1B)
%  Create a fit.
%
%  Data for 'fit1' fit:
%      X Input : Vin1b
%      Y Output: Iin1b
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  See also FIT, CFIT, SFIT.

%  Auto-generated by MATLAB on 20-Feb-2019 00:03:04


%% Fit: 'fit1'.
[xData, yData] = prepareCurveData( Vin1b, Iin1b );

% Set up fittype and options.
ft = fittype( 'exp2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Normalize = 'on';
opts.StartPoint = [1.58222999690913e-06 5.27225566417519 0 5.27225566417519];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'fit1' );
plot( fitresult );
hold on
plot(Vin1b,Iin1b)
plot(Vin1b, exp(g));
legend( 'Current-Voltage Characteristic', 'Exponential fit - R = 0.9998 ','Is = 6.8568e-15 A, uT = -0.0263 V', 'Location', 'NorthEast' );
% Label axes
xlabel('Voltage (V)')
ylabel('Current (A)')
grid on

