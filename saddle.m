function indices = saddle(M)
[m, n] = size(M);
indices = zeros(m*n, 2); %Preallocate the indices(assuming all the numbers are the same in the matrix)
%Finding the maximum in the row (might return more than one indexs)
for ii = 1:m
    maxn_r = max(M(ii,:)); %maxinum of the row
    maxi_r = find(M(ii,:) == maxn_r); %indices of the maximum
    l = length(maxi_r); %number of maximum in the maxi_r
    for jj = 1:l
        minn_c = min(M(:,maxi_r(jj)));
        mini_c = find(M(:,maxi_r(jj)) == minn_c);
        if isequal(maxn_r, minn_c)
            indices(ii, maxi_r(jj)) = [mini_c, maxi_r];%part of the indices
        else
            indices(ii, maxi_r(jj)) = [0, 0];
        end
    end
end
        

