% Integration
% Romberg's method for numerical integration.
% Author: Helal Uzzaman Hasib
% Date: 16 Jul 2023
% ======================================================

clc;  clear;
%Input taking
% fun = input('Enter the function: ');
% a = input('Enter lower limit: ');
% b = input('Enter upper limit: ');
% iter = input('Enter Number of Iteration: ');

% Example romberg integration for trapizoidal
fun = @(x) 1/(1+x)
a = 0; b = 1;
iter= 3;

h = abs(b-a);
Rom = zeros(iter);

for i = 1: iter
    % col
    h = h/2;        % calculating step size for this iteration 
    % using trapezoidal method
    n = abs(b-a)/h;
    sum = 0;
    for j = 1: n-1
        sum = sum + 2*fun(a + j*h);
    end
    Integ = h/2*(fun(a) + sum + fun(b));
    % storing the value at the first column of Romberg table
    Rom(i, 1) = Integ;
end
% calculation of rest column of the Romberg table. 
% Using 1/3*[4*I(h/2) - I(h)] formula
for col= 2: iter
    for row = col: iter
        Rom(row, col) = 1/3*(4*Rom(row, col-1) - Rom(row-1, col-1));
    end
end

Rom
Integ = Rom(end,end);
% Display the result
fprintf('Using Romberg Integration');
fprintf('Result: %.4f\n', Integ);






