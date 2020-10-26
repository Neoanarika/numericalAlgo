% In order to update matlab classes by reference we need to specify the
% class as a handle class. 
classdef dividedDifferencesOnline < handle
   properties
      x
      b
   end
   methods
      function dividedDifference(obj, x, f)
        s = size(x, 2);
        obj.x = x;
        obj.b = 1:s;
        
        for k = 1:s
            obj.b(k) = f(obj.x(k));
        end
        for j = 1:s
            for k = s:j
                obj.b(k) = (obj.b(k)-obj.b(k-1))/(obj.x(k)-obj.x(k-1));
            end
        end
      end
      function newPoint(obj, x, f)
         obj.x = [x obj.x];
         obj.b = [f(x) obj.b];
         for k = 2:size(obj.x, 2)
            obj.b(k) = (obj.b(k)-obj.b(k-1))/(obj.x(k)-obj.x(k-1));
         end
      end
   end
end