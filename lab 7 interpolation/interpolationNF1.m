clc 
clear
x = [1 3 5 7];
x = [1, 3, 5, 7, 9]
y = [24 120 336 720];
y = [4, 8, 10, 8, 4]
p = 6;
% x = input('Enter x values as matrix');
% y = input('Enter y values as matrix');
% p = input('Enter the value where to calculate');
x= x';
y = y';
table(x,y)
n = length(x);
% initiating difference table 
ytable = zeros(n,n);
ytable(:,1) = y;           % taking the first column

% difference table 
for col= 2: n
    for row = col: n
        ytable(row, col) = ytable(row, col-1)-ytable(row-1, col-1);
    end
end
ytable

% forward difference 
x0 = x(1);
h = abs(x(2) - x0); %same
frac = (p-x0)/h;
dels = diag(ytable);
% forward difference 

% main calculation
for i = 2: n
    mul = frac;
    for j = 0:i-2
        if j > 0
            % forward difference 
            mul = mul*(frac-j);
            % forward difference 
        end
    end
    mul = mul/factorial(i-1);
    dels(i) = dels(i)*mul;
end
result = sum(dels)
disp(result)



