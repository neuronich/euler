% Pythagorean triples
% a+b+c = 2*m*(m+n)
% don't forget multiplication by k

% Great solution! Even by standards of project euler, as many people were brute forcing it.
% This, however might remove the search for uniques.
% Clearly it shows my lack of knowledge of use of gcd ............if gcd(m, n) == 1 and (m - n) % 2:  # No Duplicates

% Really search for divisors individually ruins all the performance. Second problem is search of uniques with num2str.

% Duh! *slaps forehead*
% 
% I never realised that the Pythagorean triplet producing formulae: a=m2+n2, b=m2&#8722;n2, c=2mn, where m>n, do not produce every triplet. It produces every primitive case and SOME multiples of these cases. For example, it does produce the primitive (3,4,5), and its double (6,8,10), but it will never produce its triple (9,12,15); and 36 cm is, in fact, one of the cases we needed with only one solution.
% 
% My method was to only consider primitives: if m+n&#8801;1 mod 2 AND HCF(m,n)=1, it will be primitive (it is fairly easy to prove). Then for a given perimeter: p=a+b+c, use an array to store the number of solutions found for p and multiples of p. My computer completes this task in less than one second.

clean
k = 1.5*10^6;
tic
ddd = FindDivisorsMany(k);
toc
for i = 2:2:k
    i2 = i/2;
    d = ddd{i2};
    abcC = cell(0);
    
    for k = d
        dk = ddd{k};
        
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
sum(dd==1)