% This function is not a faithful partition, but removes non-uniques and symmetries
function c = PartitionMany(stones,k)
% convert stones into a count
c0 = SetsToCounts({stones});
c0 = CullSets(c0);
stones = find(c0)+1;

m = max(stones)-1;
c = [];%zeros(length(stones),max(stones)-1);
for i = 1:length(stones)
    c1 = PartitionFunction(stones(i),k);
    c1 = [c1 zeros(size(c1,1),m-size(c1,2))];
    c2 = c0 + c1;
    c2(:,stones(i)-1) = c2(:,stones(i)-1)-1;
    c = [c; c2];
end

cold = [];
while 1-isequal(cold,c)
    cold = c;
    c = CullSets(c);
    c = CullPairs(c);
    c = CullTriplets(c,0);
end