function out = imgBrighten(img, b, a)
    arguments
        img
        b
        a = 1
    end
    img = double(img);
    out = a * img + b;
    out = uint8(out);
end