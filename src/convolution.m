function out = convolution(M, kernel)
    [k_row, k_col] = size(kernel);
    [row, col] = size(M);
    out = zeros(row, col);
    
    r = (k_row-1)/2;
    pad = mirrorPad(M, r);

    kernel_sum = double(sum(kernel, "all"));
    for i=1 : row
        for j=1 : col
            pixels_sum = 0.0;
            k_i = 1;
            k_j = 1;
            for m=i : i+2r
                for n=j : j+2r
                    pixels_sum = pixel_sum + kernel(k_i, k_j) * M(i, j);
                    k_j = k_j + 1;
                end
                k_i = k_i + 1;
            end
            out(i, j) = double(pixels_sum)/kernel_sum;
        end
    end

    out = uint8(out);
end