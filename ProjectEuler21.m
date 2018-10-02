%%% https://mathschallenge.net/index.php?section=faq&ref=number/sum_of_divisors  VERY COOL TRICK!

% BRUTE force solution is the only comes to mind. Because multiplication and summation do not mix.
% Now proper way to do it is to have a sieve and make factors of all numbers together. But I will just do this.
clear all
% too slow
% a = 1;
% n = 10^4;
% for i = 2:n
%     a(i) = sum([1;unique(cumprod(perms(factor(i)),2))])-i;
% end
% for i = 1:n
%  if a(min(end,a(i))) == i
%      disp(i)
%      disp(a(i))
%  end
% end

n = 10^4;
a = cell(1,n);
b = zeros(1,n);
for i = 1:n/2+1
    for j = 2*i:i:n
         a{j} = [a{j} i];
    end
end

for i = 1:n
    b(i) = sum(a{i});
end

amicable = [];
for i = 1:n
 if b(max(1,min(end,b(i)))) == i
     if i~=b(i)
     amicable = [amicable,i,b(i)];
     end
 end
end
sum(unique(amicable))
 