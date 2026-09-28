function out = powerTransform(img, c, gamma)
    arguments
        img
        c {mustBePositive}
        gamma {mustBePositive}
    end
    img = im2double(img);
    out = zeros(size(img));
    [row, col, ch] = size(img);
    for i=1 : row
        for j=1 : col
            for ch=1 : ch
                out(i, j, ch) = c * img(i, j, ch)^gamma;
            end 
        end
    end
    out = im2uint8(out);
end