function v = compositeSimpsonRule(f, a, b, n)
    assert(a<b, 'a> b');
    assert(n>0, 'n> 0');
    s = a;
    for i=1:n
        e = s+(b-a)/n;
        v = ((e-s)/6)*(subs(f, s) + 4*subs(f, (s+e)/2) + subs(f, e));
        s = e;
    end
end 