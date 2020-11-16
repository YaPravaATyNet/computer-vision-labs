function img = colorLine(img, point1, point2, color)
x1=int16(point1(1)); x2=int16(point2(1)); y1=int16(point1(2)); y2=int16(point2(2));
% distances according to both axes
xn = double(x2-x1);
yn = double(y2-y1);

if (xn == 0) && (yn == 0)
    return
end

% interpolate against axis with greater distance between points;
% this guarantees statement in the under the first point!
if (abs(xn) > abs(yn))
    xc = x1 : sign(xn) : x2;
    if yn==0
        yc = y1+zeros(1, abs(xn)+1, 'int16');
    else
    yc = int16(double(y1):abs(yn/xn)*sign(yn):double(y2));
    end
else
    yc = y1 : sign(yn) : y2;
    if xn==0
        xc = x1+zeros(1, abs(yn)+1, 'int16');
    else
    xc = int16(double(x1):abs(xn/yn)*sign(xn):double(x2));
    end
end


% 2-D indexes of line are saved in (xc, yc), and
% 1-D indexes are calculated here:
%ind = sub2ind(size(img), xc, yc);

[_, cnt] = size(yc);
for i=1:cnt
    for j=1:3
        img(xc(i), yc(i), j) = color(j);
    end
end

% draw line on the image (change value of '255' to one that you need)
%img(ind) = color;
end
