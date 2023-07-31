clear
clc
% System of linear equations can be solved using this program
% But can not handle singular matrix
% used Gauss elimination as method for solving 
% Helal Uzzaman Hasib
% 15 May 2023
disp("Gauss Elimination to solve system of linear equations");
disp("=====================================================");

a = input("Enter coefficient Matrix: ");
b = input("Enter constant Matrix: ");
%augmented matrix
Aug = [a b]
% storing size of a matrix
matrixSize = size(a,1);

% Making Upper triangular matrix 
for j=1: matrixSize
    for i=j+1: matrixSize
        % finding multiplier
        m = Aug(i,j)/Aug(j,j);
        % row operation
        Aug(i,:)=Aug(i,:)-m*Aug(j,:);
    end
end
UpperTriangularMatrix = Aug


% extracting the constant matrix part
b = Aug(:, size(Aug,2));
% extracting the coefficient matrix part
a = Aug( :, 1: matrixSize);
% creating a zero matrix for output result
x = zeros(1,size(a,1));

% solving the Upper triangular matrix using back substitution
for j=matrixSize(1,1):-1:1
    if (a(j,j)==0)
        disp('Matrix is singular!');
    end
    x(j)=b(j)/a(j,j);
    b(1:j-1)=b(1:j-1)-a(1:j-1,j)*x(j);
end
disp('Result')
x



