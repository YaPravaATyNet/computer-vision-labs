pkg load image;
%image1 = imread("images/dooru.jpg");
%image2 = imread("images/door.jpg");
image1 = rgb2gray(imread("images/car.png"));
image2 = rgb2gray(imread("images/10deg.png"));
imshow(image1);

max_count = 500;
[_, r1, c1] = shi_tomasi(image1, 3, 'N', max_count);
[_, r2, c2] = shi_tomasi(image2, 3, 'N', max_count);
%[_, r1, c1] = harris(image1, 3, 0.04, 'N', max_count);
%[_, r2, c2] = harris(image2, 3, 0.04, 'N', max_count);

rgb2 = cat(3, image2, image2, image2);
for i=1:max_count
  min_dist = 30 * 30;
  best_j = -1;
  for j=1:max_count
    dist = (r1(i) - r2(j)) * (r1(i) - r2(j)) + (c1(i) - c2(j)) * (c1(i) - c2(j));
    if dist < min_dist
        min_dist = dist;
        best_j = j;
    end
  end
  if best_j ~= -1
    rgb2 = colorCircle(rgb2, r2(best_j), c2(best_j), 3, [255, 0, 0]);
    rgb2 = colorLine(rgb2, [r1(i), c1(i)], [r2(best_j), c2(best_j)], [255, 255, 0]);
  end
end
figure
imshow(rgb2)


