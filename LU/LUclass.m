classdef LUclass < handle
   properties
      A
      b
   end
   methods
       function b = inverse(obj, A, b)
            obj.A = obj.LU(A);
            obj.b = obj.forwardsub(obj.A, b);
            b = obj.backwardsub(obj.A, obj.b);
       end
       function A = LU(~, A)
            for i = 1:size(A,1)-1
                for j = i+1:1:size(A,1)
                    A(j, i) = A(j, i)/A(i,i);
                    for k = i+1:size(A,2)
                        A(j, k) = A(j, k) - A(j, i)*A(i,k);
                    end 
                end
            end
       end
       function b = forwardsub(~, A, b)
            for i = 1:size(A, 1)
                for j = 1:i-1
                    b(i) = b(i)-A(i,j)*b(j);
                end
                b(i) = b(i);
            end
       end
       function b = backwardsub(~, A, b)
            for i = size(A, 1):-1:1
                for j = size(A, 2):-1:i+1
                    fprintf('%d %d\n', i, j)
                    b(i) = b(i)-A(i,j)*b(j);
                end
                fprintf('%d %d\n', i, i)
                b(i) = b(i)/A(i,i);
            end
        end
   end
end