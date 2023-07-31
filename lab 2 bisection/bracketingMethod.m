function bracketingMethod(equation, method, errordiff)
% Give the equation as x^3-2*x-5
% Select method: 1 for bisection method and 2 for false position method

if nargin == 0
    % test cases uncomment to test that specific equation-----------
    equation = 'x^3 - 2*x - 5';              % default equation
    %equation = 'x^4-8*x^3-35*x^2+450*x-1001';
    %equation = '-.6*x^2 + 2.4*x + 5.5';
    % equation = '4*x^3 - 6*x^2 + 7*x - 2.3';
    % equation = '-13 - 20*x + 19*x^2 -3*x^3'
    method = 1;       % default 1 for bisection method
    errordiff = 0.001;
elseif nargin == 1
    method =1;
    errordiff = 0.001;
elseif nargin ==2
    errordiff = 0.001;

end

% convertion of string to function
ainput = strcat('@(x)', equation); %adding @(x) before the input string
func = str2func(ainput);

lower = -1000; % lower bracket
upper = 1000; % upper bracket

%finding interval at which root exists---------------------------
disp('Trying to find interval(s)...');
rootnumber = 0;
for i = -1000: 1000     
    if func(lower)*func(lower + 1) <0
        rootnumber = rootnumber + 1;
        intervals_a(rootnumber) = lower;
    end
    lower = lower + 1;
end
disp('Total Number of real and single root(s):')
disp(rootnumber);

%Applying specific method to find roots------------------------
for i = 1: length(intervals_a)
    x = ['for interval: ', num2str(i)];
    disp(x);
    ia = intervals_a(i);
    ib = intervals_a(i) + 1;
    disp(['      a=', num2str(ia),'      b=', num2str(ib) ]);
    specificMethod(equation, ia, ib, method, errordiff);
end
end

function result = specificMethod(equation, a, b, method, errordiff)
%Give the equation as text like 'x^3-2*x-5'
%a is lower bracket & b is the upper bracket
maxiter = 1000;
funcStr = strcat('@(x)', equation); %adding @(x) before the input string
func = str2func(funcStr);

if func(a)* func(b)< 0
    %selection of method -----------------------------------
    if method ==1       %Select bisection method                 
        disp('Using bisection method to find root');
        % main loop ----------------------------------------
        for i = 1:maxiter
            f(i) = a;
            g(i) = b;
            x = (a+b)/2;          % using bisection method
            h(i) =x;
            fun(i) = func(x);
            if func(x)*func(a) < 0
                b = x;
            else
                a = x;
            end
            if i > 2
                diff = h(i)-h(i-1);
                if abs(diff) < errordiff
                    break
                end
            end
        end
    else                % Select false position method
        disp('Using false position method to find root');
        % main loop ----------------------------------------
        for i = 1:maxiter
            f(i) = a;
            g(i) = b;
            % Using false position method
            x = (a*func(b)-b*func(a))/(func(b)-func(a));    
            h(i) =x;
            fun(i) = func(x);
            if func(x)*func(a) < 0
                b = x;
            else
                a = x;
            end
            if i > 2
                diff = h(i)-h(i-1);
                if abs(diff) < errordiff
                    break
                end
            end
        end
    end

    % output decoration-----------------------------------
    index = (1: length(f));
    No = index';
    aa= f';
    bb = g';
    xo = h';
    for i = 1: length(fun)
        if fun(i) > 0
            fisign(i) = '+';
        else
            fisign(i) = '-';
        end
    end
    fxsign = fisign';
    table(No, aa,bb,xo,fxsign)        % print output table
    disp(['Final result', ' with errordiff: ', num2str(errordiff)]);
    disp(x)
    result = x;
else
    disp('No (single/real) root exists in the interval')
end
clear
end