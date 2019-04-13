% NEXT TIME AVOID STRINGS? 
% int rotate = (n / 10) + (n % 10) * 100000;


clean
n = 10^6;
a = primes(n);
c = [1,3,7,9]; % only these digits are allowed.

k = 0;
for i = a
    b = str2num(num2str(i)')';
    if prod(ismember(b,c))
        bad = 0;
        for j = 1:length(b)
            if ~isprime(str2num(char('0'+circshift(b,j))))
                bad = 1;
                break
            end
        end
        
        if bad==0
%             b
            k = k+1;
        end
    end
end

k