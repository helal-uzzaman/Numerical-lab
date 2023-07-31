clear; clc;% f = input('Enter the function: ');% errortol = input('Enter error tolerance: ');% Examplef = @(x) x^3 - 2*x - 5;l = 2;u = 3;errortol = 0.001;maxIter = 100;rootnumber = 0;% finding interval lower = -1000;for i = -1000: 1000         if f(lower)*f(lower + 1) <0        rootnumber = rootnumber + 1;        intervals_l(rootnumber) = lower;    end    lower = lower + 1;endfor for i=1: maxIter    r(i) = (l+u)/2;    if f(r(i))*f(l) < 0        u = r(i);    else        l = r(i);    end    if i > 1        diff = abs(r(i)- r(i-1));        if diff < errortol            break;        end    endendresult = r(end)% Plot the curve of the functionx = linspace(result - 10, result +10, 100);for i = 1: length(x)    y(i) = f(x(i));endplot(x, y,'b', 'linewidth', 2)hold on ;grid on; box on;plot(result, 0, 'r*', 'MarkerSize', 10);   % ploting the root hold off;