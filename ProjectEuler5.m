
allFactors = zeros(20,20);
for i = 1:20
    factors = factor(i);
    a = tabulate(factors);
    allFactors(i,a(:,1)) = a(:,2);
end
prod([1:20].^max(allFactors))