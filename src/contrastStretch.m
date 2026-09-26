function out = contrastStretch(img)
    [row, col, ~] = size(img);
    out = zeros(row, col, 3);

    r_min, g_min, b_min = 255;
    r_max, g_max, b_max = 0;
    for i=1 : row
        for j=1 : col
            for k=1 : 3
                if (k == 1)
                    r_min = min(r_min, img(i, j, k));
                    r_max = max(r_max, img(i, j, k));
                elseif (k ==2)
                    g_min = min(g_min, img(i, j, k));
                    g_max = max(g_min, img(i, j, k));
                else
                    b_min = min(b_min, img(i, j, k));
                    b_max = max(b_max, img(i, j, k));
                end
            end
        end
    end

    for i=1 : row
        for j=1 : col
            for k=1 : 3
                if (k == 1)
                    out(i, j, k) = 255 * ( (img(i, j, k) - r_min)/(r_max-r_min) )
                elseif (k == 2)
                    out(i, j, k) = 255 * ( (img(i, j, k) - g_min)/(g_max-g_min) )
                else
                    out(i, j, k) = 255 * ( (img(i, j, k) - b_min)/(b_max-b_min) )
                end
            end
        end
    end

end