% Well, we x^2 + ax+b -> prime from x =0 consecutively. Pretty iterateble. Only do b>0 and prime
clean
n = 2000;
b = primes(n);
len =0;
for i =1:length(b)
    b(i)
    for a = -b(i):n
        x = 1:b(i);
        for j = 1:length(x)
            c = [x(j)^2+a*x(j)+b(i)];
            theend = 0;
            if c<=0
                theend = 1;
            else
                if ~isprime(c)
                    theend = 1;
                end
            end
            if theend
                len(b(i),a+n) = x(j)-1;
                break
            end
        end
        len(b(i),a+n) = max(len(b(i),a+n),x(j)-1);
        
    end
end
figure
imagesc(log(1+len))

figure
imagesc(log(1+len(b,:)))
% daspect([ 1 1 1])

m = max(max(len));
[i,j] = ind2sub(size(len),find(len == m))

amax = j-n
bmax = i
