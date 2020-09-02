
function f = convfloat2dec(numStr)
    sign = (-1)^numStr(1);
    exponent= numStr(2:9);
    disp(numStr(10:end));
    fraction = str2double(append('1.',numStr(10:end)));
    exponent= subtract(exponent, 1111111);
    fraction = binaryConverter(fraction);
    f = sign*exponent*fraction;
end

function e = subtract(num1, num2)
    num1 = binaryConverter(num1);
    num2 = binaryConverter(num2);
    e = 10^(num1-num2);
end
