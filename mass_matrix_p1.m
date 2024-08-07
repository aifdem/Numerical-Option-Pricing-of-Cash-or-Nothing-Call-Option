function M_P1 = mass_matrix_p1(number_of_elements, start_of_the_interval, end_of_the_interval)

    number_of_nodes = number_of_elements + 1;
    
    S_values = linspace(start_of_the_interval + 1e-250, end_of_the_interval, number_of_nodes);
    x_values = log(S_values(:));
    
    nodes_p1 = [(1 : number_of_nodes - 1)', (2 : number_of_nodes)'];
    
    M_P1 = zeros(number_of_nodes, number_of_nodes);

    for e = 1 : number_of_elements 
        x_val1 = x_values(nodes_p1(e, 1));
        x_val2 = x_values(nodes_p1(e, 2));
        length = x_val2 - x_val1;
        M_e = (length / 6) * [2, 1; 1, 2];
        M_P1(e : e + 1, e : e + 1) = M_P1(e : e + 1, e : e + 1) + M_e;
    end
end
