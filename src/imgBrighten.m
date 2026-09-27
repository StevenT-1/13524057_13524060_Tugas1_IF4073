function out = imgBrighten(img, b, a)
    arguments
        img
        b
        a = 1
    end
    out = a * img + b;
end