clear
lower = -1000; % lower bracket
upper = 1000; % upper bracket


% test cases uncomment to test that specific equation-----------
in = 'x^3 - 2*x - 5';
%in = 'x^4-8*x^3-35*x^2+450*x-1001';
%in = '-.6*x^2 + 2.4*x + 5.5';
%in = '4*x^3 - 6*x^2 + 7*x - 2.3';
%in = '-13 - 20*x + 19*x^2 -3*x^3'

% convertion of string to function
ainput = strcat('@(x)', in); %adding @(x) before the input string
func = str2func(ainput);

%finding interval at which root exists---------------------------
disp('Trying to find interval(s)...');
rootnumber = 0;
for i = -1000: 1000     % i is not used as index as it may be negative or zero
    if func(lower)*func(lower + 1) <0
        rootnumber = rootnumber + 1;
        intervals_a(rootnumber) = lower;
    end
    lower = lower + 1;
end
% for i = lower: upper     % i is not used as index as it may be negative or zero
%     fb(iter) = func(lower + iter -1); % as iter initially 1 subtract 1 to compensate it
%     if iter > 2
%         if fb(iter)*fb(iter-1)<0
%             intervallower = lower + iter -2;
%             intervals_a(rootnumber) = intervallower;
%             rootnumber = rootnumber +  1;
%         end
%     end
%     iter = iter +1;
% end

disp('Total Number of real root(s):')
disp(rootnumber-1);

%Applying bisection method to find roots------------------------

for i = 1: length(intervals_a)
    x = ['for interval ------->  ', num2str(i)];
    disp(x);
    disp([intervals_a(i), intervals_a(i) + 1]);
    bisectiond(in, intervals_a(i), intervals_a(i) + 1)
end
