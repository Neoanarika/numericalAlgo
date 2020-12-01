function table = DividedDifferencesTable(x, fx)
    s = size(x, 2);
    table = sym(zeros(s,s));
    
    for k = 1:s
        table(k, 1) = fx(k);
    end
    
    for j = 1:s-1
        for k = s:-1:j+1
            table(k, j+1) = (table(k, j)-table(k-1, j))/(x(k)-x(k-j));
            %fprintf("%d %d %d %d %d \n",j, k ,table(k, j) , table(k-1, j), table(k, j)-table(k-1, j));
        end
    end
end