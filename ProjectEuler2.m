k1 = 1;
k2 = 1;
sumK = 0;
while k2<4*10^6
    sw = k2;
    k2 = k1+k2;
    k1 = sw;
    k2
    if mod(k2,2)==0
        sumK = sumK +k2;
    end
end

sumK