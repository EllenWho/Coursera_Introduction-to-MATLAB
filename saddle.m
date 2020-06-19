function indices = saddle(M)
[m, n] = size(M);
temp = zeros(m*n, 2);
for r = 1:m
    for c = 1:n
        if M(r,c) >= max(M(r,:)) && M(r,c) <= min(M(:,c))
            temp((r-1)*n+c, :) = [r, c];
        else
            temp((r-1)*n+c, :) = [0,0];
        end
    end
end
if all(temp == 0)
    indices = [];
else
    if all(temp ~= 0)
        indices = temp;
    else
        v = nonzeros(temp');
        row = length(v)/2;
        if row == 1
            indices = reshape(v,row,2);
        else
            indices = reshape(v,row,2)';
        end
    end
end
        

