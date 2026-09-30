function out = medianFiltering(img, n)
    arguments
        img
        n {mustBePositive, mustBeInteger}
    end

    if (n == 1)
        out = img;
        return;
    end

    if mod(n, 2) == 0
        error("Kernel size must be odd.");
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