function N_P1 = convection_matrix_p1(number_of_elements)

    number_of_nodes = number_of_elements + 1;
    N_P1 = zeros(number_of_nodes, number_of_nodes);
    N_e_P1 = (1 / 2) * [-1, 1; -1, 1];

    for e = 1 : number_of_elements
        N_P1(e : e + 1, e : e + 1) = N_P1(e : e + 1, e : e + 1) + N_e_P1;
    end
    
end
