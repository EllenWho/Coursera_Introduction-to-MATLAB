function indices = saddle(M)
[m, n] = size(M);
temp = zeros(m*n, 2); %Preallocate the indices(assuming all the numbers are the same in the matrix)
%Finding the maximum in the row (might return more than one indexs)
for ii = 1:m
    maxn = max(M(ii,:)); %maxinum of the row
    maxi = find(M(ii,:) == maxn); %indices of the maximum
    l = length(maxi); %number of maximum in the maxi_r
    for jj = 1:l
        minn = min(M(:,maxi(jj)));
        mini = find(M(:,maxi(jj)) == minn);
        if isequal(maxn, minn)
            for c = 1:length(maxi)
                for r = 1:length(mini)
                    temp((ii-1)*m + maxi(c), :) = [mini(r), maxi(c)];%part of the indices
                end
            end
        end
    end
end
%delete the zeros in the matrix
if all(temp == 0)
    indices = [];
else
    v = nonzeros(temp');
    indices = reshape(v,2,2)';
end
        

