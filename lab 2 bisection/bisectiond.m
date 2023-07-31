
function result = bisectiond(equation, a, b, maxiter)
%Give the equation as text like 'x^3-2*x-5'
%a is lower bracket & b is the upper bracket
%Give max iteration number (maxiter) default 100

if nargin < 4
    maxiter = 100;
end

funcStr = strcat('@(x)', equation); %adding @(x) before the input string 
func = str2func(funcStr); 

errordiff = 0.0001;

if func(a)* func(b)< 0
    %disp('root exists in the interval')

    % deciding lower ( negative) and upper (positive)
    if func(a) < 0
            lower = a;
            upper = b;
        else 
            lower = b;
            upper = a;
    end
    
    % main loop --------------------------------------
    for i = 1:maxiter

        
        f(i) = lower;
        g(i) = upper;
        x = (lower + upper)/2;     %bisection
        %x = (lower*func(upper)-lower*func(upper))/(func(lower)-func(upper))
        h(i) =x;
        fun(i) = func(x);
        if fun(i) < 0
            lower = x;
        else
            upper = x;
        end
        if i > 2
            diff = fun(i) - fun(i-1);
            if abs(diff) < errordiff
                break
            end
        end
    end

    % output decoration--------------------------------
    fa= f';
    fb = g';
    xo = h';

    for i = 1: length(fun)
        if fun(i) > 0
            fisign(i) = '+';
        else
            fisign(i) = '-';
        end
    end
    fisign = fisign';

    table( fa,fb,xo,fisign)
    disp('Final result');
    disp(x)
    result = x;
    else
        disp('No (single/real) root exists in the interval')
    end
end