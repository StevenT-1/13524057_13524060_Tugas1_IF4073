function out = logTransform(img, c)
    img = im2double(img);
    out = zeros(size(img));
    [row, col, ch] = size(img);
    for i=1 : row
        for j=1 : col
            for ch=1 : ch
                out(i, j, ch) = c * log(img(i, j, ch) + 1);
            end 
        end
    end
    out = im2uint8(out);
end