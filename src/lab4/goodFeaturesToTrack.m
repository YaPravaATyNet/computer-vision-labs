function r = goodFeaturesToTrack (i)
  pkg load image;
  mask = [-1 0 1; -1 0 1; -1 0 1]; 
  ix = conv2(i, mask, 'same');   
  iy = conv2(i, mask', 'same');g = fspecial('gaussian', 7, 1);
  ix2 = conv2(ix.^2, g, 'same');  
  iy2 = conv2(iy.^2, g, 'same');
  ixiy = conv2(ix.*iy, g,'same');
  detA = ix2.*iy2 - ixiy.*ixiy;
  traceA = ix2 + iy2; 
  r = detA - 0.06*traceA.^2; 
  temp(:,:,1) = temp(:,:,2) = traceA;
  discriminant = sqrt(traceA.^2 .+ 4.*detA);
  temp(:,:,1) = 0.5 .* (temp(:,:,1) + discriminant);
  temp(:,:,2) = 0.5 .* (temp(:,:,2) - discriminant);
  minmask = (temp(:,:,1) < temp(:,:,2));
  eigenvalues(:,:,1) = minmask.*temp(:,:,1) .+ ~minmask.*temp(:,:,2);
  eigenvalues(:,:,2) = ~minmask.*temp(:,:,1) .+ minmask.*temp(:,:,2);
  r = eigenvalues(:,:,1) .- 0.05.*eigenvalues(:,:,2); 
  r = detA ./ traceA;
  maxima = ordfilt2(r, 25, ones(5));
  mask = (r == maxima) & (r > threshold);
  maxima = mask.*r;
  minr = min(min(r));
  maxr = max(max(r));
  r = (r - minr) / (maxr - minr);
endfunction
