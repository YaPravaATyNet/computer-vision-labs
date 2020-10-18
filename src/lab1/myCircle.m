function img = myCircle(img, x, y, r, color)
    s = size(img);
    for i=x - r - 1:x + r + 1
        for j=y - r - 1:y + r + 1
            if (abs(x - i)^2 + abs(y - j)^2 <= r^2)
                img(i, j) = color;
            end
        end
    end
end