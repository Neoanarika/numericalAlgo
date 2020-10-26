function bas_val = LagBasisChebshev(n , x)
   interp_node = ChebshevPoints(n);
   bas_val = ones(size(interp_node,2),1)';
   for i = 1:size(interp_node,2)
       for j=1:size(interp_node,2)
           if j ~= i
               bas_val(i) = bas_val(i)*((x-interp_node(j))/(interp_node(i)-interp_node(j)));
           end
       end 
   end
end

function points = ChebshevPoints(n)
   points = 0:n;
   for i = points
        points(i+1) = chebshev(i, n);
        fprintf('%d\n', points(i+1));
   end
end

function a = chebshev(k, n)
    a = cos(((k+(1/2))*pi)/(n+1));
end