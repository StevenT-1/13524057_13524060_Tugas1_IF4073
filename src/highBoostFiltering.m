function out = highBoostFiltering(img, sigma, a)
    arguments
        img
        sigma
        a=2
    end

    lowpass = gaussianFiltering(img, sigma);
    original = double(img);
    lowpass = double(lowpass);

    mask = original - lowpass;
    out = (a - 1)*original + mask;

    out = uint8(clip(out, 0, 255));
end