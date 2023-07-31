y = [ 24; 120; 336; 720]


n = length(y);
Dtable = zeros(n);
Dtable(:, 1) = y;      % all row and first column

for col = 2: n
    for row = col: n
        Dtable(row, col) = Dtable(row , col-1) -Dtable(row-1, col-1);
    end
end
Dtable
