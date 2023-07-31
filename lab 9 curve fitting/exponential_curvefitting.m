% Curve Fitting
% Used least square method.
% Author: Helal Uzzaman Hasib
% Date: 20 Jun 2023
% ======================================================

% Display information about the curve fitting method

clc
clear
disp('Curve fitting using the least square method');
% Example data points, Uncomment to run
x = [25 100 200 300 400];
y = [4500 2000 1500 1200 1100];
m = 2;

% % User input for data points and polynomial degree
% x = input('Enter x values: ');
% y = input('Enter y values: ');
% m = input('Enter the degree of the polynomial: ');

% Making a Table
x = x';
y = y';
disp('Given Data Points:');
disp(table(x,y));

% Initialization of matrices
m = m + 1;
A = zeros(m, m); % Matrix A
B = zeros(m, 1); % Matrix B

% Matrix calculation
for i = 1:m
    for j = 1:m
        % Calculate the elements of matrix A
        A(i, j) = sum(x.^(i + j - 2));
    end
    
    % Calculate the elements of matrix B
    B(i) = sum(x.^(i - 1) .* y);
end

% Find the required coefficients
result = A \ B;
ans = result'
nn = length(x);
equation = flip(result); % Reverse the order of coefficients

% Plotting
xx = linspace(x(1), x(nn), 100);
yy = polyval(equation, xx); % Evaluate the polynomial equation
yy = 3586*exp(-.00342*xx);
plot(x, y, 'r*', 'MarkerSize', 7) % Plot data points
hold on;
plot(xx, yy, 'LineWidth', 1.6) % Plot line of best fit
legend('Data Points', 'Line of Best Fit');
xlabel('x');
ylabel('y');
title('Linear Curve Fitting (Least Square Method)')
hold off;
