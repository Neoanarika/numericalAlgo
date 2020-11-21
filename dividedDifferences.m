% In order to update matlab classes by reference we need to specify the
% class as a handle class. 
classdef dividedDifferences< handle
   properties
      x
      b
   end
   methods
       function initalise(obj, x, b)
           obj.x = x;
           obj.b =b;
       end
       function computeDividedDifferences(obj, x, fx)
            s = size(x, 2);
            obj.x = x;
            obj.b = 1:s;

            for k = 1:s
                obj.b(k) = fx(k);
            end
            for j = 1:s
                for k = s:-1:j+1
                    obj.b(k) = (obj.b(k)-obj.b(k-1))/(obj.x(k)-obj.x(k-j));
                    %disp(obj.b(k));
                end
            end
       end
       function p = homer(obj, x)
        n = size(obj.b, 2);
        p = obj.b(n);
        for i = n-1:-1:1
            p = obj.b(i) + (x-obj.x(i))*p;
        end
       end 
       function newPoint(obj, x, fx)
         obj.x = [x obj.x];
         obj.b = [fx obj.b];
         for k = 2:size(obj.x, 2)
            %fprintf("%d %d \n", obj.x(k) , x)
            obj.b(k) = (obj.b(k)-obj.b(k-1))/(obj.x(k)-x);
         end
       end
       function testcurr(obj,x, fx)
           assert(size(x, 2) == size(fx, 2), "The input array has unequal sizes")
           for k = 1:size(fx, 2)
            assert(abs(obj.homer(x(k)) - fx(k))<1e-8, "The point x=%d has a different value p(x) = %d f(x) = %d \n", x(k), obj.homer(x(k)) , fx(k));
           end 
       end 
       function test(obj, x, fx)
           obj.computeDividedDifferences(x,fx);
           testcurr(obj,x, fx);
       end
       function testcases(obj)
           obj.test([-4 -3 -2 -1 0], [150 26 6 2 1]);
           obj.test([-4 -3 -2 -1], [0 1/120 0 -1/12]);
       end
    end
end