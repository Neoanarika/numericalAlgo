function A = LU(A)
    for i = 1:size(A,1)-1
        for j = i+1:1:size(A,1)
            A(j, i) = A(j, i)/A(i,i);
            for k = i+1:size(A,2)
                A(j, k) = A(j, k) - A(j, i)*A(i,k);
            end 
        end
    end
end