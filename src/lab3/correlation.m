function res = correlation1(img1)
  img1 = zeros(size(img1));
end


##function res = correlation1(img1, img2, x, y, dx, w_size)
##  img1(1, 1) = 0;
##  mean1 = 0;
##  mean2 = 0;
##  covxy = 0;
##  std1 = 0;
##  std2 = 0;
##  s = (w_size - 1) / 2;
##  [h, w] = size(img1);
##  n = 0;
##  for j=-s:s
##    for i=-s:s
##      tx = x + i;
##      tdx = tx + dx;
##      ty = y + j;
##      if (tx < 1 || tx > w || tdx < 1 || tdx > w || ty < 1 || ty > h)
##        continue;
##      endif
##      mean1 += img1(ty, tx);
##      mean2 += img2(ty, tdx);
##      n++;
##    endfor
##  endfor
##  if n < w_size * w_size / 2
##    res = -1;
##    return;
##  endif
##  mean1 /= n;
##  mean2 /= n;
##  for j=-s:s
##    for i=-s:s
##      tx = x + i;
##      tdx = tx + dx;
##      ty = y + j;
##      if (tx < 1 || tx > w || tdx < 1 || tdx > w || ty < 1 || ty > h)
##        continue;
##      endif
##      ela = img1(ty, tx);
##      elb = img2(ty, tdx);
##      sq1 = ela - mean1;
##      sq2 = elb - mean2;
##      covxy += sq1 * sq2;
##      std1 += sq1 * sq1;
##      std2 += sq2 * sq2;
##    endfor
##  endfor
##  res = covxy / (sqrt(std1 * std2));
##endfunction
