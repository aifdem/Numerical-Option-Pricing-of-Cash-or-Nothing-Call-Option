function M_P2 = mass_matrix_p2(number_of_elements, start_of_the_interval, end_of_the_interval)

    number_of_nodes = 2 * number_of_elements + 1;

    S_values = linspace(start_of_the_interval + 1e-250, end_of_the_interval, number_of_nodes);
    x_values = log(S_values(:));

    nodes_p2 = [(1 : number_of_nodes - 2)', (2 : number_of_nodes - 1)', (3 : number_of_nodes)'];
    
    syms x a b c;
    phi1 = ((b - x) * (c - x)) / ((b - a) * (c - a));
    phi2 = ((a - x) * (c - x)) / ((a - b) * (c - b));
    phi3 = ((a - x) * (b - x)) / ((a - c) * (b - c));


    m11 = int(phi1 * phi1, x, a, c);
    m12 = int(phi1 * phi2, x, a, c);
    m13 = int(phi1 * phi3, x, a, c);

    m21 = int(phi2 * phi1, x, a, c);
    m22 = int(phi2 * phi2, x, a, c);
    m23 = int(phi2 * phi3, x, a, c);

    m31 = int(phi3 * phi1, x, a, c);
    m32 = int(phi3 * phi2, x, a, c);
    m33 = int(phi3 * phi3, x, a, c);

    m11_f = matlabFunction(m11, 'Vars', [a, b, c]);
    m12_f = matlabFunction(m12, 'Vars', [a, b, c]);
    m13_f = matlabFunction(m13, 'Vars', [a, b, c]);

    m21_f = matlabFunction(m21, 'Vars', [a, b, c]);
    m22_f = matlabFunction(m22, 'Vars', [a, b, c]);
    m23_f = matlabFunction(m23, 'Vars', [a, b, c]);

    m31_f = matlabFunction(m31, 'Vars', [a, b, c]);
    m32_f = matlabFunction(m32, 'Vars', [a, b, c]);
    m33_f = matlabFunction(m33, 'Vars', [a, b, c]);

    M_P2 = zeros(number_of_nodes, number_of_nodes);

    for e = 1 : 2 : number_of_nodes - 2
        e_nodes = nodes_p2(e, :);

        a_val = x_values(e_nodes(1));
        b_val = x_values(e_nodes(2));
        c_val = x_values(e_nodes(3));

        m11_e = m11_f(a_val, b_val, c_val);
        m12_e = m12_f(a_val, b_val, c_val);
        m13_e = m13_f(a_val, b_val, c_val);

        m21_e = m21_f(a_val, b_val, c_val);
        m22_e = m22_f(a_val, b_val, c_val);
        m23_e = m23_f(a_val, b_val, c_val);

        m31_e = m31_f(a_val, b_val, c_val);
        m32_e = m32_f(a_val, b_val, c_val);
        m33_e = m33_f(a_val, b_val, c_val);

        M_e = [m11_e, m12_e, m13_e; m21_e, m22_e, m23_e; m31_e, m32_e, m33_e];

        M_P2(e : e + 2, e : e + 2) = M_P2(e : e + 2, e : e + 2) + M_e;

    end
    
end