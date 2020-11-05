image1 = rgb2gray(imread("left_sss.PNG"));
image2 = rgb2gray(imread("right_sss.PNG"));
dMin = 10;
dMax = 50;
D = dMax - dMin  % +1
[h1, w1] = size(image1);
[h2, w2] = size(image2);
h = min(h1, h2)
w = min(w1, w2)
cor_matrix = zeros(h, w, D);
for i=1:h
  for j=1:w
    for d=1:D
      x = j;
      y = i;
      dx = -(d + dMin);
      w_size = 7;
      mean1 = 0;
      mean2 = 0;
      covxy = 0;
      std1 = 0;
      std2 = 0;
      s = (w_size - 1) / 2;
      n = 0;
      for j1=-s:s
        for i1=-s:s
          tx = x + i1;
          tdx = tx + dx;
          ty = y + j1;
          if (tx < 1 || tx > w || tdx < 1 || tdx > w || ty < 1 || ty > h)
            continue;
          end
          mean1 = mean1 + double(image1(ty, tx));
          mean2 = mean2 + double(image2(ty, tdx));
          n = n + 1;
        end
      end
      if n < w_size * w_size / 2
        cor_matrix(i, j, d) = -1;
        continue;
      end
      mean1 = mean1 / n;
      mean2 = mean2 / n;
      for j1=-s:s
        for i1=-s:s
          tx = x + i1;
          tdx = tx + dx;
          ty = y + j1;
          if (tx < 1 || tx > w || tdx < 1 || tdx > w || ty < 1 || ty > h)
            continue;
          end
          ela = double(image1(ty, tx));
          elb = double(image2(ty, tdx));
          sq1 = ela - mean1;
          sq2 = elb - mean2;
          covxy = covxy + sq1 * sq2;
          std1 = std1 + sq1 * sq1;
          std2 = std2 + sq2 * sq2;
        end
      end
      res = covxy / (sqrt(std1 * std2));
      cor_matrix(i, j, d) = res;
    end
  end
  counter = counter + 1
end
dispimgL = zeros(h, w);
scale = 255 / D;
for i=1:h
  for j=1:w
    ind_m = 0;
    m = -1000;
    for d=1:D
      if cor_matrix(i, j, d) > m
        ind_m = d;
        m = cor_matrix(i, j, d);
      end
    end
    dispimgL(i, j) = uint8(ind_m * scale);
  end
end
figure;
imshow(dispimgL, [0, 255]);
