% Ordinary Differential Equation Solving
% Runge-Kutta method for ODE
% Author: Helal Uzzaman Hasib
% Date: 26 Jul 2023
% ======================================================

clc;
clear;

% Input taking
f = input('Enter the right side of the function: '); 
x0 = input('Initial value of independent variable: '); 
y0 = input('Initial value of dependent variable: '); 
fx = input('Calculate at: '); 
h = input('Step size: '); % Input the step size for numerical integration
m = input('Enter (1) for 2nd order and (2) for 4th order: '); 
%Example 
% f = @(x, y) y - x;
% x0 = 0; y0 = 2;
% h = .1; % step size
% fx = .2; % calculate at
% m = 2; % method 2 for 4th order

n = int32((fx - x0) / h); % Calculate the number of steps based on the difference between fx and x0
y = zeros(1, n + 1); % Initialize array to store y values at each step
x = zeros(1, n + 1); % Initialize array to store x values at each step
x(1) = x0; % Set initial value of x
y(1) = y0; % Set initial value of y

if m == 1
    % RUNGE KUTTA ORDER 2
    for i = 1:n
        x(i + 1) = x(i) + h;
        k1 = h * f(x(i), y(i));
        k2 = h * f(x(i) + h, y(i) + k1);
        y(i + 1) = y(i) + 0.5 * (k1 + k2);
    end
    disp('RUNGE KUTTA ORDER 2 USED');
else
    % RUNGE KUTTA ORDER 4
    for i = 1:n
        x(i + 1) = x(i) + h;
        k1 = h * f(x(i), y(i));
        k2 = h * f(x(i) + 0.5 * h, y(i) + 0.5 * k1);
        k3 = h * f(x(i) + 0.5 * h, y(i) + 0.5 * k2);
        k4 = h * f(x(i) + h, y(i) + k3);
        
        y(i+1)=y(i)+(1/6)*(k1+2*k2+2*k3+k4);
    end
    disp('RUNGE KUTTA ORDER 4 USED');
end

x = x'; % Convert x array to a column vector
y = y'; % Convert y array to a column vector
t = table(x, y); % Create a table to store x and y values
disp(t); % Display the table

fprintf('result %d \n', y(end)); % Display the final result
