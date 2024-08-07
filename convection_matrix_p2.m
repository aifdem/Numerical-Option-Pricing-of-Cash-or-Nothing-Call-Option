function N_P2 = convection_matrix_p2(number_of_elements, start_of_the_interval, end_of_the_interval)

    number_of_nodes = 2 * number_of_elements + 1;

    S_values = linspace(start_of_the_interval + 1e-250, end_of_the_interval, number_of_nodes);
    x_values = log(S_values(:));

    nodes_p2 = [(1 : number_of_nodes - 2)', (2 : number_of_nodes - 1)', (3 : number_of_nodes)'];
    
    syms x a b c;
    phi1 = ((b - x) * (c - x)) / ((b - a) * (c - a));
    phi2 = ((a - x) * (c - x)) / ((a - b) * (c - b));
    phi3 = ((a - x) * (b - x)) / ((a - c) * (b - c));

    phi1_dx = diff(phi1, x);
    phi2_dx = diff(phi2, x);
    phi3_dx = diff(phi3, x);

    n11 = int(phi1 * phi1_dx, x, a, c);
    n12 = int(phi1 * phi2_dx, x, a, c);
    n13 = int(phi1 * phi3_dx, x, a, c);

    n21 = int(phi2 * phi1_dx, x, a, c);
    n22 = int(phi2 * phi2_dx, x, a, c);
    n23 = int(phi2 * phi3_dx, x, a, c);

    n31 = int(phi3 * phi1_dx, x, a, c);
    n32 = int(phi3 * phi2_dx, x, a, c);
    n33 = int(phi3 * phi3_dx, x, a, c);

    n11_f = matlabFunction(n11, 'Vars', [a, b, c]);
    n12_f = matlabFunction(n12, 'Vars', [a, b, c]);
    n13_f = matlabFunction(n13, 'Vars', [a, b, c]);

    n21_f = matlabFunction(n21, 'Vars', [a, b, c]);
    n22_f = matlabFunction(n22, 'Vars', [a, b, c]);
    n23_f = matlabFunction(n23, 'Vars', [a, b, c]);

    n31_f = matlabFunction(n31, 'Vars', [a, b, c]);
    n32_f = matlabFunction(n32, 'Vars', [a, b, c]);
    n33_f = matlabFunction(n33, 'Vars', [a, b, c]);

    N_P2 = zeros(number_of_nodes, number_of_nodes);

    for e = 1 : 2 : number_of_nodes - 2
        e_nodes = nodes_p2(e, :);

        a_val = x_values(e_nodes(1));
        b_val = x_values(e_nodes(2));
        c_val = x_values(e_nodes(3));

        n11_e = n11_f(a_val, b_val, c_val);
        n12_e = n12_f(a_val, b_val, c_val);
        n13_e = n13_f(a_val, b_val, c_val);

        n21_e = n21_f(a_val, b_val, c_val);
        n22_e = n22_f(a_val, b_val, c_val);
        n23_e = n23_f(a_val, b_val, c_val);

        n31_e = n31_f(a_val, b_val, c_val);
        n32_e = n32_f(a_val, b_val, c_val);
        n33_e = n33_f(a_val, b_val, c_val);

        N_e = [n11_e, n12_e, n13_e; n21_e, n22_e, n23_e; n31_e, n32_e, n33_e];

        N_P2(e : e + 2, e : e + 2) = N_P2(e : e + 2, e : e + 2) + N_e;

    end
    
end
