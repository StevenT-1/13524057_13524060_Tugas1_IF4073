function out = imgBrighten(img, b, a)
    arguments
        img
        b
        a = 1
    end
    img = im2double(img);
    out = a * img + b;
    out = im2uint8(out);
end