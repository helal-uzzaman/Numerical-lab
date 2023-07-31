x = [1; 3; 5; 7]
y = [ 24; 120; 336; 720]
c = 2


n = length(y);
Dtable = zeros(n);
Dtable(:, 1) = y;      % all row and first column

for col = 2: n
    for row = col: n
        Dtable(row, col) = Dtable(row , col-1) -Dtable(row-1, col-1);
    end
end
Dtable
h = abs(x(2)-x(1));
f = (c-x(1))/h

dels = diag(Dtable)

for i = 2: n
    mul = f
    for j = 1:i-2
        mul = mul*(f-j);
    end
    mul = mul / factorial(i-1);
    dels(i) = mul* dels(i);
end

ans = sum(dels)


