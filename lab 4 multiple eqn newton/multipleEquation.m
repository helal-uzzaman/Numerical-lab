clear
clc
syms x y;
tol = 0.0001;
maxIter = 100;
numberOfEquations = 2;
disp("Enter system of equations")
%functionMatrix
f = input ('Enter equation 1:')
g = input ('Enter equation 2:')
% func
func = [f g];

var = [x; y];
% initial guess
x0 = input('Enter initial guess x0: ');
y0 = input('Enter initial guess y0: ');

fprintf('Using newton raphson method to solve.')
% initial value matrix
xMatrix = [x0 ; y0];
% variable matrix

% getting Jacobian matrix
JacobianMatrix = [ diff(func(1), x), diff(func(1), y); diff(func(2), x), diff(func (2), y)];

J = zeros (numberOfEquations);
for n = 1: maxIter
    % evaluating Jacobian matrix at x
    for i = 1: numberOfEquations
        for j = 1: numberOfEquations
            J(i,j) = eval (subs (JacobianMatrix(i,j),[x y] , xMatrix' ));
        end
    end
    % evaluating f(x) at x
    for i = 1: numberOfEquations
        F(i) = eval(subs (func(i), [x, y], xMatrix'));
    end
    % solving h using inverse matrix
    h = J\ -F';
    xMatrix = xMatrix + h;
    fprintf('.');
    % convergence checking
    if abs(max(h'))< tol
        break

    end
end
fprintf('\n')
fprintf('Number or iteration: %d', n);
fprintf('\n')
disp ('result' )
x = xMatrix(1)
y = xMatrix(2)

