function hist_data = myHist(img)
    [h, w, num_channels] = size(img);
    hist_data = zeros(256, num_channels);
    for c = 1:num_channels
        for i = 1:h 
            for j = 1:w 
                val = img(i, j, c);
                hist_data(val + 1, c) = hist_data(val + 1, c) + 1;
            end
        end
    end
end


