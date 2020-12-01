function degreeOfAccuracy()
    max= 5;
    syms x a b;
    for k =[0 :max]
        f = x^k;
        exp = simplify(int(f, a, b) - rule(f, a, b));
        disp(exp)
        if exp ~= 0
            fprintf('Degree of Accruacy is %d\n', k-1)
            fprintf('Therefore f^(k)(zeta) is f^(%d)(zeta) i.e. k=%d \n', k, k)
            C = exp/((b-a)^(k+1)*diff(f, k));
            disp(C);
            break;
        end
    end 
end 

function r = rule(f, a, b)
    r = (b-a)*subs(f,(a+b)/2);
    %r = ((b-a)/2)*(subs(f,a) + subs(f, b));
    %r = ((b-a)/3)*(subs(f,a)+ subs(f,(a+b)/2) + subs(f, b));
    %r = ((b-a)/6)*(subs(f,a)+ 4*subs(f,(a+b)/2) + subs(f, b));
    %r = ((b-a)/8)*(subs(f,a) + 3*subs(f,(2*a+b)/3)+ 3*subs(f,(a+2*b)/3)+ subs(f, b));
end