function counts = CullPairs(counts)
global pairs               % reduce fundamental pairs

if ~isempty(counts)
    s2 = size(counts,2);
    
    for i = 1:size(pairs,1)
        if max(pairs(i,:))<=s2
            counts(:,pairs(i,1)) = counts(:,pairs(i,2)) + counts(:,pairs(i,1));
            counts(:,pairs(i,2)) = 0;
        end
    end
    
    counts = CullSets(counts);
end