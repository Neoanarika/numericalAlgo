function p = homer(coeff, x)
    n = size(coeff, 2);
    p = coeff(n)*x;
    for i = n-1:1
        p = coeff(i) + x*p;
    end
end 