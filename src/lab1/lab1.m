pkg load image

ganglinic_filt_narrow = fspecial("gaussian", 7, 0.95) - fspecial("gaussian", 7, 1.25);
ganglionic_filt = fspecial("gaussian", 15, 1) - fspecial("gaussian", 15, 2.5);
%figure
%mesh(ganglionic_filt)

% ганглиозные клетки
points(ganglinic_filt_narrow)
circles(ganglionic_filt)
rings(ganglionic_filt)
lines(ganglionic_filt)

% простые клетки
filter_1 = eye(5, 5, "double") .* 5 .- 1
lines(ganglionic_filt, filter_1);
linePositions(ganglionic_filt, filter_1);

%сложные
lines(ganglionic_filt, filter_1, true);
linePositions(ganglionic_filt, filter_1, true);

