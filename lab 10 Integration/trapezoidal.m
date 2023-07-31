% Integration
% Trapezoidal method and Simpson's 1/3 Rule for numerical integration.
% Author: Helal Uzzaman Hasib
% Date: 15 Jul 2023
% ======================================================

clc;
clear;
%Input taking
fun = input('Enter the function: ');
a = input('Enter lower limit: ');
b = input('Enter upper limit: ');
n = input('Enter number of trapeziums: ');
m = input('Enter which method "1" for trapezoidal "2" for Simpson''s 1/3: ');

%Example
% fun = @(x) 1/(1+x)
% a = 0; b = 1;
% n = 4;
% m = 2;

%step size
h = abs(b-a)/n;
sum = 0;
if m == 1
    fprintf('Using Trapezoidal method. \n');
    mul = 1/2;
    for i = 1: n-1
        sum = sum + 2*fun(a + i*h);
    end
else
    fprintf("Using Simpson's 1/3 method. \n");
    mul = 1/3;
    % oddsum
    for i = 1:2: n-1
        sum = sum + 4*fun(a + i*h);
    end
    % evensum
    for i = 2:2: n-2
        sum = sum + 2*fun(a + i*h);
    end
end

% Calculate the final result
Integ = h * mul * (fun(a) + sum + fun(b));

% Display the result
fprintf('Result: %.4f\n', Integ);
