function [call_price, put_price ] =  MC_barrier_knockin_price(S0, Sb, K, T, r, mu, sigma, numSteps, numPaths)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    S = GRWPaths(S0, mu, sigma, T, numSteps, numPaths);
    
    barrierPrice_call = [];
    barrierPrice_put = [];
    for i=1:numPaths
        inMoney = find(S(:,i) > Sb);
        if length(inMoney) > 0
            barrierPrice_call(i) = max(0, S(end, i) - K);
            barrierPrice_put(i) = max(0, K - S(end, :));        
        else
            barrierPrice_put(i) = 0;
            barrierPrice_put(i) = 0;
        end
    end
    
    call_price = mean(barrierPrice_call)*exp(-r*T);
    put_price = mean(barrierPrice_put)*exp(-r*T);
end

