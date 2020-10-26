function A = TriDiagLUFrac(A)
    for i = 1:size(A, 1)-1
        A(i+1, i) = A(i+1, i)/A(i,i);
        A(i+1, i+1) = A(i+1, i+1) - A(i+1, i)*A(i, i+1);
    end
end