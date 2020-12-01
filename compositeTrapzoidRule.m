function v = compositeTrapzoidRule(f, a, b, n)
    assert(a<b, 'a> b');
    assert(n>0, 'n> 0');
    s = a;
    v= 0;
    for i=1:n
        e = s+(b-a)/n;
        v = v+((e-s)/2)*(subs(f, s) + subs(f, e));
        s = e;
    end
end 