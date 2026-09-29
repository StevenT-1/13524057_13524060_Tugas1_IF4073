function out = gammaCorrection(img, c, gamma)
    arguments
        img
        c {mustBePositive}
        gamma {mustBePositive}
    end
    a = im2double(img);
    out = c * a.^(1/gamma);
    out = im2uint8(out);
end