% Pythagorean triples
% a+b+c = 2*m*(m+n)
% don't forget multiplication by k

% Great solution! Even by standards of project euler, as many people were brute forcing it.
% This, however might remove the search for uniques.
% Clearly it shows my lack of knowledge of use of gcd ............if gcd(m, n) == 1 and (m - n) % 2:  # No Duplicates

% Really search for divisors individually ruins all the performance. Second problem is search of uniques with num2str.
clean
k = 10000;

for i = 2:2:k
    i2 = i/2;
    d = FindDivisors(i2);
    abcC = cell(0);
    
    for k = d
        dk = FindDivisors(k);
        
        m = dk(sqrt(k)>dk & dk>sqrt(k/2));
        if ~isempty(m)
            n = k./m-m;
            abc = sort([i2/k*2*m.*n; i2/k*(m.^2 +n.^2); i2/k*(m.^2-n.^2)])';
            for j = 1:size(abc,1)
            abcC = [abcC num2str(abc(j,:))];
            end
        end
        
    end
    dd(i) = length(unique(abcC));
end
[i,m] = max(dd)

figure
plot(dd,'.')
