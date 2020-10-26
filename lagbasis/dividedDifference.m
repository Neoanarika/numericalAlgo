function b = dividedDifference(x, f)
    s = size(x, 2);
    b = 1:s;
    for k = 1:s
       b(k) = f(x(k));
    end
    for j = 1:s
        for k = s:j
            b(k) = (b(k)-b(k-1))/(x(k)-x(k-1));
        end
    end
end