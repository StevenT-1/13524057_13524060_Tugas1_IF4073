function out = highBoostFiltering(img, lowpass, a)

    original = im2double(img);
    lowpass = double(lowpass);

    mask = a * original - lowpass;

    out = uint8(clip(out, 0, 255));
end