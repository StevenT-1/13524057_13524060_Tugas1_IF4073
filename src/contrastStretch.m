function out = contrastStretch(img)
    [row, col, num_ch] = size(img);
    out = zeros(row, col, num_ch);

    hist_data = myHist(img);
    lower_percentile_index = uint32(0.01 * (row*col));
    upper_percentile_index = uint32(0.99 * (row*col));

    [intensityLevels, num_ch] = size(hist_data);
    r_pixel_idx = 0;
    g_pixel_idx = 0;
    b_pixel_idx = 0;
    for ch=1 : num_ch
        for i=1 : intensityLevels
            if (ch == 1)
                r_pixel_idx = r_pixel_idx + hist_data(i, ch);
                if (r_pixel_idx > lower_percentile_index) 
                    r_lower = i;
                    break;
                end
            elseif (ch == 2)
                g_pixel_idx = g_pixel_idx + hist_data(i, ch);
                if (g_pixel_idx > lower_percentile_index) 
                    g_lower = i;
                    break;
                end
            elseif (ch == 3)
                b_pixel_idx = b_pixel_idx + hist_data(i, ch);
                if (b_pixel_idx > lower_percentile_index) 
                    b_lower = i;
                    break;
                end
            end
        end
    end

    r_pixel_idx = row * col;
    g_pixel_idx = row * col;
    b_pixel_idx = row * col;
    for ch=1 : ch
        for i=intensityLevels:-1:1 
            if (ch == 1)
                r_pixel_idx = r_pixel_idx - hist_data(i, ch);
                if (r_pixel_idx < upper_percentile_index) 
                    r_upper = i;
                    break;
                end
            elseif (ch == 2)
                g_pixel_idx = g_pixel_idx - hist_data(i, ch);
                if (g_pixel_idx < upper_percentile_index) 
                    g_upper = i;
                    break;
                end
            elseif (ch == 3)
                b_pixel_idx = b_pixel_idx - hist_data(i, ch);
                if (b_pixel_idx < upper_percentile_index) 
                    b_upper = i;
                    break;
                end
            end
        end
    end

    for i=1 : row
        for j=1 : col
            for k=1 : num_ch
                if (k == 1)
                    out(i, j, k) = uint8(255 * ( double(img(i, j, k) - r_lower)/double(r_upper-r_lower) ));
                elseif (k == 2)
                    out(i, j, k) = uint8(255 * ( double(img(i, j, k) - g_lower)/double(g_upper-g_lower) ));
                else
                    out(i, j, k) = uint8(255 * ( double(img(i, j, k) - b_lower)/double(b_upper-b_lower) ));
                end
            end
        end
    end
    
    out = uint8(out);
end