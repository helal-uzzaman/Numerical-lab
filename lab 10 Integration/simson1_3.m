clc;
clear;
%Input taking
disp('using simson 1/3 ');
fun = input('Enter the function: ');
a = input('Enter lower limit: ');
b = input('Enter upper limit: ');
n = input('Enter number of trapeziums: ');

%Example 
fun = @(x) 1/(1+x)
a = 0; b = 1;
n = 2;
%step size
h = abs(b-a)/n;
sum = 0;
sim1 = 1/3;

% oddsum 
for i= 1:2: n-1
    i
    sum = sum + 4*fun(a+i*h);
    sum
end
% evensum
for i= 2:2: n-2
    i
    sum = sum + 2*fun(a+i*h);
end

Integ =h*sim1*(sum + fun(a)+fun(b));
disp(fun);
fprintf('Integrating from %d to %d of the function. Result: ', a, b);
disp(Integ);



