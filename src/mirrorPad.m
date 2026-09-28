function padded_matrix = mirrorPad(matrix, n)
    arguments
        matrix
        n {mustBePositive, mustBeInteger}
    end
    
    [row, col] = size(matrix);
    new_row = row + 2*n;
    new_col = col + 2*n;
    padded_matrix = zeros(new_row, new_col);
    
    for i=1 : new_row
        for j=1 : new_col
            x = i-n;
            y = j-n;
            if (x < 1)
                x = 1 + (1-x);
            end
            if (y < 1)
                y = 1 + (1-y);
            end
            if (x > row)
                x = row - (x-row);
            end
            if (y > col)
                y = col - (y-col);
            end
            padded_matrix(i, j) = matrix(x, y);
        end
    end

end