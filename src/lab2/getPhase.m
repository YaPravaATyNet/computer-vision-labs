function img_f = getPhase(img)
    [height, width] = size(img);
    img_f = zeros(height, width);
    for i=1:height
        for j=1:width
            a = abs(img(i, j));
            img_f(i, j) = img(i, j) / a;
        endfor
    endfor
end
