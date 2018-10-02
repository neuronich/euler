k = 0;
for i = 1:999 
    if mod(i,3) == 0 || mod(i,5)==0
        k = k +i;
    end
end
k
% Alternative solution through series
3*(1+333)/2*333+5*(1+199)/2*199-15*(1+66)/2*66