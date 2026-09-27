function out = unsharpMasking(img, n)
    arguments
        img
        n {mustBePositive, mustBeInteger}
    end

    lowpass = avgFiltering(img, n);

    img = double(img);
    lowpass = double(lowpass);
    highpass = img - lowpass;
    out = img + highpass;

    out = clip(out, 0, 255);
    out = uint8(out);

end