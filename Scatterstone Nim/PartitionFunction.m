% This function splits p into k piles and reduces many symmetries
% Counts format is the format where the columns correspond to numbers starting from 2(not 1) and how many numbers 
% like that in each pile. Each row is a one pile of piles.
function [c,finals] = PartitionFunction(p,k)
% p = 10;
% k = 3;
countsT = partitions(p,1:k);
countsT = cumsum(countsT','reverse')';                 % transpose representation gives you simply all piles
for i = 1:size(countsT,1)                          % encode things in sparse code
    c(i,:) = histcounts(countsT(i,:),1:p+1);   % beats me why it is p+1, but has to be
end

c(:,end) = [];
c(1,:) = [];                                % remove no splitting. i.e first element.
c(:,1) = [];                                % remove ones. After this everything goes from 2:p-1
% counts(sum(counts,2)==0,:) = [];                % remove zero rows. NO. You can't do that! zeros means it's losable!


cold = [];
while 1-isequal(cold,c)
    cold = c;
    c = CullSets(c);
    c = CullPairs(c);
    c = CullTriplets(c,0);
end


finals = [];
% finals = InterpretSets(setsT);