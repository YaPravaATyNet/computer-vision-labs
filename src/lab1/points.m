function points(filt)
    res = zeros(256, 256);
    for i = 0:12
        for j = 0:12
            image = myCircle(zeros(256, 256), i + 122, j + 122, 1, 127);
            ganglionic = filter2(filt, image);
            v = ganglionic(128, 128) * 10 + 128;
            res = myCircle(res, i * 16 + 32, j * 16 + 32, 3, v);
        end
    end
    figure
    imshow(res, [0, 256]);
end
