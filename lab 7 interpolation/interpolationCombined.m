% Interpolation problem can be solved using this program
% used Newton's Forward and Backward Interpolation method.
% Helal Uzzaman Hasib
% 30 May 2023
clc
clear

% test example
x = [1 3 5 7];
% x = [0 20 40 60 80];
y = [24 120 336 720];
% y = sin(x*pi/180);
p = 2.5;
% x = input('Enter x values as matrix ');
% y = input('Enter y values as matrix ');
% p = input('Enter the value where to calculate ');
x= x';
y = y';
disp(table(x,y));
n = length(x);
% initiating difference table
Dtable = zeros(n,n);
Dtable(:,1) = y;           % taking the first column

% creating difference table
for col= 2: n
    for row = col: n
        Dtable(row, col) = Dtable(row, col-1)-Dtable(row-1, col-1);
    end
end
disp('Difference Table:');
disp(Dtable);
x0 = x(1); xn = x(n);
h = abs(x(2) - x0);
% choosing forward or backward
if abs(p-x0)<= abs(p-xn)
    disp('Newton forward interpolation is used')
    frac = (p-x0)/h
    dels = diag(Dtable);       %forward difference
    % main calculation
    for i = 2: n
        mul = frac;
        for j = 1:i-2
            % forward
            mul = mul*(frac-j);
        end
        mul = mul/factorial(i-1);
        dels(i) = dels(i)*mul;
    end
else
    disp('Newton backward interpolation is used')
    frac=(p-xn)/h;
    dels=Dtable(n, :);      %backward difference
    % main calculation
    for i = 2: n
        mul = frac;
        for j = 1:i-2
            %backward
            mul = mul*(frac+j);
        end
        mul = mul/factorial(i-1);
        dels(i) = dels(i)*mul;
    end
end
dels
result = sum(dels);
fprintf('Calculated approximation for x=%d is y=%d\n',p,result);

% Plotting the interpolated curve
figure;
plot(x, y, 'o', 'MarkerSize', 8, 'LineWidth', 1.5);  % Original data points
hold on;
plot(p, result, 'r*', 'MarkerSize', 10, 'LineWidth', 1.5);  % Interpolated point
xlabel('x');
ylabel('y');
title('Interpolated Curve');
legend('Data Points', 'Interpolated Point');
grid on;
hold off;


