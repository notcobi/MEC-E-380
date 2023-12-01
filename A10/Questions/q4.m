clc; clear; close all;
syms x y c1 c2 c3 c4 c5 c6 h p0 L t real 
Phi = -c1*x*y + c2*x^3/6 - c3*x^3*y/6 - c4*x*y^3/6 - c5*x^3*y^3/9 - c6*x*y^5/20;
% Define the stress components
sigma_x = diff(Phi, y, 2);
sigma_y = diff(Phi, x, 2);
tau_xy = -diff(Phi, x, y);

% biharmonic equation
eqn1 = diff(sigma_x, x, 2) + 2*diff(tau_xy, x, y) + diff(sigma_y, y, 2) == 0;

% boundary conditions
eqn2 = subs(sigma_y, y, h/2) == 0; % bottom 
eqn3 = subs(tau_xy, y, h/2) == 0; % bottom
eqn4 = subs(sigma_y, y, -h/2) == -p0*x/(L*t); % top
eqn5 = subs(tau_xy, y, -h/2) == 0; % top
eqn6 = int(subs(tau_xy, x, 0)*t, y, -h/2, h/2) == 0; % no force at free end

% solve the system of equations
sol = solve([eqn1, eqn2, eqn3, eqn4, eqn5, eqn6], [c1, c2, c3, c4, c5, c6]);

% print stresses
sigma_x
sigma_y
tau_xy

 
