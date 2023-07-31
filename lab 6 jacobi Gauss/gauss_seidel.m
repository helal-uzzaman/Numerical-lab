% System of linear equations can be solved using this program
% used Gauss Seidel Method as method for solving 
% Helal Uzzaman Hasib
% 22 May 2023
clear
disp('Gauss-Seidel method to solve system of linear equations');
disp('=======================================================');
a = [ 10 -2 -1 -1; -2 10 -1 -1; -1 -1 10 -2; -1 -1 -2 10]
b= [3; 15; 27; -9]
x = [0; 0; 0; 0]; %initial assumtion
a = input('Enter coefficent Matrix: ');
b = input('Enter constant Matrix: ');
x = input('Enter initial like([2; 3; 4]) assumption:');
maxIter = 100;
tol = 0.001;

%creating equaitons
eqn = zeros(size(a,1), size(a,2) + 1);
for row= 1: size(a,1)
    for col = 1: size(a,2)
        if row == col
            if abs( a(row, col)) > 0
                mul = a(row,col);
                b(row)/mul;
                a(row,col) = 0;
                eqn(row,:) = [b(row)/mul  -a(row,:)/mul ];
            else
                disp('singular matrix need matrix manipulation')
                break;
            end
            
        end
    end
end
eqn
% varialble part
eqnV =eqn(:,[2:size(eqn,2)]);
% constant part
eqnC =eqn(:,1);

for i= 1: maxIter
    prex = x;
    for j =1 : length(x)
        x(j) = sum([eqnC(j,:) eqnV(j,:)*x], 2);
    end
    diff = abs(x - prex);
    x1(i,1) = x(1);
    x2(i,1) = x(2);
    x3(i,1) = x(3);
    x4(i,1) = x(4);
    max_diff(i,1) = max(diff);
    if max(diff) < tol
        break;
    end
end
IterNo= [1: i]';
iterationTable = table(IterNo, x1, x2, x3, x4, max_diff);
disp(iterationTable)
fprintf('total iteration needed: %d',i);
fprintf('\n');disp('Result'); disp(x');
