% Curve Fitting 
% used least square method method.
% Author: Helal Uzzaman Hasib
% Date: 20 Jun 2023
% ======================================================

disp('Curve fitting nth order polynomial least square method')
clc
clear
%Example 
x = [0 1 2];
y = [1 6 17];
m =2
% x = input('Enter x values:\n ');
% y = input('Enter y values:\n ');
% n = input('Enter the degree of the polynomial: \n ');

% Initialization of matrix
m = m+1;
A = zeros(m,m)
B = zeros(m,1)

% required matrix calculation
for i= 1:m
   for j = 1:m
       A(i,j)= sum(x.^(i+j-2));
   end
    
   B(i) =sum(x.^(i-1).*y);
end
A
B
% finding the required coefficients 
result = A\B;
nn = length(x);
equation = flip(result)

%plotting
xx = linspace(x(1), x(nn), 100);
yy = polyval(equation, xx);
plot(x,y, 'o')
hold on;
plot(xx, yy, 'LineWidth', 2)
legend('Data Points', 'Line of best fit');
xlabel('x'); ylabel('y');
title('Linear Curve Fitting (Lease Square Method)')
hold off;

