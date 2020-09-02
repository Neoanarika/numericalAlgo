function f = roots(n, k, trunc)
    % calculuates the roots of x^n - x - k =0 
    % roots(2, 1, 10)
    %
    % Args:
    % n : nth root
    % k : constant 
    % trunc : number of levels the algorthm runs
    %
    % Example 
    %     
    % roots(2, 1, 10) is 1.618 the golden ratio. 
    
    if trunc == 0
        f = nthroot(k, n);
    else
        f = nthroot(k+roots(n, k, trunc-1), n);
    end
end