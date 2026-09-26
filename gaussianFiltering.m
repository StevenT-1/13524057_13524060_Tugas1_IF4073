function out = gaussianFiltering(img, sigma)
    arguments
        img
        sigma {mustBePositive}
    end

    [row, col, ~] = size(img);
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
    for i=1 : row
        for j=1 : col
            for k=1 : 3
                pixels_sum = 0;
                for m=i-radius : i+radius
                    for n=j-radius : j+radius
                        x = m;
                        y = n;
                        if (m < 1)
                            x = 1 + (1-m);
                        end
                        if (n < 1)
                            y = 1 + (1-n);
                        end
                        if (m > row)
                            x = row + (row - m);
                        end
                        if (n > col)
                            y = col + (col - n);
                        end
                        pixels_sum = pixels_sum + img(x, y, k) * gaussian_kernel(m-i+radius+1, n-j+radius+1);
                    end
                end
                out(i, j, k) = pixels_sum;
            end
        end
    end

    out = uint8(out);
end