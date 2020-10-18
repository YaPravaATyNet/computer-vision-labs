function circles(filt)
    x = 0:1:29;
    for i=0:29
        image = myCircle(zeros(256, 256), 128, 128, i, 1000);
        ganglionic = filter2(filt, image);
        v = ganglionic(128, 128);
        y(i + 1) = v;
    end
    figure
    plot(x, y);
end
