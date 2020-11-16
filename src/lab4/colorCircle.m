function img = colorCircle(img, x, y, r, color)
    s = size(img);
    startX = max(1, x - r - 1);
    startY = max(1, y - r - 1);
    [h, w] = size(img);
    finishX = min(h, x + r + 1);
    finishY = min(w, y + r + 1);
    for i=startX:finishX
        for j=startY:finishY
            if (abs(x - i)^2 + abs(y - j)^2 <= r^2)
                for k=1:3
                    img(i, j, k) = color(k);
                end
            end
        end
    end
end