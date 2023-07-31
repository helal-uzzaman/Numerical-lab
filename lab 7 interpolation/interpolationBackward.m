clc 
clear
x = [1 3 5 7];
x = [15 20 25 30 35];
y = [24 120 336 720];
y = sin(x*pi/180);
p = 38;
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

% calculating difference table 
for col= 2: n
    for row = col: n
        ytable(row, col) = ytable(row, col-1)-ytable(row-1, col-1);
    end
end
ytable

xn=x(n);
h=abs(x(n-1)-xn);
frac=(p-xn)/h;
%backward difference table
dels=ytable(n, :);

% main calculation
for i = 2: n
    mul = frac;
    for j = 0:i-2
        if j > 0
            %backward difference
            mul = mul*(frac+j);
            %backward difference
        end
    end
    mul = mul/factorial(i-1);
    dels(i) = dels(i)*mul;
end
result = sum(dels)

plot(x, y)
