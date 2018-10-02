n = 600851475143;
k = 10000;
pr =  primes(k);
for i = pr
    if mod(n,i)==0
        disp(i)
    end
end