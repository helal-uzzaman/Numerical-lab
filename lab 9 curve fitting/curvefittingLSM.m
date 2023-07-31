% Curve Fitting 
% used least square method method.
% Date: 23 Jun 2023

% Example 
% x = [0 1 2];
% y = [1 6 17];
% m = 2;
x = input('Enter x values: ');
y = input('Enter y values: ');
m = input('Enter the degree of the polynomial: ');

m = m+1;
A = zeros(m)
B = zeros(m, 1)


for row = 1: m 
    for col = 1: m
        A(row, col) = sum(x.^(row+col-2)) 
    end
    B(row) = sum(y.*x.^(row-1))
end
A;
B;
result = A \ B
equation = flip(result);
 

%plot

plot(x, y, '*');
hold on;
xx = linspace(x(1), x(end), 100);
yy = polyval(equation, xx)
plot(xx, yy, 'MarkerSize', 8)
xlabel('x');
ylabel('y');
title('least square method');












