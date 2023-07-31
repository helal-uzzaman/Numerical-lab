% Ordinary Differential Equation Solving
% Euler's method for ODE
% Author: Helal Uzzaman Hasib
% Date: 22 Jul 2023
% ======================================================

clc;
clear;
% Input taking
f = input('Enter the function: ');
x0 = input('Initial value of independent variable: ');
y0 = input('Initial value of dependent variable: ');
fx = input('Calculate at: ');
h = input('Step size: ');

% Example 
% f = @(x, y) -y           
% x0 = 0; y0 = 1;
% h = .01;                    % step size
% fx = .04;                   % calculate at

n = fx / h;
y = zeros(1, n+1);
x = zeros(1, n+1);
x(1) = x0;
y(1) = y0;

% Euler's method loop
for i = 1:n
    x(i+1) = x(i) + h;
    y(i+1) = y(i) + h * f(x(i), y(i));
end

x = x';
y = y';
t = table(x, y);
disp(t);

fprintf('result %d \n', y(end));
