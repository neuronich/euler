format longE
[ 1./primes(1000)',primes(1000)']
%%
num = sym(primes(1000));
a = 1./num;
a(1:3) = [];
for i = 1%:length(a)
    while 1
        a(i)*(10^k-1)
    end
end

%% Idea about golden ratio
% Turns out, the golden ratio is about approximation, not length of cycle.
1./(1:10)
sqrt(5)/2+1/2

%% Analytical representation
% n*a *10^k/10^m = 10^k-1
% a = 0;
% for k = 1:17
%     f = FindDivisors(10^k-1,1000);
%     a = max(a,f(max(find(f<1000))));
% 
% end
% a

% The problem is reduced to what is the number n <1000 that is the divisor of 99999....999999 for the first time 
% with the biggest stretch of 9s
kmax = 0;
breaks = 0;
a = 7:2:1000;
a(mod(a,5)==0) = [];
b = a*0;
for i = 1:length(a)
    num = 9;
    k =1;
    while 1
        k = k +1;
        num = mod(10*(num+1)-1,a(i));
        if num == 0
            b(i) = k;
            
            breaks = breaks+1;
            break
        end
    end

end
figure
plot(a,b)
% b is the cycle length

a(b==max(b))
% Found it correctly!
% What is surprising to me, is that truly, when I divide by n I can end up with the cycle n digits long.
% I always thought the rational numbers be pretty short. THIS IS NEW.

%% Afterthought http://mathworld.wolfram.com/FullReptendPrime.html