function coded = caesar(txt,shift)
while shift > 95
shift = shift - 95;
end
while shift < -95
shift = shift + 95;
end
coded_num = double(txt) + shift
for ii = 1:length(txt)
    if coded_num(ii) > 126
        coded_num(ii) = coded_num(ii) -127 + 32;
    elseif coded_num(ii) <= 32 && coded_num(ii) >= 0
        coded_num(ii)= 127 - 32 + coded_num(ii);
    elseif coded_num(ii) < 0
        coded_num(ii) = 127 - 32 - abs(coded_num(ii));
    end
end
coded = char(coded_num);
