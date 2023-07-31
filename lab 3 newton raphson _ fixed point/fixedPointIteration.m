function [root, iteration] =  fixedPointIteration(func, initial_guess)

if nargin ==0
    syms x;
    % 2x-3 = cox(x)
    func = .5*(cos(x)+3);
    initial_guess = 4;
end
syms x;
a = initial_guess;                   % any value
errordiff = 0.001;
% converge check
fdiffx = eval(subs(diff(func),x,a))

if abs(fdiffx) < 1
    disp(func);
    disp('Calculating root for given function using fixed point iteration method');
    % main loop
    for i = 1: 100
        a = eval(subs(func,x,a));
        roots(i) = a;
        if i> 1
            d= roots(i) - roots(i-1);
            fprintf(".");
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
    disp("==========================================================")
else
    disp('will not converge try different initial guess!');
end
end