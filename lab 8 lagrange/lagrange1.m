% Interpolation problem can be solved using this program
% used Lagrange's Interpolation method.
% Author: Helal Uzzaman Hasib
% Date: 19 Jun 2023
% ======================================================

clc
clear
x = [2 3 5];
x = [1 3 5 7];
y = [5 7 8];
y = [24 120 336 720];
x = [0 10 40 60 90];
y = sin(x*pi/180);
p = 30;
% Input
disp('Lagrange interpolation Method')
x = input('Enter x values: '); % Input x values
y = input('Enter y values: '); % Input y values
p = input('Where to approximate: '); % Input point to approximate

% Convert input to column vectors
x = x';
y = y';

% Display input table
table(x, y)

n = length(x);
L = zeros(n, n);

% Lagrange Interpolation Method
for i = 1:n
    v = 1;
    for j = 1:n
        if i ~= j
            v = conv(v, poly(x(j))) / (x(i) - x(j));
        end
    end
    L(i, :) = v * y(i) % Calculate Lagrange basis polynomials
end

% Compute the interpolated polynomial equation
equation = sum(L);

% Evaluate the interpolated polynomial at the given point
result = polyval(equation, p);

fprintf('Approximation value for %d is %d\n', p, result);

% Plotting the data and interpolated curve
plot(x, y, 'o', 'MarkerSize', 8); % Plot the given data points
hold on;

% Generate points for plotting the interpolated curve
xx = min(x):0.1:max(x);
yy = polyval(equation, xx);

plot(xx, yy, 'LineWidth', 1.5); % Plot the interpolated curve
plot(p, result, 'r*', 'MarkerSize', 10); % Plot the point of approximation

xlabel('x');
ylabel('y');
title('Interpolated Curve');
legend('Data Points', 'Interpolated Curve', 'Approximation Point');
hold off;
