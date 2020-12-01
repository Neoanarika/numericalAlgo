function points = ChebshevPoints(n)
   points = 0:n;
   for i = points
        points(i+1) = chebshev(i,10);
   end
end

function a = chebshev(k, n)
    a = cos(((k+(1/2))*pi)/(n+1));
end