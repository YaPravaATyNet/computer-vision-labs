function lines(varargin)
    filt = varargin{1};
    x_line = 0:1:180;
    for i=0:180
        x1 = 128 + 100 * cos(i / 57.2);
        y1 = 128 + 100 * sin(i / 57.2);
        x2 = 128 - 100 * cos(i / 57.2);
        y2 = 128 - 100 * sin(i / 57.2);
        p1 = [x1, y1];
        p2 = [x2, y2];
        image = myLine(zeros(256, 256), p1, p2, 1000);
        ganglionic = filter2(filt, image);
        v = ganglionic(128, 128);
        y_line(i + 1) = v;
        if (length(varargin) > 1)
            filt2 = varargin{2};
            v = 0;
            simple = filter2(filt2, ganglionic);
            v = simple(128, 128);
            y_line(i + 1) = v;
            if (length(varargin) > 2)
                v = max(simple(:));
                y_line(i + 1) = v;
            end
        end
    end
    figure
    plot(x_line, y_line);
    %axis([0, 200, -600, 600]);
end
