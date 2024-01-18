% First set of values
syms x1 x2 c;
x = [x1; x2];
m1 = [-1.6; 2.5];
S1 = [0.8, 0.1; 0.25, 2.5];

% Calculate the inverse of S1
S_inv1 = inv(S1);

% Expand the equation for the first set
eqn1 = expand((x - m1).' * S_inv1 * (x - m1));

% Second set of values
m2 = -1/3 * [6.5; 1];
S2 = 1/3 * [2.75, 1.9; 1.9, 5];

% Calculate the inverse of S2
S_inv2 = inv(S2);

% Expand the equation for the second set
eqn2 = expand((x - m2).' * S_inv2 * (x - m2));
x1_range = linspace(-10, 10, 400);
c_values = 1:10;
figure;
hold on;
for c_val = c_values
    % Solve the equation for x2
    x2_sol1 = solve(eqn1 == c_val, x2);

    % Evaluate and plot x2 for each x1
    x2_range1 = double(subs(x2_sol1, x1, x1_range));
    plot(x1_range, x2_range1);
end

% Plot for each value of c for the second set of equations
for c_val = c_values
    % Solve the equation for x2
    x2_sol2 = solve(eqn2 == c_val, x2);

    % Evaluate and plot x2 for each x1
    x2_range2 = double(subs(x2_sol2, x1, x1_range));
    plot(x1_range, x2_range2, '--');  % Dashed line for differentiation
end

xlabel('x1');
ylabel('x2');
title('Curve for Different Values of c for Both Sets');
legend(arrayfun(@(c) strcat('c = ', num2str(c)), c_values, 'UniformOutput', false));
grid on;

hold off;
