function K_P2 = stiffness_matrix_p2(number_of_elements, start_of_the_interval, end_of_the_interval)

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

    k11 = int(phi1_dx * phi1_dx, x, a, c);
    k12 = int(phi1_dx * phi2_dx, x, a, c);
    k13 = int(phi1_dx * phi3_dx, x, a, c);

    k21 = int(phi2_dx * phi1_dx, x, a, c);
    k22 = int(phi2_dx * phi2_dx, x, a, c);
    k23 = int(phi2_dx * phi3_dx, x, a, c);

    k31 = int(phi3_dx * phi1_dx, x, a, c);
    k32 = int(phi3_dx * phi2_dx, x, a, c);
    k33 = int(phi3_dx * phi3_dx, x, a, c);

    k11_f = matlabFunction(k11, 'Vars', [a, b, c]);
    k12_f = matlabFunction(k12, 'Vars', [a, b, c]);
    k13_f = matlabFunction(k13, 'Vars', [a, b, c]);

    k21_f = matlabFunction(k21, 'Vars', [a, b, c]);
    k22_f = matlabFunction(k22, 'Vars', [a, b, c]);
    k23_f = matlabFunction(k23, 'Vars', [a, b, c]);

    k31_f = matlabFunction(k31, 'Vars', [a, b, c]);
    k32_f = matlabFunction(k32, 'Vars', [a, b, c]);
    k33_f = matlabFunction(k33, 'Vars', [a, b, c]);

    K_P2 = zeros(number_of_nodes, number_of_nodes);

    for e = 1 : 2 : number_of_nodes - 2
        e_nodes = nodes_p2(e, :);

        a_val = x_values(e_nodes(1));
        b_val = x_values(e_nodes(2));
        c_val = x_values(e_nodes(3));

        k11_e = k11_f(a_val, b_val, c_val);
        k12_e = k12_f(a_val, b_val, c_val);
        k13_e = k13_f(a_val, b_val, c_val);

        k21_e = k21_f(a_val, b_val, c_val);
        k22_e = k22_f(a_val, b_val, c_val);
        k23_e = k23_f(a_val, b_val, c_val);

        k31_e = k31_f(a_val, b_val, c_val);
        k32_e = k32_f(a_val, b_val, c_val);
        k33_e = k33_f(a_val, b_val, c_val);

        K_e = [k11_e, k12_e, k13_e; k21_e, k22_e, k23_e; k31_e, k32_e, k33_e];

        K_P2(e : e + 2, e : e + 2) = K_P2(e : e + 2, e : e + 2) + K_e;

    end
    
end
