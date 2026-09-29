function out = convolution(M, kernel)
    [k_row, k_col] = size(kernel);
    [row, col] = size(M);
    out = zeros(row, col);
    
    r = (k_row-1)/2;
    pad = mirrorPad(M, r);

    kernel_sum = sum(kernel, "all");
    if (kernel_sum == 0)
        kernel_sum = 1;
    end
    
    kernel_sum = double(kernel_sum);
    kernel = double(kernel);
    pad = double(pad);
    for i=1 : row
        for j=1 : col
            pixels_sum = 0.0;
            k_i = 1;
            for m=i : i+2*r
                k_j = 1;
                for n=j : j+2*r
                    pixels_sum = pixels_sum + kernel(k_i, k_j) * pad(m, n);
                    k_j = k_j + 1;
                end
                k_i = k_i + 1;
            end
            out(i, j) = double(pixels_sum)/kernel_sum;
        end
    end

    out = uint8(out);
end