function bas_val = LagBasis(interp_node , x)
   bas_val = ones(size(interp_node,2),1)';
   for i = 1:size(interp_node,2)
       for j=1:size(interp_node,2)
           if j ~= i
               bas_val(i) = bas_val(i)*((x-interp_node(j))/(interp_node(i)-interp_node(j)));
           end
       end 
   end
end