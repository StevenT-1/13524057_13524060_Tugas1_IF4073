function out = avgFiltering(img, sz)
    arguments
        img
        sz {mustBePositive, mustBeInteger}
    end

    [row, col, num_ch] = size(img);
    out = zeros(row, col, num_ch);
    img = double(img);

    for c=1 : num_ch 
        padded = replicatePad(img(:, :, c), r);
    
        [new_row, new_col] = size(padded);
    
        for i=1+r : new_row-r
            for j=1+r : new_col-r
                window = padded(i-r:i+r, j-r:j+r);    
                new_pixel = sum(window, "all")/sz^2;
                out(i-r, j-r, c) = new_pixel;
            end
        end
    end               
             
    out = uint8(out);
end
