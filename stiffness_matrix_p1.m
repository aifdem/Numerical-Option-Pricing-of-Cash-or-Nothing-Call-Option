function K_P1 = stiffness_matrix_p1(number_of_elements, start_of_the_interval, end_of_the_interval)

    number_of_nodes = number_of_elements + 1;
    
    S_values = linspace(start_of_the_interval + 1e-250, end_of_the_interval, number_of_nodes);
    x_values = log(S_values(:));
    nodes_p1 = [(1 : number_of_nodes - 1)', (2 : number_of_nodes)'];
    
    K_P1 = zeros(number_of_nodes, number_of_nodes);

    for e = 1 : number_of_elements 
        x_val1 = x_values(nodes_p1(e, 1));
        x_val2 = x_values(nodes_p1(e, 2));
        length = x_val2 - x_val1;
        K_e = (1 / length) * [1, -1; -1, 1];
        K_P1(e : e + 1, e : e + 1) = K_P1(e : e + 1, e : e + 1) + K_e;
    end
end
