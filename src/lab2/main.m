image1 = rgb2gray(imread("images/pic1.png"));
image2 = rgb2gray(imread("images/pic2.png"));
%image2 = image1;
figure;
imshow(image1);
figure;
imshow(image2);
[i1_height, i1_width] = size(image1);
[i2_height, i2_width] = size(image2);
dftX = min(i1_width, i2_width); 
dftY = min(i1_height, i2_height);
image_f1 = fft2(image1, dftY, dftX);
image_f2 = fft2(image2, dftY, dftX);
image_f1 = getPhase(image_f1);
image_f2 = getPhase(image_f2);
dst = image_f1 .* conj(image_f2);
dst = ifft2(dst, dftY, dftX);
[height, width] = size(dst); 
shx = 0;
shy = 0;
min_v = 1e+12;
max_v = 0;
for i=1:height
    for j=1:width
        v = abs(dst(i, j));
        if v > max_v
            shx = j;
            shy = i;
            max_v = v;
        end
        if v < min_v
            min_v = v;
        end
    end
end
if shx > width / 2
    shx -= width;
end
if shy > height / 2
    shy -= height;
end
res = zeros(height, width);
for i=1:height
    for j=1:width
        v = abs(dst(i, j));
        v = (v - min_v) * 255 / (max_v - min_v);
        if v > 255
            v = 255;
        end
        res(i, j) = v;
    end
end
figure;
imshow(res, [0, 256]);
shx
shy
