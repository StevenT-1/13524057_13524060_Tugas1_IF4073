function out = piecewiseLinearTransform(img, a, b, ya, yb)
    [row, col, num_ch] = size(img);
    out = zeros(row, col, num_ch);

    for ch=1 : num_ch
        out(:,:, ch) = stretchChannel(img(:,:, ch), a, b, ya, yb);
    end
    out = uint8(out);

end

function outChannel = stretchChannel(img_ch, a, b, ya, yb)
    [row, col] = size(img_ch);
    outChannel = zeros(size(img_ch));

    alpha = 0;
    gamma = 0;
    if (a ~= 0)
        alpha = double(ya)/double(a);
    end
    beta = double(yb-ya)/double(b-a);
    if (b ~= 255)
        gamma = double(255-yb)/double(255-b);
    end

    for i=1 : row
        for j=1 : col
            if (img_ch(i, j) < a)
                outChannel(i, j) = uint8(alpha * img_ch(i, j));
            elseif(img_ch(i, j) < b)
                outChannel(i, j) = uint8(beta * (img_ch(i, j) - a) + ya);
            else
                outChannel(i, j) = uint8(gamma * (img_ch(i, j) - b) + yb);
            end
        end
    end
end