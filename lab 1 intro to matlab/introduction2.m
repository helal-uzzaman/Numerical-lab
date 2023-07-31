x = 22;
x = 'hello, world';
disp(x)
a = 1:1:10;
b = linspace(1, 10, 10);

m = [ 2; 3; 4];
mm = [ 2 3 5; 3 4 7; 4 3 8]
m2 = [ 2 ; 4 ; 8 ]
m = [ 2; 3; 4];
m'
mm
mm'


z = zeros(3, 2)
o = ones(3)
e = eye(4)

%plot
pi
x = linspace(0, 2*pi, 100)
y = sin(x)

plot(x, y, 'r')
xlabel('time')
ylabel('Amplitude')
title('sine wave plotting')
hold on;
ycos = cos(x)
plot(x,ycos, 'b')
legend('sine', 'cos')
hold off;

%program flow control

x = 0
if x> 0
    disp('x is positive number')
elseif x< 0
    disp('x is negative number')
else
    disp('x is zero')
end



for i= -10: 10
    disp(i)
    x= i;
    if x> 0
        disp('x is positive number')
    elseif x< 0
        disp('x is negative number')
    else
        disp('x is zero')
    end
end








