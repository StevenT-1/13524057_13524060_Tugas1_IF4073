function out = piecewiseLinearTransform(img, ya, yb)
    [row, col, num_ch] = size(img);
    out = zeros(row, col, num_ch);

    for ch=1 : num_ch
        out(:,:, ch) = stretchChannel(img(:,:, ch), ya, yb);
    end
    out = uint8(out);

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

    alpha = double(ya)/double(ch_min + 1);
    beta = double(yb-ya)/double(ch_max-ch_min);
    gamma = double(255-yb)/double(255-ch_max + 1);
    disp(beta);
    for i=1 : row
        for j=1 : col
            if (img_ch(i, j) < ch_min)
                outChannel(i, j) = uint8(alpha * img_ch(i, j));
            elseif(img_ch(i, j) < ch_max)
                outChannel(i, j) = uint8(beta * (img_ch(i, j) - ch_min) + ya);
            else
                outChannel(i, j) = uint8(gamma * (img_ch(i, j) - ch_max) + yb);
            end
        end
    end
end