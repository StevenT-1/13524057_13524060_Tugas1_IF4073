function out = avgFiltering(img, n)
    arguments
        img
        n {mustBePositive, mustBeInteger}
    end

    if mod(n, 2) == 0
        error("Kernel size must be odd.");
    end

    [~, ~, num_ch] = size(img);
    out = zeros(size(img));
    img = im2double(img);

    r = (n-1)/2;
    for c=1 : num_ch 
        padded = replicatePad(img(:, :, c), r);
    
        [new_row, new_col] = size(padded);
    
        for i=1+r : new_row-r
            for j=1+r : new_col-r
                window = padded(i-r:i+r, j-r:j+r);    
                new_pixel = sum(window, "all")/n^2;
                out(i-r, j-r, c) = new_pixel;
            end
        end
    end               

    out = clip(out, 0, 1);   
    out = im2uint8(out);
end

