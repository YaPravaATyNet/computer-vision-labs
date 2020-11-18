pkg load image
img = rgb2gray(imread('images/example9_1.png'));
img_edge = edge(img , 'canny', [0, 0.15], 0.5); % , [0 0.1], 1
[H, Theta, rho] = hough(img_edge);
figure
imshow(img_edge)
figure
imshow(imadjust(mat2gray(H)), [], 'YData', rho, 'XData', Theta , 'InitialMagnification','fit');
xlabel ('\rho'), ylabel ('\Theta')
axis on
axis normal
hold on
peaks = houghpeaks (H, 100, 'threshold', ceil(0.42 * max(H(:))));  %0.45
x = Theta(peaks(:,2));
y = rho(peaks(:,1));
plot(x, y, 's', 'color', 'red');
lines = houghlines(img_edge, Theta, rho, peaks, 'FillGap', 2, 'MinLength', 15);  % 10 10
figure
imshow(img)
hold on
for k = 1:length(lines)
  xy = [lines(k).point1; lines(k).point2];
  plot(xy(:,1), xy(:,2), 'LineWidth', 1, 'Color', 'green');
end

[centers, radii] = imfindcircles(img, [20, 70], 'Sensitivity', 0.9);
if length(radii) > 1
  centersStrong = centers(1:length(radii),:);
  radiiStrong = radii(1:length(radii));
  viscircles(centersStrong, radiiStrong,'EdgeColor', 'b');
end