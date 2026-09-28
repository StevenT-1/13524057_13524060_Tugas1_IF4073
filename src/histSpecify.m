function new_img = histSpecify(img, spec_img)
    hist_spec = myHist(spec_img);
    uniform_img = histEqualize(img);
    [h, w, num_channels] = size(img);
    L = size(hist_spec, 1);
    [spec_h, spec_w, ~] = size(spec_img)
    num_pixels_spec = spec_h*spec_w;
    new_hist_map = zeros(L, num_channels);
    for c = 1:num_channels
        acc = 0;
        for i = 1:L
            acc = acc + hist_spec(i, c);
            acc_val = double(acc)/num_pixels_spec;
            new_hist_map(i, c) = uint8(floor(acc_val*(L - 1)));
        end
    end
    new_img = uniform_img(:,:,:);
    for c = 1:num_channels
        for i = 1:h
            for j = 1:w
                pixel_val = uniform_img(i, j, c);
                min_val = abs(double(new_hist_map(1,c)) - double(pixel_val));
                disp(min_val);
                min_k = 1;
                for k = 2:L
                    c_val = abs(double(new_hist_map(k,c)) - double(pixel_val));
                    if c_val < min_val
                        min_val = c_val;
                        min_k = k;
                    end
                end
                
                new_img(i,j,c) = min_k - 1;
            end
        end
    end
end