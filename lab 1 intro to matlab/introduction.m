p = 23;
x = 'hello, world'
disp(x)
a = [ 2 3 4];
b = [ 2; 3; 4];

% array initial:increment:terminator.
x = 1: 2: 10
y = linspace(1, 10, 19)

% matrix multiplication both . 
x = [2 3 4 ; 34 3 3]
y = [2 3 4 ; 34 3 3]
m = x.*y
x
y = [ 2; 4; 4]
m = x*y


x = zeros(3, 2)
y = ones(3)
e = eye(3)

x = linspace(0, 2*pi,100)
y = sin(x)
plot(x,y, 'r')
xlabel('time')
ylabel('amplitude')
title('Sinusoidal curve')


x = 0;
if x > 0
    disp('x is positive Number')
elseif x< 0
    disp('x is negative number')
else
    disp('x is zero')
end

for i = -10: 10
    disp(i)
    x = i
    if x > 0
        disp('x is positive Number')
    elseif x< 0
        disp('x is negative number')
    else
        disp('x is zero')
    end
end

% table creating 
x = x'
y = y'
table(x, y)






