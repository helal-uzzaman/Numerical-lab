% Ordinary Differential Equation Solving
% Modified Euler's method for ODE
% Author: Helal Uzzaman Hasib
% Date: 22 Jul 2023
% ======================================================

clc;
clear;
%Input taking
f = input('Enter the right side of the equation: ');
x0 = input('Initial value of independent variable: ');
y0 = input('Initial value of dependent variable: ');
fx = input('calculate at');
h = input('Step size: ');

%Example 
% f = @(x, y) -y   
% f = @(x,y) x^2+y;
% x0 = 0; y0 = 1;
% h = .05;                    % step size
% fx = .1;                   % calculate at

n = fx/h;
y = zeros(1,n+1);
x = zeros(1,n+1);
x(1) = x0;
y(1) = y0;
% Modified Euler's method loop
for i = 1: n
    j = i+1;
    x(j) = x(i) + h;
    y(j) = y(i) + h*f(x(i),y(i));
    y(j) = y(i) + h/2*(f(x(i),y(i)) + f(x(j),y(j)));  
end
x = x';
y = y';
t = table(x,y);
disp(t);


fprintf('result %d \n',y(end));

