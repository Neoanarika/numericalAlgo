function sol = inverseLeastSquare(x, theta, b, n)
    if size(b,1) == 1 && size(b,2) > 1
       b = transpose(b);
    end 
    if size(theta,1) == 1 && size(theta,2) > 1
       theta = transpose(theta);
    end 
    v = vandermode(x, n);
    sol = solve(transpose(v)*v*theta - transpose(v)*b==0);
end 

function v = vandermode(X, n)
    assert(length(X) == length(unique(X)), 'There are non-distinct elements in the vector')
    if size(X,1) == 1 && size(X,2) > 1
        X = transpose(X);
    end 
    s = size(X,1);
    v = sym(zeros(s,n));
    for i = 1:n+1
        v(:,i) = X.^(i-1);
    end
end

