function p = topoly(x)
    s = max(size(x, 1), size(x, 2));
    p = dot(x, symsx(s));
end

function v = symsx(n)
    syms x;
    v = sym(zeros(n, 1));
    for i = 1:n
        v(i)= x.^(i-1);
    end
end 