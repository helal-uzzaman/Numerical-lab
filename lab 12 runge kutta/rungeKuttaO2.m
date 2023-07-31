% Ordinary Differential Equation Solving
% Runge-Kutta method for ODE
% Author: Helal Uzzaman Hasib
% Date: 26 Jul 2023
% ======================================================

clc;
clear;
% RUNGE KUTTA ORDER 2
%Input taking
f = input('Enter the right side of the function: ');
x0 = input('Initial value of independent variable: ');
y0 = input('Initial value of dependent variable: ');
fx = input('Calculate at');
h = input('Step size: ');

%Example 
% f = @(x, y) y-x;          
% x0 = 0; y0 = 2;
% h = .1;                    % step size
% fx = .2;                   % calculate at

n = int32((fx-x0)/h);
y = zeros(1,n+1);
x = zeros(1,n+1);
x(1) = x0;
y(1) = y0;

        
for i = 1: n
    x(i+1) = x(i) + h;
    k1 = h*f(x(i), y(i));
    k2 = h*f(x(i)+h, y(i)+k1);
    y(i+1) = y(i) + .5*(k1 +k2);

end
x = x';
y = y';
t = table(x,y);
disp(t);

fprintf('result %d \n',y(end));

