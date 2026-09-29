function out = unsharpMasking(img, highpass)
    arguments
        img
        n {mustBePositive, mustBeInteger}
    end

    img = im2double(img);
    highpass = im2double(highpass);
    out = img + highpass;

    out = clip(out, 0, 1);
    out = im2uint8(out);

end