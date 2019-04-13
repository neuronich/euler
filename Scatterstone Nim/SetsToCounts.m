% Assumption that all sets contain unique elements only as well as no zeros and ones
function c = SetsToCounts(s)
m = max(cell2mat(s'));
c = zeros(length(s),m-1);
for i = 1:length(s)
        uv = unique(s{i});
        n  = histc(s{i},uv);
        % Make sure the stones don't include any zeros or ones. Optional: Ingore it and wait till c(i,uv-1) throws an error.
        ind = uv<2;
        uv(ind) = []; 
        n(ind) = [];
        
        c(i,uv-1) = n;
end
