function error = compositeSimpsonRuleError(f, a, b, n)
    sols = solve(diff(f, 5) == 0);
    df = diff(f, 4);
    maxi = vpa(max(abs(subs(df,a)), abs(subs(df, b))));
    for i = sols
        if vpa(i) >= a
            if vpa(i) <=b
                if abs(subs(df, i)) > maxi
                    maxi = abs(subs(df, i));
                end 
            end
        end 
    end
    h = (b-a)/n;
    error = ((b-a)/180)*h^4*maxi;
end