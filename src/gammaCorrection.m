function out = gammaCorrection(img, c, gamma)
    arguments
        img
        c {mustBePositive}
        y {mustBePositive}
    end
    out = c * img.^(1/gamma);
end