function myHist(imgpath)
    img = imread(imgpath);
    for c = 1:3
        color_ch = img(:,:,1);
        hist_data = createArray(256);
        [h, w] = size(color_ch);
        
        for i = 1:h 
            for j = 1:w 
                val = color_ch(i, j, :);
                hist_data(val + 1) = hist_data(val + 1) + 1;
            end
        end
        bar(hist_data, 50, 'white');
    end
end


