% Defination of saddle point:
% equal or greater than any element in its row
% equal or smaller than any elemnet in its column
% indices has wo columns: col1(row index) col2(column index)
function indices = saddle(M)
[m, n] = size(M);
% Preallocate indices
temp = zeros(m*n, 2);
for r = 1:m
    for c = 1:n
        if M(r,c) >= max(M(r,:)) && M(r,c) <= min(M(:,c))  %check every elemnt in this matrix to see if they met the requirement
            temp((r-1)*n+c, :) = [r, c];
        else
            temp((r-1)*n+c, :) = [0,0];
        end
    end
end
%remove zeros from the temp, then reshape the matrix
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
        

