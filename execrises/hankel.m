function a = hankel(c)
   w = (1:size(c, 2))' + (1:size(c, 2)) - 1;
   a = c(w);
end

function a = circulant(c)
   w = 6 + (1:size(c,2))' - (1:size(c,2));
   a = c(w);
end

function a = vandermonde(c,n)
   x = 1:c;
   % The key is to use elementwise multiplications to define the matrix
   a = x.^(0:n); 
end