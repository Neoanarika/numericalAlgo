function A = upperhessenberg(A)
    for i = 1:size(A, 1)-1
        A(i+1, i) = A(i+1, i)/A(i,i);
        for j = i+1:size(A, 1)
            A(i+1, j) = A(i+1, j) - A(i+1, i)*A(i, j);
        end
    end
end