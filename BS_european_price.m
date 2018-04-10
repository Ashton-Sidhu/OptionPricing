function [ call_price, put_price ] = BS_european_price(S0, K, T, r, sigma)

    t = 0;
    expPart = exp(-r*(T-t));
    d1 = log(S0 / K) + (r + sigma^2 / 2) * T;
    d1 = d1 / (sigma * sqrt(T));
    d2 = d1 - sigma * sqrt(T-t);
    
    call_price = normcdf(d1) * S0 - normcdf(d2) * K * expPart;
    put_price = normcdf(-d2) * K * expPart - normcdf(-d1) * S0;
end

