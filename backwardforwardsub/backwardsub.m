function b = backwardsub(A, b)
    for i = size(A, 1):-1:1
        for j = size(A, 2):-1:i+1
            b(i) = b(i)-A(i,j)*b(j);
        end
        fprintf("%d %d\n", b(i), A(i,i));
        b(i) = b(i)/A(i,i);
    end
end