function rings(filt)
    x=0:1:29;
    for i=0:29
        image = myCircle(zeros(256, 256), 128, 128, i, 1000);
        image = myCircle(image, 128, 128, max(i - 3, 0), 0);
        ganglionic = filter2(filt, image);
        v = ganglionic(128, 128);
        y1(i + 1) = v;
    end
    figure
    plot(x, y1);
end
