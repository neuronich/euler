function c = RemoveWinnablesK4(c)
global pairs
p = unique(pairs);
% Remove singular element
c(sum(c,2)==1,:) = [];
% Remove pairs 
c(sum(c,2)==2,:) = [];

% ind = find(sum(c,2)==2)';
% toDelete = [];
% for i = ind
%     a = find(c(i,:));
%     if diff(mod(a,2))==0 | sum(p==a(1)) | sum(p==a(2)) | abs(diff(a)) == 1
%         toDelete = [toDelete,i];
%     end
% end
% c(toDelete,:) = [];
% c = CullSets(c);