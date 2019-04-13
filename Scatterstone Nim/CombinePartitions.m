% I don't know why I have written this function. It takes two counts and creates all possible combinations of them.
% Which is not what happens because you only get to choose one pile that you decompile
function c = CombinePartitions(c1,c2)
s1      = size(c1);
s2      = size(c2);
maxN    = max(s1(2),s2(2));
c1    = [c1 zeros(s1(1),maxN-s1(2))];
c2    = [c2 zeros(s2(1),maxN-s2(2))];

c = [];
for i = 1:s1(1)
    for j = 1:s2(1)
        c = [c; c1(i,:)+c2(j,:);];
    end
end

c = CullSets(c);
c = CullPairs(c);
c = CullTriplets(c);
        