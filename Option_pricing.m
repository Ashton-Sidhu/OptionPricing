clc;
clear all;
format long

% Pricing a European option using Black-Scholes formula and Monte Carlo simulations
% Pricing a Barrier option using Monte Carlo simulations

S0 = 100;     % spot price of the underlying stock today
K = 105;      % strike at expiry
mu = 0.05;    % expected return
sigma = 0.2;  % volatility
r = 0.05;     % risk-free rate
T = 1.0;      % years to expiry
Sb = 110;     % barrier

% Define variable numSteps to be the number of steps for multi-step MC
% numPaths - number of sample paths used in simulations

% Implement your Black-Scholes pricing formula
[call_BS_European_Price, putBS_European_Price] = BS_european_price(S0, K, T, r, sigma);

% Implement your one-step Monte Carlo pricing procedure for European option
numPaths = 100000;
[callMC_European_Price_1_step, putMC_European_Price_1_step, ~] = MC_european_price(S0, K, T, r, mu, sigma, 1, numPaths);
numSteps = 365;
% Implement your multi-step Monte Carlo pricing procedure for European option
[callMC_European_Price_multi_step, putMC_European_Price_multi_step, Spaths] = MC_european_price(S0, K, T, r, mu, sigma, numSteps, numPaths);


% Implement your one-step Monte Carlo pricing procedure for Barrier option
% numSteps = 1;
%numPaths = 50000;
[callMC_Barrier_Knockin_Price_1_step, putMC_Barrier_Knockin_Price_1_step] = ...
    MC_barrier_knockin_price(S0, Sb, K, T, r, mu, sigma, 1, numPaths);


% Implement your multi-step Monte Carlo pricing procedure for Barrier option
[callMC_Barrier_Knockin_Price_multi_step, putMC_Barrier_Knockin_Price_multi_step] = ...
    MC_barrier_knockin_price(S0, Sb, K, T, r, mu, sigma, numSteps, numPaths);

[callMC_Barrier_Knockin_Price_1_step_incvol, putMC_Barrier_Knockin_Price_1_step_incvol] = ...
    MC_barrier_knockin_price(S0, Sb, K, T, r, mu, sigma*1.1, 1, numPaths);


[callMC_Barrier_Knockin_Price_multi_step_incvol, putMC_Barrier_Knockin_Price_multi_step_incvol] = ...
    MC_barrier_knockin_price(S0, Sb, K, T, r, mu, sigma*1.1, numSteps, numPaths);

[callMC_Barrier_Knockin_Price_1_step_decvol, putMC_Barrier_Knockin_Price_1_step_decvol] = ...
    MC_barrier_knockin_price(S0, Sb, K, T, r, mu, sigma*.9, 1, numPaths);


[callMC_Barrier_Knockin_Price_multi_step_decvol, putMC_Barrier_Knockin_Price_multi_step_decvol] = ...
    MC_barrier_knockin_price(S0, Sb, K, T, r, mu, sigma*.9, numSteps, numPaths);


disp(['Black-Scholes price of an European call option is ',num2str(call_BS_European_Price)])
disp(['Black-Scholes price of an European put option is ',num2str(putBS_European_Price)])
disp(['One-step MC price of an European call option is ',num2str(callMC_European_Price_1_step)])
disp(['One-step MC price of an European put option is ',num2str(putMC_European_Price_1_step)])
disp(['Multi-step MC price of an European call option is ',num2str(callMC_European_Price_multi_step)])
disp(['Multi-step MC price of an European put option is ',num2str(putMC_European_Price_multi_step)])
disp(['One-step MC price of an Barrier call option is ',num2str(callMC_Barrier_Knockin_Price_1_step)])
disp(['One-step MC price of an Barrier put option is ',num2str(putMC_Barrier_Knockin_Price_1_step)])
disp(['Multi-step MC price of an Barrier call option is ',num2str(callMC_Barrier_Knockin_Price_multi_step)])
disp(['Multi-step MC price of an Barrier put option is ',num2str(putMC_Barrier_Knockin_Price_multi_step)])
disp(['One-step MC price of an Barrier call with increased volatility of 10% option is ',num2str(callMC_Barrier_Knockin_Price_1_step_incvol)])
disp(['One-step MC price of an Barrier put with increased volatility of 10% option is ',num2str(putMC_Barrier_Knockin_Price_1_step_incvol)])
disp(['Multi-step MC price of an Barrier call with increased volatility of 10% option is ',num2str(callMC_Barrier_Knockin_Price_multi_step_incvol)])
disp(['Multi-step MC price of an Barrier put with increased volatility of 10% option is ',num2str(putMC_Barrier_Knockin_Price_multi_step_incvol)])
disp(['One-step MC price of an Barrier call with decreased volatility of 10% option is ',num2str(callMC_Barrier_Knockin_Price_1_step_decvol)])
disp(['One-step MC price of an Barrier put with decreased volatility of 10% option is ',num2str(putMC_Barrier_Knockin_Price_1_step_decvol)])
disp(['Multi-step MC price of an Barrier call with decreased volatility of 10% option is ',num2str(callMC_Barrier_Knockin_Price_multi_step_decvol)])
disp(['Multi-step MC price of an Barrier put with decreased volatility of 10% option is ',num2str(putMC_Barrier_Knockin_Price_multi_step_decvol)])




% Plot results
figure(1);
%%%%%%%%%%% Insert your code here %%%%%%%%%%%%
plot(Spaths);
title('Monte Carlo Pricing');
xlabel('Steps');
ylabel('Price');
