function v= trapezoidalRule(f, a, b)
    assert(a<b, 'a> b');
    v = ((b-a)/2)*(f(a) + f(b));
end