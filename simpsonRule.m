function v = simpsonRule(f, a, b)
    assert(a<b, 'a> b');
    v = ((b-a)/6)*(subs(f, a) + 4*subs(f, (a+b)/2) + subs(f, b));
end 