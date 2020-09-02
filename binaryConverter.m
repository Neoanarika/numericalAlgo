function f = binaryConverter(num)
%   binaryConverter  converts a binary number to a number in base 10

    max_precision=16;
    [x, y] = num2arrays(num, max_precision);
    sum1 = afterdeci(x);
    %fprintf('sum1 = %d\n', sum1);
    sum2 = beforedeci(y);
    %fprintf('sum2 = %d\n', sum2);
    f = sum1 + sum2;
end

function sum1 = afterdeci(x)
    sum1 = 0;
    for i = 1:length(x)
        sum1 = sum1 + str2double(x(i))*(2^(length(x)-i));
    end
end

function sum2 = beforedeci(x)
    sum2 = 0;
    for i = 1:length(x)
        %disp(str2double(x(i)));
        sum2 = sum2 + str2double(x(i))*(2^(-i));
    end
end

function [x, y] = num2arrays(num, max_precision)
    val = split(num2str(num, max_precision), '.');
    x = split(val(1), '');
    y = '0';
    if length(val) > 1
        y = split(val(2), '');
        y = y(2:end-1);
    end 
    x = x(2:end-1);
end