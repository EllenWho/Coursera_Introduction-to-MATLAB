function [summa, index] = max_sum(v, n)
if n > length(v) 
    summa = 0;
    index = -1;
else
   w = zeros(1,length(v) - n+1);
   for ii = 1 : length(v) - n+1
       m = ii:n-1+ii;
       w(ii) = sum(v(m));
   end
   [summa, index] = max(w);
end