function [ call_price, put_price, S ] = MC_european_price(S0, K, T, r, mu, sigma, numSteps, numPaths)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    S = GRWPaths(S0, mu, sigma, T, numSteps, numPaths);
    
    option_call_price = max(0, S(end, :) - K);
    option_put_price = max(0, K - S(end, :));
    
    call_price = mean(option_call_price) * exp(-r*T);
    put_price = mean(option_put_price) * exp(-r*T);
end

