# Numerical-Option-Pricing-of-Cash-or-Nothing-Call-Option
This repository presents a numerical approach to pricing a Cash-or-Nothing Call option using the Finite Element Method (FEM). The project specifically implements the Galerkin Method with both linear(P1) and quadratic(P2) basis functions to solve the partial differential equations (PDEs) governing the option pricing model.

The solutions and results could be found in the file "CoN_P1_P2_approximation.mlx"

#### Black-Scholes Equation Parameters:

- Strike Price (E): 1
- Initial Asset Price (A): 2
- Risk-Free Rate (r): 0.05
- Volatility (σ): 0.2
- Time to Maturity (T): 1 year

#### Spacial and Temporal Discretization:

- Number of spatial elements: 50
- Spatial interval: [0, 2]
- Number of time elements: 50
- Temporal interval: [0, 1]
- Time step (Δt): 0.02

## Purpose:
The goal of this project is to demonstrate the effectiveness of FEM, particularly the Galerkin Method, in accurately pricing options, and to explore the impact of different basis functions on the numerical results.

## Results of approximation with linear basis functions(P1)

![image](https://github.com/user-attachments/assets/9499f1b8-5fce-46a0-b7ad-9e0fe04d19f3)
![image](https://github.com/user-attachments/assets/0426b96a-5820-45f1-b6f8-a53123c49258)


## Results of approximation with quadratic basis functions(P2)
![image](https://github.com/user-attachments/assets/bc343c74-4c0a-4924-9862-4ce2522ee63f)

![image](https://github.com/user-attachments/assets/fd720b4e-d137-4ac7-aca2-19c8d2bb150f)






