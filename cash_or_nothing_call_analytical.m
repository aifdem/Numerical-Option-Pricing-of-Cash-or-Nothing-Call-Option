function Z = cash_or_nothing_call_analytical(E, A, r, sigma, T, L)

    t_values = linspace(0, T, L + 1);
    s_values = linspace(0, A, L + 1);
    
    [X, Y] = meshgrid(s_values, t_values);
    
    Z = zeros(L + 1, L + 1);
    for i = 1 : L + 1
        for j = 1 : L + 1
            S = s_values(j);
            t = t_values(i);
            d2 = (log(S / E) + (r - (0.5 * sigma ^ 2) * (T - t))) / (sigma * sqrt(T - t));
            price = A * exp(-r * (T - t)) * normcdf(d2, 0, 1);
            Z(i, j) = price;
        end
    end
    
    % surf(X, Y, Z);
    % xlabel('Asset Price (S)');
    % ylabel('Time to Maturity (t)');
    % zlabel('Option Value (C_{cash})');
    % title('Analytical Solution of Cash-or-Nothing Call Option');
    
end
