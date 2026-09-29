function out = highBoostFiltering(img, lowpass, a)

    original = im2double(img);
    lowpass = double(lowpass);

    mask = original - lowpass;
    out = (a - 1) * original - mask;

    out = uint8(clip(out, 0, 255));
end