function A = LUFrac(A)
    N = size(A, 1);
    
    for i = 1:N-1
        A(i+1, i) = A(i+1, i)/A(i,i);
        A(i+1, i+1) = A(i+1, i+1) - A(i+1, i)*A(i, i+1);
        if i<N-1
            A(i+1, N) = A(i+1, N) - A(i+1, i)*A(i, N);
            A(N, i) = A(N, i)/A(i,i);
            A(N, i+1) = A(N, i+1) -A(N, i)*A(i, i+1);
            A(N, N) = A(N, N) - A(N, i)*A(i, N);
        end 
    end
end