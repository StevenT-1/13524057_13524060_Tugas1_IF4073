function out = highBoostFiltering(img, highpass, a)

    original = im2double(img);
    highpass = im2double(highpass);

    out = (a - 1) * original - highpass;

    out = clip(out, 0, 1);
    out = im2uint8(out);
end