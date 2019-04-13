function counts = CullSets(counts)
counts = mod(counts,2);                           % remove symmetries
[~,ind] = unique(counts*2.^(1:size(counts,2))');  % remove not unique.
counts=counts(ind,:);
