function out = medianFiltering(img, n)
    arguments
        img
        n {mustBePositive, mustBeInteger}
    end

    if (n == 1)
        out = img;
        return;
    end

    [row, col, num_ch] = size(img);
    out = zeros(row, col, num_ch, like=img);

    r = (n-1)/2;
    for c=1 : num_ch 
        padded = mirrorPad(img(:, :, c), r);
    
        [new_row, new_col] = size(padded);
    
        for i=1+r : new_row-r
            for j=1+r : new_col-r
                window = padded(i-r:i+r, j-r:j+r);    
                new_pixel = median(window, "all");
                out(i-r, j-r, c) = new_pixel;
            end
        end
    end
end

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
