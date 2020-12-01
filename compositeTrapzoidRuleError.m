function error = compositeTrapzoidRuleError(f, a, b, n)
    sols = solve(diff(f, 3) == 0);
    df = diff(f, 2);
    maxi = vpa(max(abs(subs(df,a)), abs(subs(df, b))));
    disp(subs(df,b));
    for i = sols
        if vpa(i) >= a
            if vpa(i) <=b
                if abs(subs(df, i)) > maxi
                    maxi = subs(df, i);
                end 
            end
        end 
    end
    h = (b-a)/n;
    error = ((b-a)/12)*h^2*maxi;
end