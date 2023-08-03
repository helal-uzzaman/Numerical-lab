clc;
clear;

x = [2 3 5]
y = [5 7 8]
c = 4

n = length (x);
L = zeros(n);

for i= 1: n
    l = 1;
    for j = 1: n
        if i~=j
            l = conv(l, poly(x(j))) /( x(i)-x(j))
        end
    end
    L(i, :) = l*y(i) 
    
end
equation = sum(L)

result = polyval(equation, c)