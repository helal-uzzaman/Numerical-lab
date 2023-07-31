clc;
clear;

% Input taking

fun = @(x) 1/(1+x)
a = 0; b = 1;
n = 4;
iter= 3;

% fun = @(x) x.^2; % The function to integrate
% a = 0; % Lower limit
% b = 1; % Upper limit
% n = 4; % Initial number of trapeziums

% Initialize the Romberg table
R = zeros(n, n);

% Calculate the first column of the table using the Trapezoidal rule
h = (b - a) ./ (2.^(0:n-1));
R(1, 1) = (h(1) / 2) * (fun(a) + fun(b));
for i = 2:n
    h(i) = h(i-1) / 2;
    x = a + h(i):h(i):b - h(i);
    R(i, 1) = (1/2) * R(i-1, 1) + h(i) * sum(fun(x));
end

% Calculate the remaining columns of the table using Richardson extrapolation
for j = 2:n
    for i = j:n
        R(i, j) = R(i, j-1) + (R(i, j-1) - R(i-1, j-1)) / (4^(j-1) - 1);
    end
end


% The final result is in the last row and last column of the table
result = R(n, n);

fprintf('Integrating from %d to %d of the function: x^2\n', a, b);
fprintf('Result: %.4f\n', result);
