function out = avgFiltering(img, sz)
    arguments
        img
        sz {mustBePositive, mustBeInteger}
    end

    [row, col, num_ch] = size(img);
    out = zeros(row, col, num_ch);
    img = double(img);

    radius = (sz-1)/2;
    for i=1 : row
        for j=1 : col
            for k=1 : num_ch
            pixels_sum = 0;
            for m=i-radius : i+radius
                for n=j-radius : j+radius
                    if (m < 1 && n < 1) 
                        pixels_sum = pixels_sum + img(1, 1, k);
                    elseif (m < 1 && n > col)
                        pixels_sum = pixels_sum + img(1, col, k);
                    elseif (m > row && n < 1)
                        pixels_sum = pixels_sum + img(row, 1, k);
                    elseif (m > row && n > col)
                        pixels_sum = pixels_sum + img(row, col, k);
                    elseif (m < 1)
                        pixels_sum = pixels_sum + img(1, n, k);
                    elseif (n < 1)
                        pixels_sum = pixels_sum + img(m, 1, k);
                    elseif (n > col)
                        pixels_sum = pixels_sum + img(m, col, k);
                    elseif (m > row)
                        pixels_sum = pixels_sum + img(row, n, k);
                    else
                        pixels_sum = pixels_sum + img(m, n, k);
                    end
                end
            end
            out(i, j, k) = pixels_sum/(sz^2);
            end
        end
    end                
             
    out = uint8(out);
end
