function b = forwardsub(A, b)
    for i = 1:size(A, 1)
        for j = 1:i-1
            b(i) = b(i)-A(i,j)*b(j);
        end
        b(i) = b(i)/A(i,i);
    end
end