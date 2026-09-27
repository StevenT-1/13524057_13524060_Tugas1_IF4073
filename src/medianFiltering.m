function out = medianFiltering(img, n)
    arguments
        img
        n {mustBePositive, mustBeInteger}
    end

    if (n == 1)
        out = img;
        return;
    end

    [row, col, ~] = size(img);
    out = zeros(row, col, 3, like=img);

    r = (n-1)/2;
    padded_red = mirrorPad(img(:, :, 1), r);
    padded_green = mirrorPad(img(:, :, 2), r);
    padded_blue = mirrorPad(img(:, :, 3), r);

    [new_row, new_col] = size(padded_red);

    for i=1+r : new_row-r
        for j=1+r : new_col-r
            window_red = padded_red(i-r:i+r, j-r:j+r);
            window_green = padded_green(i-r:i+r, j-r:j+r);
            window_blue = padded_blue(i-r:i+r, j-r:j+r);

            new_pixel_red = median(window_red, "all");
            new_pixel_green = median(window_green, "all");
            new_pixel_blue = median(window_blue, "all");

            out(i-r, j-r, :) = [new_pixel_red, new_pixel_green, new_pixel_blue];
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
