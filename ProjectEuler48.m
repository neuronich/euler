a_sum = 0;
for i = 1:1000
    a = 1;
    for j = 1:i
        a = mod(a*i,10^10);
    end
    a_sum = mod(a_sum+a,10^10);
end

a_sum