% non-abundant sums. Two steps. 1. Classify all numbers into abundant vs not (brute force, most likely random)
%2. Go until the number 28123 and check the representations.
% Question. How do I get all divisors?

% New insight. FindDivisors can be much faster if we look at many numbers in a row.
% See solution of problem 21. Basically we go through every number and take multiplicative of it.

SetDefaultStyle
N = 30000; % Maximum size of the thing.
f = zeros(1,N);
ff = f;
for i = 1:N
    f(i) = ((sum(FindDivisors(i))-i)-i);
end
ff = sign(f);
% Beautiful visualization of abundance.
% figureFull
% hold all
% plot(1:N,-(1:N))
% plot(1:N,(1:N))
% plot(1:N,0*(1:N),'k')
% plot(f)
% plot(find(ff==0),f(ff==0),'.r','MarkerSize',30)

% figureFull
% imagesc(ff)

%STEP 2
abundant = find(ff>0);
canbesum = zeros(1,N);
for i = 1:length(abundant)
    for j = 1:length(abundant)
        m = sum(abundant([i,j]));
        if m > N
            break
        end
        canbesum(m) = 1;
    end
end

figure
imagesc(canbesum)
