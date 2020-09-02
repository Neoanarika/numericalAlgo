function f = erfrec(x, N)
    T = x;
    f = x;
    for n = 1:N
        g = -(2*n+3)/((2*n+1)*(x^2));
        T = (2/sqrt(pi))*g*T;
        f = f+T;
    end
end