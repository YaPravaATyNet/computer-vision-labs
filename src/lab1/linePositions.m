function linePositions(varargin)
    filt = varargin{1};
    x_line = 1:1:510;
    for i=1:510
        if i<=255
            p1 = [1, 256 - i];
            p2 = [i + 1, 256];
        else
            p1 = [i - 255, 1];
            p2 = [256, 511 - i];
        end
        image = myLine(zeros(256, 256), p1, p2, 1000);
        ganglionic = filter2(filt, image);
        v = ganglionic(128, 128);
        y_line(i) = v;
        if (length(varargin) > 1)
            filt2 = varargin{2};
            simple = filter2(filt2, ganglionic);
            v = simple(128, 128);
            y_line(i) = v;
            if (length(varargin) > 2)
                v = max(simple(:));
                y_line(i) = v;
            end
        end
    end
    figure
    plot(x_line, y_line);
end
