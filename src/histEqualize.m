function new_img = histEqualize(img)
    hist_data = myHist(img);
    [h, w, num_channels] = size(img);
    L = size(hist_data, 1);
    num_pixels = h*w;
    new_hist_map = zeros(L, num_channels);
    for c = 1:num_channels
        acc = 0;
        for i = 1:L
            acc = acc + hist_data(i, c);
            acc_val = double(acc)/num_pixels;
            new_hist_map(i, c) = uint8(floor(acc_val*(L - 1)));
        end
    end
    new_img = img(:,:,:);
    for c = 1:num_channels
        for i = 1:h
            for j = 1:w
                new_img(i, j, c) = new_hist_map(img(i, j, c) + 1, c);
            end
        end
    end
end

