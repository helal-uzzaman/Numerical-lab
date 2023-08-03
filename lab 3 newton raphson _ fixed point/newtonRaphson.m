function [root, iteration] =  newtonRaphson(func, initial_guess)

if nargin ==0
    syms x;
    func = x^3-2*x-5;
    initial_guess = 4;
end
syms x;
a = initial_guess;                   % any value
errordiff = 0.001;
% converge check
diffx = diff(func) 
secondDiffx = diff(diffx)
fxd = (subs(func, x, a) * subs(secondDiffx, x, a)/ (subs(diffx, x, a)^2) )

if abs(fxd) < 1
    disp(func);
    disp('Calculating root for given function using newton raphson method');
    % main loop
    for i = 1: 100
        fx = eval(subs(func,x,a))
        fdiffx = eval(subs(diff(func),x,a));
        a =a- fx/fdiffx;
        roots(i) = a;
        fprintf(".");
        if i> 1
            d= roots(i) - roots(i-1);
            if abs(d) < errordiff
                break;
            end
        end
    end

    % output decoration
    iter = [1: length(roots)];
    iterNo = iter';
    root = roots';
    table(iterNo, root)
    root = a;
    iteration = length(roots);
    disp("Answer checking: putting the root in the original function:")
    disp(eval(subs(func,x,root)))
    disp("==========================================================")
else
    disp('will not converge try different initial guess!');
end
end