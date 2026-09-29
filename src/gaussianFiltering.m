function out = gaussianFiltering(img, sigma)
    arguments
        img
        sigma {mustBePositive}
    end

    [row, col, num_ch] = size(img);
    out = zeros(size(img));
    img = double(img);

    kernel_sz = 2 * ceil(2*sigma) + 1;
    gaussian_kernel = zeros(kernel_sz, kernel_sz);

    c = 2 * sigma^2;
    kernel_sum = 0;
    center = (kernel_sz+1)/2;
    for i=1 : kernel_sz
        for j=1 : kernel_sz
            x = i - center;
            y = j - center;
            gaussian_kernel(i, j) = (exp(-(x^2+y^2)/c));
            kernel_sum = kernel_sum + gaussian_kernel(i, j);
        end
    end

    gaussian_kernel = gaussian_kernel/kernel_sum;
    
    radius = center-1;
    for k=1 : ch
        padded = mirrorPad(img(i, j, :), r);
        for i=1 : row
            for j=1 : col
                pixels_sum = dot(padded(i:i+2*r, j:j+2*r), gaussian_kernel);
                out(i, j, k) = pixels_sum;
            end
        end
    end

    out = uint8(out);
end