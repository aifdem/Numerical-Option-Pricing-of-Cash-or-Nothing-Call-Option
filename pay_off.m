function p_o = pay_off(S_val, A, E)
     
    S_val = S_val(:);

    p_o = zeros(size(S_val));

    for i = 1 : length(S_val)
        if S_val(i) > E
            p_o(i) = A;
        elseif S_val(i) < E
            p_o(i) = 0;
        else
            p_o(i) = A / 2;
        end
    end

end
