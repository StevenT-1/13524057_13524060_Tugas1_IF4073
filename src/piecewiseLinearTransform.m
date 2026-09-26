function out = piecewiseLinearTransform(img, ya, yb)
    [row, col, ~] = size(img);
    out = zeros(row, col, 3);

    for ch=1 : 3
        out(:,:, ch) = stretchChannel(img(:,:, ch), ya, yb);
    end

end

function outChannel = stretchChannel(img_ch, ya, yb)
    [row, col] = size(img_ch);
    outChannel = zeros(size(img_ch));

    ch_min = 255;
    ch_max = 0;

    for i=1 : row
        for j=1 : col
            ch_min = min(ch_min, img_ch(i, j));
            ch_max = max(ch_max, img_ch(i, j));
        end
    end

    alpha = ya/ch_min;
    beta = (yb-ya)/(ch_max-ch_min);
    gamma = (255-yb)/(255-ch_max);
    for i=1 : row
        for j=1 : col
            if (i < ch_min)
                outChannel(i, j) = alpha * img_ch(i, j);
            elseif(i > ch_max)
                outChannel(i, j) = beta * (img_ch(i, j) - ch_min) + ya
            else
                outChannel(i, j) = gamma * (255 - img_ch(i, j)) + yb;
            end
        end
    end
    
end