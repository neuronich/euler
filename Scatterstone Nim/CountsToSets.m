% Convert Sets format into direct sets of numbers
function finals = CountsToSets(counts)

finals = cell(size(counts,1),1);
for i = 1:size(counts,1)
    finals{i} = find(counts(i,:))+1;
end