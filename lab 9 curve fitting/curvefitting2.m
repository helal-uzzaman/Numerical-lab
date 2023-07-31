% Curve Fitting 
% used least square method method.

% Example
% x = [0 1 2];
% y = [1 6 17];
% m =1
x = input('Enter x values:\n ');
y = input('Enter y values:\n ');
m = input('Enter the degree of the polynomial: \n ');

m = m+1;
A = zeros(m);
B = zeros(m, 1);

for i = 1:m %row
    for j= 1: m %column
        A(i,j) = sum(x.^(i+j-2));
    end
    B(i) = sum(y.*x.^(i-1));
end
A ; 
B;
CM = A\B;
CM = flip(CM);

%plot
xx = linspace(x(1), x(length(x)), 100);
yy = polyval(CM, xx);
plot(x,y, 'o')
hold on;
plot(xx, yy, 'LineWidth', 2)
legend('Data Points', 'Line of best fit');
xlabel('x'); ylabel('y');
title('Linear Curve Fitting (Lease Square Method)')
hold off;


